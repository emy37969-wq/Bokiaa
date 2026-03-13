import 'package:bokiaa/core/theme/app-colors.dart';
import 'package:bokiaa/core/widgets/app-button.dart';
import 'package:bokiaa/core/widgets/custom-back-button.dart';
import 'package:bokiaa/core/widgets/custom-text-form-faild.dart';
import 'package:bokiaa/feature/ui/login-screen.dart';
import 'package:bokiaa/feature/ui/otp-screen.dart';
import 'package:bokiaa/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Forgetpassword extends StatelessWidget {
  const Forgetpassword({super.key});

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
  child: Align(
    alignment: Alignment.centerLeft, 
    child: Text(
      LocaleKeys.forget.tr(),
      style: TextStyle(
        fontFamily: "DM",
        fontSize: 30.sp,
      ),
    ),
  ),
),       Text
             (LocaleKeys.dontworry.tr(),
                style: TextStyle(fontFamily: "DM",fontSize: 15.sp,
               color: Color(0xff6A707C) ),
                ),
        SizedBox(height: 20.h,),
        Customtextformfaild(
          hinttext: LocaleKeys.Email.tr(),
          keyboardtype: TextInputType.emailAddress,
        ),
        SizedBox(height: 35.h,),
  Container(
   width: double.infinity,
       padding: EdgeInsets.symmetric(vertical: 19.h),
              alignment: Alignment.center,
         decoration: BoxDecoration(
                         border:  Border.all(color: Appcolors.maincolor),
            color: Appcolors.maincolor, 
             borderRadius: BorderRadius.circular(8.r)),
            child: Row(
             mainAxisAlignment: MainAxisAlignment.center,
          children: [
           InkWell(
                onTap: () {
        Navigator.push(context,
      MaterialPageRoute(builder: (_) =>Otpscreen()),
          );
            },
             child: Text(
               LocaleKeys.sendcode.tr(),
               style: TextStyle(fontSize: 15.sp,
                color: Colors.white ,
                             ),
                              ),
           ),
                         ],
                       )),
        SizedBox(height: 280.h,),
        
                     Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text
            (LocaleKeys.remember.tr(),
                  style: TextStyle(fontFamily: "DM",fontSize: 15.sp,
                 color: Colors.black),
                  ),
                  Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            InkWell(
              onTap: () {
        Navigator.push(context,
      MaterialPageRoute(builder: (_) =>LoginScreen()),
          );},
              child: Text
              (LocaleKeys.Login.tr(),
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
