import 'package:bokiaa/core/theme/app-colors.dart';
import 'package:bokiaa/core/widgets/custom-back-button.dart';
import 'package:bokiaa/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Otpscreen extends StatelessWidget {
  const Otpscreen({super.key});

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
                  LocaleKeys.otp.tr(),
                  style: TextStyle(
                    fontFamily: "DM",
                    fontSize: 30.sp,
                  ),
                ),
              ),
            ),
            Text
             (LocaleKeys.entercode.tr(),
                style: TextStyle(fontFamily: "DM",fontSize: 15.sp,
               color: Color(0xff6A707C) ),
                ),
                SizedBox(height: 30.h,),
                Row(
  mainAxisAlignment: MainAxisAlignment.center,
  children: [
    for (int i = 0; i < 5; i++)
      Container(
        margin: EdgeInsets.all(4),
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          border: Border.all(color: Appcolors.maincolor, width: 2),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Text(
          "5",
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    Container(
      margin: EdgeInsets.all(4),
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        border: Border.all(color: Appcolors.greycolor, width: 2),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(
        "", 
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
    ),
  ],
),
SizedBox(height: 20.h,),
           Container(
   width: double.infinity,
                       padding: EdgeInsets.symmetric(vertical: 19.h),
                       alignment: Alignment.center,
                       decoration: BoxDecoration(
                         border:  Border.all(color: Colors.grey),
                           color:Appcolors.maincolor, 
                           borderRadius: BorderRadius.circular(8.r)),
                       child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                         children: [
                           Text(
                             LocaleKeys.Verify.tr(),
                             style: TextStyle(fontSize: 15.sp,
                              color: Colors.white ,
                           ),
                     ),
                         ],
                       )),             SizedBox(height: 280.h,),
             Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text
            (LocaleKeys.received.tr(),
                  style: TextStyle(fontFamily: "DM",fontSize: 15.sp,
                 color: Colors.black),
                  ),
                  Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text
            (LocaleKeys.Resend.tr(),
                  style: TextStyle(fontFamily: "DM",fontSize: 15.sp,
                 color:Appcolors.maincolor ),
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
