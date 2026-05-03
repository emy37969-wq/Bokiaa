// import 'dart:convert';
// import 'dart:io';
// import 'package:firebase_messaging/firebase_messaging.dart';
// import 'package:flutter_local_notifications/flutter_local_notifications.dart';

// /// Firebase Cloud Messaging service for push notifications
// class FirebaseMessagingService {
//   FirebaseMessagingService._();

//   static final FirebaseMessagingService instance = FirebaseMessagingService._();

//   final FirebaseMessaging _messaging = FirebaseMessaging.instance;
//   final FlutterLocalNotificationsPlugin _localNotifications =
//       FlutterLocalNotificationsPlugin();

//   bool _isInitialized = false;

//   // Notification channels
//   static const String _generalChannelId = 'general_channel';
//   static const String _bookChannelId = 'book_channel';
//   static const String _promotionChannelId = 'promotion_channel';

//   /// Initialize Firebase Messaging
//   Future<void> initialize({
//     Function(RemoteMessage)? onMessage,
//     Function(RemoteMessage)? onMessageOpenedApp,
//     Function(String)? onTokenRefresh,
//   }) async {
//     if (_isInitialized) return;

//     // Request permission for iOS
//     if (Platform.isIOS) {
//       await _messaging.requestPermission(
//         alert: true,
//         badge: true,
//         sound: true,
//         provisional: false,
//       );
//     }

//     // Initialize local notifications
//     await _initializeLocalNotifications();

//     // Get FCM token
//     final token = await getToken();
//     print('FCM Token: $token');

//     // Handle background messages
//     FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

//     // Handle foreground messages
//     FirebaseMessaging.onMessage.listen((RemoteMessage message) {
//       print('Received foreground message: ${message.notification?.title}');
//       _showLocalNotification(message);
//       onMessage?.call(message);
//     });

//     // Handle message opened app
//     FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
//       print('Message opened app: ${message.notification?.title}');
//       onMessageOpenedApp?.call(message);
//     });

//     // Handle token refresh
//     _messaging.onTokenRefresh.listen((String token) {
//       print('FCM Token refreshed: $token');
//       onTokenRefresh?.call(token);
//     });

//     _isInitialized = true;
//   }

//   /// Initialize local notifications
//   Future<void> _initializeLocalNotifications() async {
//     const AndroidInitializationSettings androidSettings =
//         AndroidInitializationSettings('@mipmap/ic_launcher');

//     const DarwinInitializationSettings iosSettings =
//         DarwinInitializationSettings(
//       requestAlertPermission: true,
//       requestBadgePermission: true,
//       requestSoundPermission: true,
//     );

//     const InitializationSettings settings = InitializationSettings(
//       android: androidSettings,
//       iOS: iosSettings,
//     );

//     await _localNotifications.initialize(
//       settings,
//       onDidReceiveNotificationResponse: (NotificationResponse response) {
//         // Handle notification tap
//         print('Notification tapped: ${response.payload}');
//       },
//     );

//     // Create notification channels for Android
//     if (Platform.isAndroid) {
//       await _createNotificationChannels();
//     }
//   }

//   /// Create notification channels for Android
//   Future<void> _createNotificationChannels() async {
//     const AndroidNotificationChannel generalChannel =
//         AndroidNotificationChannel(
//       _generalChannelId,
//       'General Notifications',
//       description: 'General app notifications',
//       importance: Importance.defaultImportance,
//       playSound: true,
//     );

//     const AndroidNotificationChannel bookChannel = AndroidNotificationChannel(
//       _bookChannelId,
//       'Book Updates',
//       description: 'Updates about books and reading',
//       importance: Importance.high,
//       playSound: true,
//     );

//     const AndroidNotificationChannel promotionChannel =
//         AndroidNotificationChannel(
//       _promotionChannelId,
//       'Promotions',
//       description: 'Promotional offers and deals',
//       importance: Importance.high,
//       playSound: true,
//     );

//     await _localNotifications
//         .resolvePlatformSpecificImplementation<
//             AndroidFlutterLocalNotificationsPlugin>()
//         ?.createNotificationChannel(generalChannel);

//     await _localNotifications
//         .resolvePlatformSpecificImplementation<
//             AndroidFlutterLocalNotificationsPlugin>()
//         ?.createNotificationChannel(bookChannel);

//     await _localNotifications
//         .resolvePlatformSpecificImplementation<
//             AndroidFlutterLocalNotificationsPlugin>()
//         ?.createNotificationChannel(promotionChannel);
//   }

//   /// Show local notification
//   Future<void> _showLocalNotification(RemoteMessage message) async {
//     final notification = message.notification;
//     if (notification == null) return;

//     String channelId = _generalChannelId;
//     if (message.data['type'] == 'book') {
//       channelId = _bookChannelId;
//     } else if (message.data['type'] == 'promotion') {
//       channelId = _promotionChannelId;
//     }

//     const AndroidNotificationDetails androidDetails =
//         AndroidNotificationDetails(
//       _generalChannelId,
//       'General Notifications',
//       channelDescription: 'General app notifications',
//       importance: Importance.max,
//       priority: Priority.high,
//       showWhen: true,
//     );

//     const DarwinNotificationDetails iosDetails = DarwinNotificationDetails(
//       presentAlert: true,
//       presentBadge: true,
//       presentSound: true,
//     );

//     const NotificationDetails details = NotificationDetails(
//       android: androidDetails,
//       iOS: iosDetails,
//     );

//     await _localNotifications.show(
//       message.hashCode,
//       notification.title,
//       notification.body,
//       details,
//       payload: jsonEncode(message.data),
//     );
//   }

//   // ── Token Management ────────────────────────────────────────────────────────

//   /// Get FCM token
//   Future<String?> getToken() async {
//     return await _messaging.getToken();
//   }

//   /// Delete FCM token
//   Future<void> deleteToken() async {
//     await _messaging.deleteToken();
//   }

//   /// Subscribe to topic
//   Future<void> subscribeToTopic(String topic) async {
//     await _messaging.subscribeToTopic(topic);
//   }

//   /// Unsubscribe from topic
//   Future<void> unsubscribeFromTopic(String topic) async {
//     await _messaging.unsubscribeFromTopic(topic);
//   }

//   // ── Message Handling ────────────────────────────────────────────────────────

//   /// Get initial message (when app is opened from terminated state)
//   Future<RemoteMessage?> getInitialMessage() async {
//     return await _messaging.getInitialMessage();
//   }

//   /// Set foreground notification presentation options (iOS)
//   Future<void> setForegroundNotificationPresentationOptions({
//     bool alert = true,
//     bool badge = true,
//     bool sound = true,
//   }) async {
//     await _messaging.setForegroundNotificationPresentationOptions(
//       alert: alert,
//       badge: badge,
//       sound: sound,
//     );
//   }

//   // ── Notification Management ─────────────────────────────────────────────────

//   /// Cancel all notifications
//   Future<void> cancelAllNotifications() async {
//     await _localNotifications.cancelAll();
//   }

//   /// Cancel specific notification
//   Future<void> cancelNotification(int id) async {
//     await _localNotifications.cancel(id);
//   }

//   // ── Utility Methods ───────────────────────────────────────────────────────────

//   /// Get Firebase Messaging instance for advanced operations
//   FirebaseMessaging get messaging => _messaging;

//   /// Check if notifications are enabled
//   Future<bool> areNotificationsEnabled() async {
//     if (Platform.isIOS) {
//       final settings = await _messaging.getNotificationSettings();
//       return settings.authorizationStatus == AuthorizationStatus.authorized;
//     }
//     return true; // Android doesn't have a simple way to check this
//   }

//   /// Get notification settings
//   Future<NotificationSettings> getNotificationSettings() async {
//     return await _messaging.getNotificationSettings();
//   }
// }

// /// Background message handler
// @pragma('vm:entry-point')
// Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
//   print('Handling background message: ${message.notification?.title}');
//   // You can perform background tasks here
// }
