# Firebase Integration Documentation

## Overview
This document describes the Firebase integration in the Bokiaa Flutter application, including all services and their usage.

## Services Implemented

### 1. Firebase Core (`firebase_config_service.dart`)
- **Purpose**: Centralized Firebase initialization and configuration
- **Features**:
  - Firebase app initialization
  - Project configuration management
  - Initialization status tracking

### 2. Firebase Authentication (`firebase_auth_service.dart`)
- **Purpose**: User authentication and account management
- **Features**:
  - Email/password authentication
  - Google Sign-In integration
  - User profile management
  - Password reset
  - Account deletion
  - Authentication state monitoring

### 3. Cloud Firestore (`fire_store_service.dart`)
- **Purpose**: NoSQL database for app data
- **Features**:
  - CRUD operations
  - Real-time data streaming
  - Batch operations
  - Transaction support
  - Pagination
  - Data export functionality

### 4. Firebase Storage (`firebase_storage_service.dart`)
- **Purpose**: File storage and management
- **Features**:
  - File upload/download
  - Profile picture management
  - Book image handling
  - Progress tracking
  - Batch uploads

### 5. Firebase Analytics (`firebase_analytics_service.dart`)
- **Purpose**: User behavior tracking and analytics
- **Features**:
  - Custom event logging
  - User property tracking
  - E-commerce events
  - Screen tracking
  - Search analytics

### 6. Firebase Crashlytics (`firebase_crashlytics_service.dart`)
- **Purpose**: Error tracking and crash reporting
- **Features**:
  - Automatic crash reporting
  - Custom error logging
  - User identification
  - Breadcrumb logging

### 7. Firebase Performance (`firebase_performance_service.dart`)
- **Purpose**: App performance monitoring
- **Features**:
  - Custom trace tracking
  - HTTP request monitoring
  - Operation timing
  - Performance metrics

### 8. Firebase Remote Config (`firebase_remote_config_service.dart`)
- **Purpose**: Remote configuration management
- **Features**:
  - Feature flags
  - App configuration
  - A/B testing support
  - Real-time config updates

### 9. Firebase Cloud Messaging (`firebase_messaging_service.dart`)
- **Purpose**: Push notifications
- **Features**:
  - Push notification handling
  - Local notifications
  - Topic subscription
  - Background message handling

## Configuration

### Firebase Options (`firebase_options.dart`)
Contains Firebase configuration for different platforms. **Important**: Replace placeholder values with your actual Firebase project keys.

```dart
// Replace these with your Firebase project keys
static const FirebaseOptions web = FirebaseOptions(
  apiKey: 'your-web-api-key',
  appId: 'your-web-app-id',
  // ...
);
```

### Required Permissions

#### Android (`android/app/src/main/AndroidManifest.xml`)
```xml
<!-- Internet permission -->
<uses-permission android:name="android.permission.INTERNET" />
<uses-permission android:name="android.permission.ACCESS_NETWORK_STATE" />

<!-- Notification permissions -->
<uses-permission android:name="android.permission.POST_NOTIFICATIONS" />
<uses-permission android:name="android.permission.VIBRATE" />

<!-- Storage permissions (if using file uploads) -->
<uses-permission android:name="android.permission.READ_EXTERNAL_STORAGE" />
<uses-permission android:name="android.permission.WRITE_EXTERNAL_STORAGE" />
```

#### iOS (`ios/Runner/Info.plist`)
```xml
<!-- Notification permissions -->
<key>UIBackgroundModes</key>
<array>
    <string>fetch</string>
    <string>remote-notification</string>
</array>

<key>NSUserNotificationsUsageDescription</key>
<string>Allow notifications for important updates</string>

<!-- Camera and photo library (if using image uploads) -->
<key>NSCameraUsageDescription</key>
<string>Allow camera access for profile pictures</string>
<key>NSPhotoLibraryUsageDescription</key>
<string>Allow photo library access for profile pictures</string>
```

## Usage Examples

### Authentication
```dart
// Sign up with email/password
try {
  final user = await FirebaseAuthService.instance.signUp(
    email: 'user@example.com',
    password: 'password123',
    name: 'John Doe',
  );
} catch (e) {
  print('Sign up failed: $e');
}

// Sign in with Google
try {
  final userCredential = await FirebaseAuthService.instance.signInWithGoogle();
} catch (e) {
  print('Google sign in failed: $e');
}
```

### Firestore Operations
```dart
// Add user data
await FirestoreService.instance.addUser({
  'name': 'John Doe',
  'email': 'john@example.com',
  'createdAt': FieldValue.serverTimestamp(),
});

// Stream user data
FirestoreService.instance.streamUser('userId').listen((userData) {
  print('User data: $userData');
});
```

### File Upload
```dart
// Upload profile picture
final imageUrl = await FirebaseStorageService.instance.uploadProfilePicture(
  imageFile: imageFile,
  userId: 'userId',
  onProgress: (progress) => print('Upload progress: $progress'),
);
```

### Analytics Tracking
```dart
// Log book view
await FirebaseAnalyticsService.instance.logBookView(
  bookId: 'book123',
  bookTitle: 'Sample Book',
  category: 'Fiction',
);

// Log purchase
await FirebaseAnalyticsService.instance.logPurchase(
  transactionId: 'txn123',
  items: [analyticsItem],
  total: 29.99,
);
```

### Error Reporting
```dart
// Log custom error
await FirebaseCrashlyticsService.instance.recordError(
  exception,
  stackTrace,
  reason: 'Custom error reason',
);
```

### Performance Monitoring
```dart
// Trace API call
final result = await FirebasePerformanceService.instance.traceApiCall(
  'books/fetch',
  () => apiService.fetchBooks(),
);
```

### Remote Config
```dart
// Check feature flag
if (FirebaseRemoteConfigService.instance.isGoogleSignInEnabled) {
  // Show Google sign in button
}

// Get configuration value
final maxBooks = FirebaseRemoteConfigService.instance.maxBooksPerPage;
```

## Setup Instructions

1. **Create Firebase Project**
   - Go to [Firebase Console](https://console.firebase.google.com/)
   - Create a new project or select existing one

2. **Add Firebase to Flutter App**
   ```bash
   flutter pub add firebase_core
   flutter pub add firebase_auth
   flutter pub add cloud_firestore
   flutter pub add firebase_storage
   flutter pub add firebase_analytics
   flutter pub add firebase_crashlytics
   flutter pub add firebase_performance
   flutter pub add firebase_remote_config
   flutter pub add firebase_messaging
   flutter pub add google_sign_in
   ```

3. **Configure Platforms**
   - Download `google-services.json` for Android
   - Download `GoogleService-Info.plist` for iOS
   - Place files in appropriate directories

4. **Update Firebase Options**
   - Replace placeholder values in `firebase_options.dart` with actual keys

5. **Enable Firebase Services**
   - Authentication
   - Firestore
   - Storage
   - Analytics
   - Crashlytics
   - Performance Monitoring
   - Remote Config
   - Cloud Messaging

## Best Practices

### Security
- Use Firebase Security Rules for Firestore and Storage
- Validate data on both client and server
- Use Firebase App Check for additional security

### Performance
- Enable compression for Storage uploads
- Use pagination for large datasets
- Implement caching strategies
- Monitor performance with Firebase Performance

### Error Handling
- Always wrap Firebase calls in try-catch blocks
- Log errors to Crashlytics
- Provide user-friendly error messages

### Analytics
- Use meaningful event names
- Set user properties for better segmentation
- Track important user journeys

### Testing
- Use Firebase Emulators for local testing
- Test offline scenarios
- Verify error handling

## Troubleshooting

### Common Issues

1. **Firebase not initialized**
   - Ensure `FirebaseConfigService.instance.initializeFirebase()` is called before using other services

2. **Permission denied**
   - Check Firestore/Storage security rules
   - Verify user authentication

3. **Notifications not working**
   - Check platform-specific permissions
   - Verify FCM token generation

4. **Analytics not tracking**
   - Check if analytics is enabled in Remote Config
   - Verify event parameters

### Debug Mode
Enable debug logging for development:
```dart
// In main.dart
FirebaseCrashlytics.instance.setCrashlyticsCollectionEnabled(kDebugMode);
FirebaseAnalytics.instance.setAnalyticsCollectionEnabled(kDebugMode);
```

## Migration Guide

If migrating from existing authentication/database solutions:

1. **Data Migration**
   - Export existing data
   - Transform to Firestore format
   - Import using batch operations

2. **Authentication Migration**
   - Create Firebase accounts for existing users
   - Update password hashes if needed
   - Migrate user profiles

3. **Code Updates**
   - Replace existing service calls with Firebase services
   - Update data models to match Firestore structure
   - Add error handling for Firebase exceptions

## Support

For Firebase-related issues:
- [Firebase Documentation](https://firebase.google.com/docs)
- [Firebase Console](https://console.firebase.google.com/)
- [FlutterFire Documentation](https://firebase.google.com/docs/flutter/setup)

For app-specific issues, check the service documentation in the codebase.