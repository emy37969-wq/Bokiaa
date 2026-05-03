import 'package:bokiaa/book-store-app.dart';
import 'package:bokiaa/core/helper/app-constants.dart';
import 'package:bokiaa/core/helper/storage_service.dart';
import 'package:bokiaa/core/ntework/dio-helper.dart';
import 'package:bokiaa/core/ntework/dio_factory.dart';
import 'package:bokiaa/core/ntework/firebase_config_service.dart';
import 'package:bokiaa/core/ntework/firebase_crashlytics_service.dart';
import 'package:bokiaa/core/ntework/firebase_messaging_service.dart';
import 'package:bokiaa/core/theme/cupit/theme_cupit.dart';
import 'package:bokiaa/core/theme/data/theme_local_data_source.dart';
import 'package:bokiaa/feature/auth/cubit/auth-cubit.dart';
import 'package:bokiaa/feature/profile/cupit/profile_cupit.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';

// تعريف navigatorKey هنا
final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize Firebase
  // await FirebaseConfigService.instance.initializeFirebase();

  // Initialize Firebase services
  // await FirebaseCrashlyticsService.instance.initialize();
  // await FirebaseRemoteConfigService.instance.initialize();

  // Initialize Firebase Messaging
  // await FirebaseMessagingService.instance.initialize();

  await EasyLocalization.ensureInitialized();
  await Hive.initFlutter();
  await StorageService.init();
  await DioFactory.initDio();

  final SharedPreferences prefs = await SharedPreferences.getInstance();
  AppConstants.token = prefs.getString("token");
  Diohelper.init();

  // تهيئة ThemeLocalDataSource
  final themeLocalDataSource = ThemeLocalDataSource();
  await themeLocalDataSource.init();

  runApp(EasyLocalization(
      supportedLocales: [Locale('en'), Locale('ar')],
      path: 'assets/translations',
      fallbackLocale: Locale('en'),
      child: MultiBlocProvider(providers: [
        BlocProvider<Authcubit>(
          create: (context) => Authcubit(),
        ),
        BlocProvider<ProfileCubit>(
          create: (context) => ProfileCubit(),
        ),
        BlocProvider<ThemeCubit>(
          create: (context) => ThemeCubit(themeLocalDataSource),
        ),
        // لو عندك Cubits تانية ضيفها هنا
      ], child: Bookstoreapp())));
}

// // flutter pub run easy_localization:generate -S assets/translations -O lib/gen/translations -o  locale_keys.g.dart -f keys
// // dart run build_runner build --delete-conflicting-outputs

// import 'package:bookia/bookia_app.dart';
// import 'package:bookia/core/helper/bloc_observer.dart';
// import 'package:bookia/core/helper/storage_services.dart';
// import 'package:bookia/core/networking/dio_factory.dart';
// import 'package:bookia/core/theme/cubit/theme_cubit.dart';
// import 'package:bookia/core/theme/data/theme_local_data_source.dart';
// import 'package:bookia/firebase_options.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:hive/hive.dart';
// import 'package:hive_flutter/hive_flutter.dart';

// Future<void> main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   // await Hive.initFlutter(); // FIRST
//   // await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
//   Bloc.observer = MyBlocObserver();
//   // await StorageService.init();
//   await DioFactory.initDio();
//   await ScreenUtil.ensureScreenSize();
//   final themeLocalDataSource = ThemeLocalDataSource();
//   await themeLocalDataSource.init();

//   runApp(
//     BlocProvider(
//       create: (_) => ThemeCubit(themeLocalDataSource),
//       child: BookiaApp(token: StorageService.getToken()),
//     ),
//   );
//   //TODO: add the payment feature to the app
// }
