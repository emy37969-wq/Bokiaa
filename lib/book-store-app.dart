import 'package:bokiaa/feature/welcome/ui/widgets/welcome-screen.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Bookstoreapp extends StatelessWidget {
  const Bookstoreapp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode:true,
      child: MaterialApp(
       localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
        home: Welcomescreen(),
      ),
    );
  }
}
