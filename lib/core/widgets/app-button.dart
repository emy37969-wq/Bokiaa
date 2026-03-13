import 'package:bokiaa/core/theme/app-colors.dart';
import 'package:bokiaa/feature/ui/login-screen.dart';
import 'package:bokiaa/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Appbutton extends StatelessWidget {
  final Color? background;
  const Appbutton({super.key,  this.background});

  @override
  Widget build(BuildContext context) {
    return InkWell(
                        onTap: () {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => LoginScreen()),
    );

  },

      child: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(vertical: 19.h),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          border: background==null?null: Border.all(color: Colors.black),
            color: background??Appcolors.maincolor, 
            borderRadius: BorderRadius.circular(8.r)),
        child: Text(
          LocaleKeys.Login.tr(),
          style: TextStyle(fontSize: 15.sp,
           color: background==Colors.white?Colors.black: Colors.white),
           
        ),
      ),
    );
    
  }
}
