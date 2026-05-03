import 'package:firebase_core/firebase_core.dart';
import 'package:bokiaa/firebase_options.dart';

/// Firebase configuration and initialization service
class FirebaseConfigService {
  FirebaseConfigService._();

  static final FirebaseConfigService instance = FirebaseConfigService._();

  bool _isInitialized = false;

  /// Check if Firebase is initialized
  bool get isInitialized => _isInitialized;

  /// Initialize Firebase
  Future<void> initializeFirebase() async {
    if (_isInitialized) return;

    try {
      await Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform,
      );
      _isInitialized = true;
    } catch (e) {
      throw Exception('Failed to initialize Firebase: $e');
    }
  }

  /// Re-initialize Firebase (useful for testing)
  Future<void> reInitializeFirebase() async {
    _isInitialized = false;
    await initializeFirebase();
  }

  /// Get Firebase app instance
  FirebaseApp get app {
    if (!_isInitialized) {
      throw Exception(
          'Firebase is not initialized. Call initializeFirebase() first.');
    }
    return Firebase.app();
  }

  /// Get Firebase project ID
  String get projectId => DefaultFirebaseOptions.currentPlatform.projectId;

  /// Get Firebase options
  FirebaseOptions get options => DefaultFirebaseOptions.currentPlatform;
}
