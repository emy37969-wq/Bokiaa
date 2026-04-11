// import 'package:bokiaa/book-store-app.dart';
// import 'package:easy_localization/easy_localization.dart';
// import 'package:flutter/material.dart';

// void main() async{
//     WidgetsFlutterBinding.ensureInitialized();
//   await EasyLocalization.ensureInitialized();

//   runApp(
//     EasyLocalization(
//       supportedLocales: [Locale('en'), Locale('ar')],
//       path: 'assets/translations',
//       fallbackLocale: Locale('en'),
//       child: Bookstoreapp()
//     ),
//   );

// }

import 'package:bokiaa/book-store-app.dart';
import 'package:bokiaa/core/helper/app-constants.dart';
import 'package:bokiaa/core/ntework/dio-helper.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  AppConstants.token=prefs.getString("token");
  Diohelper.init();
  runApp(EasyLocalization(
      supportedLocales: [Locale('en'), Locale('ar')],
      path: 'assets/translations',
      fallbackLocale: Locale('en'),
      child: Bookstoreapp()));
}

// flutter pub run easy_localization:generate -S assets/translations -O lib/gen/translations -o  locale_keys.g.dart -f keys
// dart run build_runner build --delete-conflicting-outputs
