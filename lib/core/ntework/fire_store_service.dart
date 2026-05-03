import 'dart:async';
import 'package:bokiaa/feature/auth/data/models/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

/// Custom exceptions for better error handling
class FirestoreException implements Exception {
  final String message;
  final String? code;

  FirestoreException(this.message, {this.code});

  @override
  String toString() =>
      'FirestoreException: $message${code != null ? ' (Code: $code)' : ''}';
}

class FirestoreService {
  FirestoreService._();

  static final FirestoreService instance = FirestoreService._();

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // ── Collection reference ──────────────────────────────────────────────────────

  CollectionReference<Map<String, dynamic>> get _usersCollection =>
      _firestore.collection('users');

  // ── Connection Status ─────────────────────────────────────────────────────────

  /// Check if Firestore is available
  Future<bool> isConnected() async {
    try {
      await _firestore.collection('test').doc('test').get();
      return true;
    } catch (e) {
      return false;
    }
  }

  // ── Add User ──────────────────────────────────────────────────────────────────

  /// Called right after Firebase Auth creates the account.
  /// Uses the uid as the document ID so lookups are always O(1).
  Future<void> addUser(UserModel user) async {
    try {
      await _usersCollection.doc(user.uid).set(user.toMap());
    } on FirebaseException catch (e) {
      throw FirestoreException('Failed to add user: ${e.message}',
          code: e.code);
    } catch (e) {
      throw FirestoreException('Failed to add user: $e');
    }
  }

  // ── Get User ──────────────────────────────────────────────────────────────────

  /// Fetches a single user document by uid.
  /// Returns null if the document doesn't exist.
  Future<UserModel?> getUser(String uid) async {
    try {
      final doc = await _usersCollection.doc(uid).get();

      if (!doc.exists || doc.data() == null) return null;

      return UserModel.fromMap(doc.data()!);
    } on FirebaseException catch (e) {
      throw FirestoreException('Failed to get user: ${e.message}',
          code: e.code);
    } catch (e) {
      throw FirestoreException('Failed to get user: $e');
    }
  }

  // ── Stream User ───────────────────────────────────────────────────────────────

  /// Stream a single user document for real-time updates.
  Stream<UserModel?> streamUser(String uid) {
    return _usersCollection.doc(uid).snapshots().map((doc) {
      if (!doc.exists || doc.data() == null) return null;
      return UserModel.fromMap(doc.data()!);
    });
  }

  // ── Update User ───────────────────────────────────────────────────────────────

  /// Merges the provided fields into the existing document.
  /// Only the provided fields are updated, the rest stay untouched.
  Future<void> updateUser(String uid, Map<String, dynamic> fields) async {
    try {
      await _usersCollection.doc(uid).update(fields);
    } on FirebaseException catch (e) {
      throw FirestoreException('Failed to update user: ${e.message}',
          code: e.code);
    } catch (e) {
      throw FirestoreException('Failed to update user: $e');
    }
  }

  // ── Update User with Transaction ──────────────────────────────────────────────

  /// Updates user with transaction for atomic operations
  Future<void> updateUserTransaction(
      String uid, Map<String, dynamic> fields) async {
    try {
      await _firestore.runTransaction((transaction) async {
        final docRef = _usersCollection.doc(uid);
        final doc = await transaction.get(docRef);

        if (!doc.exists) {
          throw FirestoreException('User not found');
        }

        transaction.update(docRef, fields);
      });
    } on FirebaseException catch (e) {
      throw FirestoreException('Failed to update user: ${e.message}',
          code: e.code);
    } catch (e) {
      throw FirestoreException('Failed to update user: $e');
    }
  }

  // ── Delete User ───────────────────────────────────────────────────────────────

  Future<void> deleteUser(String uid) async {
    try {
      await _usersCollection.doc(uid).delete();
    } on FirebaseException catch (e) {
      throw FirestoreException('Failed to delete user: ${e.message}',
          code: e.code);
    } catch (e) {
      throw FirestoreException('Failed to delete user: $e');
    }
  }

  // ── Check if User Exists ──────────────────────────────────────────────────────

  Future<bool> userExists(String uid) async {
    try {
      final doc = await _usersCollection.doc(uid).get();
      return doc.exists;
    } on FirebaseException catch (e) {
      throw FirestoreException('Failed to check user existence: ${e.message}',
          code: e.code);
    } catch (e) {
      throw FirestoreException('Failed to check user existence: $e');
    }
  }

  // ── Get All Users ─────────────────────────────────────────────────────────────

  Future<List<UserModel>> getAllUsers() async {
    try {
      final querySnapshot = await _usersCollection.get();
      return querySnapshot.docs
          .map((doc) => UserModel.fromMap(doc.data()))
          .toList();
    } on FirebaseException catch (e) {
      throw FirestoreException('Failed to get all users: ${e.message}',
          code: e.code);
    } catch (e) {
      throw FirestoreException('Failed to get all users: $e');
    }
  }

  // ── Get Users with Pagination ─────────────────────────────────────────────────

  Future<List<UserModel>> getUsersPaginated({
    int limit = 20,
    DocumentSnapshot? startAfter,
  }) async {
    try {
      Query<Map<String, dynamic>> query = _usersCollection.limit(limit);

      if (startAfter != null) {
        query = query.startAfterDocument(startAfter);
      }

      final querySnapshot = await query.get();
      return querySnapshot.docs
          .map((doc) => UserModel.fromMap(doc.data()))
          .toList();
    } on FirebaseException catch (e) {
      throw FirestoreException('Failed to get users: ${e.message}',
          code: e.code);
    } catch (e) {
      throw FirestoreException('Failed to get users: $e');
    }
  }

  // ── Search Users ──────────────────────────────────────────────────────────────

  Future<List<UserModel>> searchUsers(
    String query, {
    int limit = 10,
  }) async {
    try {
      // Note: This is a simple search. For better search, consider using Algolia or ElasticSearch
      final querySnapshot = await _usersCollection
          .where('name', isGreaterThanOrEqualTo: query)
          .where('name', isLessThanOrEqualTo: '$query\uf8ff')
          .limit(limit)
          .get();

      return querySnapshot.docs
          .map((doc) => UserModel.fromMap(doc.data()))
          .toList();
    } on FirebaseException catch (e) {
      throw FirestoreException('Failed to search users: ${e.message}',
          code: e.code);
    } catch (e) {
      throw FirestoreException('Failed to search users: $e');
    }
  }

  // ── Batch Operations ──────────────────────────────────────────────────────────

  /// Add multiple users in a batch
  Future<void> addUsersBatch(List<UserModel> users) async {
    try {
      final batch = _firestore.batch();

      for (final user in users) {
        batch.set(_usersCollection.doc(user.uid), user.toMap());
      }

      await batch.commit();
    } on FirebaseException catch (e) {
      throw FirestoreException('Failed to add users batch: ${e.message}',
          code: e.code);
    } catch (e) {
      throw FirestoreException('Failed to add users batch: $e');
    }
  }

  /// Delete multiple users in a batch
  Future<void> deleteUsersBatch(List<String> uids) async {
    try {
      final batch = _firestore.batch();

      for (final uid in uids) {
        batch.delete(_usersCollection.doc(uid));
      }

      await batch.commit();
    } on FirebaseException catch (e) {
      throw FirestoreException('Failed to delete users batch: ${e.message}',
          code: e.code);
    } catch (e) {
      throw FirestoreException('Failed to delete users batch: $e');
    }
  }

  // ── Stream All Users ──────────────────────────────────────────────────────────

  /// Stream all users for real-time updates
  Stream<List<UserModel>> streamAllUsers() {
    return _usersCollection.snapshots().map((querySnapshot) {
      return querySnapshot.docs
          .map((doc) => UserModel.fromMap(doc.data()))
          .toList();
    });
  }

  // ── Backup & Restore ──────────────────────────────────────────────────────────

  /// Export all users data
  Future<Map<String, dynamic>> exportUsers() async {
    try {
      final users = await getAllUsers();
      return {
        'exportedAt': DateTime.now().toIso8601String(),
        'users': users.map((user) => user.toMap()).toList(),
      };
    } catch (e) {
      throw FirestoreException('Failed to export users: $e');
    }
  }

  /// Import users data (use with caution)
  Future<void> importUsers(List<Map<String, dynamic>> usersData) async {
    try {
      final batch = _firestore.batch();

      for (final userData in usersData) {
        final user = UserModel.fromMap(userData);
        batch.set(_usersCollection.doc(user.uid), user.toMap());
      }

      await batch.commit();
    } on FirebaseException catch (e) {
      throw FirestoreException('Failed to import users: ${e.message}',
          code: e.code);
    } catch (e) {
      throw FirestoreException('Failed to import users: $e');
    }
  }

  // ── Utility Methods ───────────────────────────────────────────────────────────

  /// Get collection reference for advanced queries
  CollectionReference<Map<String, dynamic>> get usersCollection =>
      _usersCollection;

  /// Get firestore instance for advanced operations
  FirebaseFirestore get firestore => _firestore;
}
