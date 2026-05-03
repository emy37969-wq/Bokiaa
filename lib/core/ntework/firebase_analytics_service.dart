// import 'package:firebase_analytics/firebase_analytics.dart';

// /// Firebase Analytics service for tracking user events and behavior
// class FirebaseAnalyticsService {
//   FirebaseAnalyticsService._();

//   static final FirebaseAnalyticsService instance = FirebaseAnalyticsService._();

//   final FirebaseAnalytics _analytics = FirebaseAnalytics.instance;

//   // ── User Properties ──────────────────────────────────────────────────────────

//   /// Set user ID
//   Future<void> setUserId(String userId) async {
//     await _analytics.setUserId(id: userId);
//   }

//   /// Set user property
//   Future<void> setUserProperty({
//     required String name,
//     required String value,
//   }) async {
//     await _analytics.setUserProperty(name: name, value: value);
//   }

//   /// Set multiple user properties
//   Future<void> setUserProperties(Map<String, String> properties) async {
//     for (final entry in properties.entries) {
//       await setUserProperty(name: entry.key, value: entry.value);
//     }
//   }

//   // ── Events ───────────────────────────────────────────────────────────────────

//   /// Log custom event
//   Future<void> logEvent({
//     required String name,
//     Map<String, Object>? parameters,
//   }) async {
//     await _analytics.logEvent(
//       name: name,
//       parameters: parameters,
//     );
//   }

//   // ── Authentication Events ────────────────────────────────────────────────────

//   /// Log sign up event
//   Future<void> logSignUp({
//     required String method,
//     String? userId,
//   }) async {
//     if (userId != null) {
//       await setUserId(userId);
//     }

//     await _analytics.logSignUp(signUpMethod: method);
//   }

//   /// Log login event
//   Future<void> logLogin({
//     required String method,
//     String? userId,
//   }) async {
//     if (userId != null) {
//       await setUserId(userId);
//     }

//     await _analytics.logLogin(loginMethod: method);
//   }

//   /// Log logout event
//   Future<void> logLogout() async {
//     await _analytics.logEvent(name: 'logout');
//   }

//   // ── E-commerce Events ────────────────────────────────────────────────────────

//   /// Log view item event
//   Future<void> logViewItem({
//     required String itemId,
//     required String itemName,
//     String? itemCategory,
//     double? price,
//     String? currency = 'USD',
//   }) async {
//     await _analytics.logViewItem(
//       items: [
//         AnalyticsEventItem(
//           itemId: itemId,
//           itemName: itemName,
//           itemCategory: itemCategory,
//           price: price,
//         ),
//       ],
//       currency: currency,
//     );
//   }

//   /// Log add to cart event
//   Future<void> logAddToCart({
//     required String itemId,
//     required String itemName,
//     String? itemCategory,
//     double? price,
//     int? quantity = 1,
//     String? currency = 'USD',
//   }) async {
//     await _analytics.logAddToCart(
//       items: [
//         AnalyticsEventItem(
//           itemId: itemId,
//           itemName: itemName,
//           itemCategory: itemCategory,
//           price: price,
//           quantity: quantity,
//         ),
//       ],
//       currency: currency,
//     );
//   }

//   /// Log remove from cart event
//   Future<void> logRemoveFromCart({
//     required String itemId,
//     required String itemName,
//     String? itemCategory,
//     double? price,
//     int? quantity = 1,
//     String? currency = 'USD',
//   }) async {
//     await _analytics.logRemoveFromCart(
//       items: [
//         AnalyticsEventItem(
//           itemId: itemId,
//           itemName: itemName,
//           itemCategory: itemCategory,
//           price: price,
//           quantity: quantity,
//         ),
//       ],
//       currency: currency,
//     );
//   }

//   /// Log begin checkout event
//   Future<void> logBeginCheckout({
//     required List<AnalyticsEventItem> items,
//     double? total,
//     String? currency = 'USD',
//   }) async {
//     await _analytics.logBeginCheckout(
//       items: items,
//       value: total,
//       currency: currency,
//     );
//   }

//   /// Log purchase event
//   Future<void> logPurchase({
//     required String transactionId,
//     required List<AnalyticsEventItem> items,
//     double? total,
//     String? currency = 'USD',
//   }) async {
//     await _analytics.logPurchase(
//       transactionId: transactionId,
//       items: items,
//       value: total,
//       currency: currency,
//     );
//   }

//   // ── Search Events ────────────────────────────────────────────────────────────

//   /// Log search event
//   Future<void> logSearch({
//     required String searchTerm,
//     int? numberOfResults,
//   }) async {
//     await _analytics.logSearch(
//       searchTerm: searchTerm,
//       numberOfResults: numberOfResults,
//     );
//   }

//   // ── Screen Tracking ──────────────────────────────────────────────────────────

//   /// Set current screen
//   Future<void> setCurrentScreen({
//     required String screenName,
//     String? screenClass,
//   }) async {
//     await _analytics.setCurrentScreen(
//       screenName: screenName,
//       screenClassOverride: screenClass,
//     );
//   }

//   // ── App Events ───────────────────────────────────────────────────────────────

//   /// Log app open
//   Future<void> logAppOpen() async {
//     await _analytics.logAppOpen();
//   }

//   /// Log first open
//   Future<void> logFirstOpen() async {
//     await _analytics.logEvent(name: 'first_open');
//   }

//   // ── Error Tracking ───────────────────────────────────────────────────────────

//   /// Log error event
//   Future<void> logError({
//     required String errorMessage,
//     String? errorCode,
//     String? stackTrace,
//   }) async {
//     await _analytics.logEvent(
//       name: 'error',
//       parameters: {
//         'error_message': errorMessage,
//         'error_code': errorCode ?? 'unknown',
//         'stack_trace': stackTrace ?? '',
//       },
//     );
//   }

//   // ── Custom Events ────────────────────────────────────────────────────────────

//   /// Log book view event
//   Future<void> logBookView({
//     required String bookId,
//     required String bookTitle,
//     String? author,
//     String? category,
//   }) async {
//     await logEvent(
//       name: 'book_view',
//       parameters: {
//         'book_id': bookId,
//         'book_title': bookTitle,
//         'author': author ?? '',
//         'category': category ?? '',
//       },
//     );
//   }

//   /// Log wishlist add event
//   Future<void> logWishlistAdd({
//     required String bookId,
//     required String bookTitle,
//   }) async {
//     await logEvent(
//       name: 'wishlist_add',
//       parameters: {
//         'book_id': bookId,
//         'book_title': bookTitle,
//       },
//     );
//   }

//   /// Log wishlist remove event
//   Future<void> logWishlistRemove({
//     required String bookId,
//     required String bookTitle,
//   }) async {
//     await logEvent(
//       name: 'wishlist_remove',
//       parameters: {
//         'book_id': bookId,
//         'book_title': bookTitle,
//       },
//     );
//   }

//   // ── Utility Methods ───────────────────────────────────────────────────────────

//   /// Get Firebase Analytics instance for advanced operations
//   FirebaseAnalytics get analytics => _analytics;

//   /// Enable/disable analytics collection
//   Future<void> setAnalyticsCollectionEnabled(bool enabled) async {
//     await _analytics.setAnalyticsCollectionEnabled(enabled);
//   }

//   /// Reset analytics data
//   Future<void> resetAnalyticsData() async {
//     await _analytics.resetAnalyticsData();
//   }
// }
