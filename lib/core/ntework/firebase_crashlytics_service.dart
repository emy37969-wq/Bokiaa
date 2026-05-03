// import 'dart:ui';

// import 'package:firebase_crashlytics/firebase_crashlytics.dart';
// import 'package:flutter/material.dart';

// /// Firebase Crashlytics service for error tracking and crash reporting
// class FirebaseCrashlyticsService {
//   FirebaseCrashlyticsService._();

//   static final FirebaseCrashlyticsService instance =
//       FirebaseCrashlyticsService._();

//   // final FirebaseCrashlytics _crashlytics = FirebaseCrashlytics.instance;

//   bool _isInitialized = false;

//   /// Initialize Crashlytics
//   Future<void> initialize() async {
//     if (_isInitialized) return;

//     // Pass all uncaught "fatal" errors from the framework to Crashlytics
//     FlutterError.onError = _crashlytics.recordFlutterFatalError;

//     // Pass all uncaught asynchronous errors that aren't handled by the Flutter framework to Crashlytics
//     PlatformDispatcher.instance.onError = (error, stack) {
//       _crashlytics.recordError(error, stack, fatal: true);
//       return true;
//     };

//     _isInitialized = true;
//   }

//   // ── Error Recording ──────────────────────────────────────────────────────────

//   /// Record a caught exception
//   Future<void> recordError(
//     dynamic exception,
//     StackTrace? stack, {
//     String? reason,
//     Iterable<Object> information = const [],
//     bool? printDetails,
//     bool fatal = false,
//   }) async {
//     await _crashlytics.recordError(
//       exception,
//       stack,
//       reason: reason,
//       information: information,
//       printDetails: printDetails,
//       fatal: fatal,
//     );
//   }

//   /// Record a Flutter error
//   Future<void> recordFlutterError(
//       FlutterErrorDetails flutterErrorDetails) async {
//     await _crashlytics.recordFlutterError(flutterErrorDetails);
//   }

//   // ── User Information ─────────────────────────────────────────────────────────

//   /// Set user identifier
//   Future<void> setUserIdentifier(String identifier) async {
//     await _crashlytics.setUserIdentifier(identifier);
//   }

//   /// Set user email
//   Future<void> setUserEmail(String email) async {
//     await _crashlytics.setCustomKey('user_email', email);
//   }

//   /// Set user name
//   Future<void> setUserName(String name) async {
//     await _crashlytics.setCustomKey('user_name', name);
//   }

//   /// Set multiple user properties
//   Future<void> setUserProperties(Map<String, dynamic> properties) async {
//     for (final entry in properties.entries) {
//       await setCustomKey(entry.key, entry.value);
//     }
//   }

//   // ── Custom Keys ─────────────────────────────────────────────────────────────

//   /// Set a custom key/value pair
//   Future<void> setCustomKey(String key, Object value) async {
//     await _crashlytics.setCustomKey(key, value);
//   }

//   /// Set multiple custom keys
//   Future<void> setCustomKeys(Map<String, Object> keys) async {
//     for (final entry in keys.entries) {
//       await setCustomKey(entry.key, entry.value);
//     }
//   }

//   // ── Breadcrumb Logging ──────────────────────────────────────────────────────

//   /// Log a breadcrumb for debugging
//   Future<void> log(String message) async {
//     await _crashlytics.log(message);
//   }

//   /// Log navigation breadcrumb
//   Future<void> logNavigation(String screenName, {String? parameters}) async {
//     final message =
//         'Navigation: $screenName${parameters != null ? ' ($parameters)' : ''}';
//     await log(message);
//   }

//   /// Log user action breadcrumb
//   Future<void> logUserAction(String action, {String? details}) async {
//     final message =
//         'User Action: $action${details != null ? ' - $details' : ''}';
//     await log(message);
//   }

//   /// Log API call breadcrumb
//   Future<void> logApiCall(String endpoint,
//       {String? method, int? statusCode}) async {
//     final message =
//         'API Call: ${method ?? 'GET'} $endpoint${statusCode != null ? ' (Status: $statusCode)' : ''}';
//     await log(message);
//   }

//   // ── Utility Methods ───────────────────────────────────────────────────────────

//   /// Get Firebase Crashlytics instance for advanced operations
//   FirebaseCrashlytics get crashlytics => _crashlytics;

//   /// Check if Crashlytics is enabled
//   // Future<bool> isCrashlyticsCollectionEnabled() async {
//   //   return await _crashlytics.isCrashlyticsCollectionEnabled();
//   // }

//   /// Enable/disable Crashlytics collection
//   Future<void> setCrashlyticsCollectionEnabled(bool enabled) async {
//     await _crashlytics.setCrashlyticsCollectionEnabled(enabled);
//   }

//   /// Delete all unsent reports
//   Future<void> deleteUnsentReports() async {
//     await _crashlytics.deleteUnsentReports();
//   }

//   /// Send unsent reports
//   Future<void> sendUnsentReports() async {
//     await _crashlytics.sendUnsentReports();
//   }

//   /// Check if a crash occurred in the previous session
//   Future<bool> didCrashOnPreviousExecution() async {
//     return await _crashlytics.didCrashOnPreviousExecution();
//   }
// }
