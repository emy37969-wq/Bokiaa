import 'package:bokiaa/core/theme/app-colors.dart';
import 'package:bokiaa/core/widgets/app-button.dart';
import 'package:bokiaa/core/widgets/custom-back-button.dart';
import 'package:bokiaa/core/widgets/custom-text-form-faild.dart';
import 'package:bokiaa/feature/ui/forget-password.dart';
import 'package:bokiaa/feature/ui/register-screen.dart';
import 'package:bokiaa/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    body: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
      children: [
        Custombackbutton(),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(LocaleKeys.WelcomeBack.tr(),
              style: TextStyle(fontFamily: "DM",fontSize: 37.sp),
              ),
        ),
        SizedBox(height: 15.h,),
        Customtextformfaild(
          hinttext: LocaleKeys.Email.tr(),
          keyboardtype: TextInputType.emailAddress,
        ),
        SizedBox(height: 15.h,),
                Customtextformfaild(
          hinttext: LocaleKeys.Password.tr(),
          keyboardtype: TextInputType.visiblePassword,
          ispassword: true,
        ),  
        SizedBox(height: 5.h,) ,
InkWell(
  onTap: () {
        Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => Forgetpassword()),
    );

  },
  child: Text
  (LocaleKeys.forget.tr(),
                style: TextStyle(fontFamily: "DM",fontSize: 15.sp,
               color: Color(0xff6A707C) ),
                ),
),
        SizedBox(height: 20.h,),
        Appbutton(),
        SizedBox(height: 7.h,),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text
            (LocaleKeys.or.tr(),
                  style: TextStyle(fontFamily: "DM",fontSize: 15.sp,
                 color: Color(0xff6A707C) ),
                  ),
          ],
        ),
  Container(
   width: double.infinity,
                       padding: EdgeInsets.symmetric(vertical: 19.h),
                       alignment: Alignment.center,
                       decoration: BoxDecoration(
                         border:  Border.all(color: Colors.grey),
                           color: Colors.white, 
                           borderRadius: BorderRadius.circular(8.r)),
                       child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                         children: [
                           Text(
                             LocaleKeys.Google.tr(),
                             style: TextStyle(fontSize: 15.sp,
                              color: Color(0xff6A707C) ,
                           ),
                                                ),
                         ],
                       )),
                     SizedBox(height: 10.h,),
                     Container(
   width: double.infinity,
                       padding: EdgeInsets.symmetric(vertical: 19.h),
                       alignment: Alignment.center,
                       decoration: BoxDecoration(
                         border:  Border.all(color: Colors.grey),
                           color: Colors.white, 
                           borderRadius: BorderRadius.circular(8.r)),
                       child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                         children: [
                          Icon(Icons.apple),
                           Text(
                             LocaleKeys.Apple.tr(),
                             style: TextStyle(fontSize: 15.sp,
                              color: Color(0xff6A707C) 
                           ),
                                                ),
                         ],
                       )),
                     Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text
            (LocaleKeys.not.tr(),
                  style: TextStyle(fontFamily: "DM",fontSize: 15.sp,
                 color:Colors.black ),
                  ),
                  Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            InkWell(
              onTap: () {
                        Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => RegisterScreen()),
    );

              },
              child: Text
              (LocaleKeys.now.tr(),
                    style: TextStyle(fontFamily: "DM",fontSize: 15.sp,
                   color:Appcolors.maincolor ),
                    ),
            ),
          ],
        ),
          ],
        ),
      ],
      ),
    ),

    );

  }
}
