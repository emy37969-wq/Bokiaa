// //flutter pub run easy_localization:generate -S assets/translations -f keys -o locale_keys.g.dart

import 'package:bokiaa/core/widgets/app-button.dart';
import 'package:bokiaa/core/widgets/routes/app-routes.dart';
import 'package:bokiaa/feature/auth/ui/login-screen.dart';
import 'package:bokiaa/feature/auth/ui/register-screen.dart';
import 'package:bokiaa/gen/assets.gen.dart';
import 'package:bokiaa/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(horizontal: 22.w),
        decoration: BoxDecoration(
          image: DecorationImage(
              image: Assets.images.bok.image().image, fit: BoxFit.cover),
        ),
        child: Column(
          children: [
            SizedBox(
              height: 30.h,
            ),
            SizedBox(
              height: 90.h,
            ),
            Image.asset("assets/images/logo 2.png"),
            SizedBox(
              height: 10.h,
            ),
            Expanded(
              child: Text(
                LocaleKeys.OrderNow.tr(),
                style: TextStyle(fontSize: 20.sp),
              ),
            ),
            IconButton(
                onPressed: () {
                  if (context.locale.languageCode == "ar") {
                    context.setLocale(Locale("en"));
                  } else {
                    context.setLocale(Locale("ar"));
                  }
                },
                icon: Icon(Icons.language)),
            SizedBox(
              height: 210.h,
            ),
            Appbutton(
              title: LocaleKeys.Login.tr(),
              onTap: () {
                // Navigator.pushNamed(context, AppRoutes.login);
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => LoginScreen()));
              },
            ),
            SizedBox(
              height: 15.h,
            ),
            Appbutton(
              title: LocaleKeys.Register.tr(),
              backgroundColor: Colors.white,
              onTap: () {
                // Navigator.pushNamed(context, AppRoutes.register);
                                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => RegisterScreen()));

              },
            ),
            SizedBox(
              height: 94.h,
            )
          ],
        ),
      ),
    );
  }
}
