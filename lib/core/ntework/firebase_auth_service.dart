import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:bokiaa/feature/auth/data/models/user_model.dart';

/// Custom exceptions for Firebase Auth
class AuthException implements Exception {
  final String message;
  final String? code;

  AuthException(this.message, {this.code});

  @override
  String toString() =>
      'AuthException: $message${code != null ? ' (Code: $code)' : ''}';
}

class FirebaseAuthService {
  FirebaseAuthService._();

  static final FirebaseAuthService instance = FirebaseAuthService._();

  final FirebaseAuth _auth = FirebaseAuth.instance;

  // ── Auth State Stream ─────────────────────────────────────────────────────────

  /// Stream of authentication state changes
  Stream<User?> get authStateChanges => _auth.authStateChanges();

  /// Stream of user changes (includes profile updates)
  Stream<User?> get userChanges => _auth.userChanges();

  /// Stream of ID token changes
  Stream<User?> get idTokenChanges => _auth.idTokenChanges();

  // ── Current User ─────────────────────────────────────────────────────────────

  /// Get current user
  User? get currentUser => _auth.currentUser;

  /// Check if user is signed in
  bool get isSignedIn => currentUser != null;

  // ── Sign Up ──────────────────────────────────────────────────────────────────

  /// Create a new user account with email and password
  Future<UserCredential> signUp({
    required String email,
    required String password,
    required String name,
  }) async {
    try {
      final credential = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      // Update display name
      await credential.user?.updateDisplayName(name);

      return credential;
    } on FirebaseAuthException catch (e) {
      throw AuthException(_getAuthErrorMessage(e.code), code: e.code);
    } catch (e) {
      throw AuthException('Failed to sign up: $e');
    }
  }

  // ── Sign In ──────────────────────────────────────────────────────────────────

  /// Sign in with email and password
  Future<UserCredential> signIn({
    required String email,
    required String password,
  }) async {
    try {
      return await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on FirebaseAuthException catch (e) {
      throw AuthException(_getAuthErrorMessage(e.code), code: e.code);
    } catch (e) {
      throw AuthException('Failed to sign in: $e');
    }
  }

  // ── Sign In with Google ───────────────────────────────────────────────────────

  /// Sign in with Google
  Future<UserCredential> signInWithGoogle() async {
    try {
      // Trigger the authentication flow
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

      if (googleUser == null) {
        throw AuthException('Google sign-in was cancelled');
      }

      // Obtain the auth details from the request
      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;

      // Create a new credential
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      // Once signed in, return the UserCredential
      return await _auth.signInWithCredential(credential);
    } on FirebaseAuthException catch (e) {
      throw AuthException(_getAuthErrorMessage(e.code), code: e.code);
    } catch (e) {
      throw AuthException('Failed to sign in with Google: $e');
    }
  }

  // ── Sign Out ─────────────────────────────────────────────────────────────────

  /// Sign out current user
  Future<void> signOut() async {
    try {
      await _auth.signOut();
    } catch (e) {
      throw AuthException('Failed to sign out: $e');
    }
  }

  // ── Password Reset ────────────────────────────────────────────────────────────

  /// Send password reset email
  Future<void> sendPasswordResetEmail(String email) async {
    try {
      await _auth.sendPasswordResetEmail(email: email);
    } on FirebaseAuthException catch (e) {
      throw AuthException(_getAuthErrorMessage(e.code), code: e.code);
    } catch (e) {
      throw AuthException('Failed to send password reset email: $e');
    }
  }

  // ── Email Verification ────────────────────────────────────────────────────────

  /// Send email verification
  Future<void> sendEmailVerification() async {
    try {
      final user = currentUser;
      if (user != null && !user.emailVerified) {
        await user.sendEmailVerification();
      }
    } catch (e) {
      throw AuthException('Failed to send email verification: $e');
    }
  }

  /// Check if email is verified
  bool get isEmailVerified => currentUser?.emailVerified ?? false;

  /// Reload user data
  Future<void> reloadUser() async {
    try {
      await currentUser?.reload();
    } catch (e) {
      throw AuthException('Failed to reload user: $e');
    }
  }

  // ── Update Profile ────────────────────────────────────────────────────────────

  /// Update user display name
  Future<void> updateDisplayName(String name) async {
    try {
      await currentUser?.updateDisplayName(name);
      await currentUser?.reload();
    } catch (e) {
      throw AuthException('Failed to update display name: $e');
    }
  }

  /// Update user email
  Future<void> updateEmail(String email) async {
    try {
      await currentUser?.updateEmail(email);
      await currentUser?.reload();
    } on FirebaseAuthException catch (e) {
      throw AuthException(_getAuthErrorMessage(e.code), code: e.code);
    } catch (e) {
      throw AuthException('Failed to update email: $e');
    }
  }

  /// Update user password
  Future<void> updatePassword(String password) async {
    try {
      await currentUser?.updatePassword(password);
    } on FirebaseAuthException catch (e) {
      throw AuthException(_getAuthErrorMessage(e.code), code: e.code);
    } catch (e) {
      throw AuthException('Failed to update password: $e');
    }
  }

  // ── Delete Account ────────────────────────────────────────────────────────────

  /// Delete user account
  Future<void> deleteAccount() async {
    try {
      await currentUser?.delete();
    } on FirebaseAuthException catch (e) {
      throw AuthException(_getAuthErrorMessage(e.code), code: e.code);
    } catch (e) {
      throw AuthException('Failed to delete account: $e');
    }
  }

  // ── Re-authenticate ───────────────────────────────────────────────────────────

  /// Re-authenticate user (required for sensitive operations)
  Future<void> reauthenticate(String password) async {
    try {
      final user = currentUser;
      if (user != null && user.email != null) {
        final credential = EmailAuthProvider.credential(
          email: user.email!,
          password: password,
        );
        await user.reauthenticateWithCredential(credential);
      }
    } on FirebaseAuthException catch (e) {
      throw AuthException(_getAuthErrorMessage(e.code), code: e.code);
    } catch (e) {
      throw AuthException('Failed to re-authenticate: $e');
    }
  }

  // ── Utility Methods ───────────────────────────────────────────────────────────

  /// Convert Firebase User to UserModel
  UserModel? getCurrentUserModel() {
    final user = currentUser;
    if (user == null) return null;

    return UserModel(
      uid: user.uid,
      email: user.email ?? '',
      name: user.displayName ?? '',
      photoUrl: user.photoURL,
     isEmailVerified: user.emailVerified,
      createdAt: user.metadata.creationTime,
      lastSignInAt: user.metadata.lastSignInTime,
    );
  }

  /// Get Firebase Auth instance for advanced operations
  FirebaseAuth get auth => _auth;

  // ── Error Messages ────────────────────────────────────────────────────────────

  String _getAuthErrorMessage(String code) {
    switch (code) {
      case 'user-disabled':
        return 'This user account has been disabled.';
      case 'user-not-found':
        return 'No user found with this email.';
      case 'wrong-password':
        return 'Wrong password provided.';
      case 'email-already-in-use':
        return 'An account already exists with this email.';
      case 'invalid-email':
        return 'Invalid email address.';
      case 'operation-not-allowed':
        return 'This operation is not allowed.';
      case 'weak-password':
        return 'The password is too weak.';
      case 'requires-recent-login':
        return 'This operation requires recent authentication. Please sign in again.';
      case 'too-many-requests':
        return 'Too many requests. Please try again later.';
      case 'network-request-failed':
        return 'Network error. Please check your connection.';
      default:
        return 'An authentication error occurred.';
    }
  }
}
