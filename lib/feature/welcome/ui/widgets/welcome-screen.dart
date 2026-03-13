import 'package:bokiaa/core/widgets/app-button.dart';
import 'package:bokiaa/feature/ui/register-screen.dart';
import 'package:bokiaa/gen/assets.gen.dart';
import 'package:bokiaa/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Welcomescreen extends StatelessWidget {
  const Welcomescreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 22.w),

      decoration: BoxDecoration(
          image: DecorationImage(
              image: Assets.images.bok.image().image, fit: BoxFit.cover)),
      child: Column(
        children: [
          SizedBox(height: 135.h),
          Image.asset("assets/images/logo 2.png"),
          SizedBox(height: 28.h,),
          Text(LocaleKeys.OrderNow.tr(),
          style: TextStyle(fontFamily: "DM",fontSize: 20.sp),
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
              SizedBox(height:250.h,),
              Appbutton(
                
              ),
              SizedBox(height: 15.h,),
               InkWell(
                  onTap: () {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => RegisterScreen()),
    );

  },
     child: Container(
   width: double.infinity,
                       padding: EdgeInsets.symmetric(vertical: 19.h),
                       alignment: Alignment.center,
                       decoration: BoxDecoration(
                         border:  Border.all(color: Colors.black),
                           color: Colors.white, 
                           borderRadius: BorderRadius.circular(8.r)),
                       child: Text(
                         LocaleKeys.Register.tr(),
                         style: TextStyle(fontSize: 15.sp,
                          color: Colors.black,
                       ),
                     )),
               )
        ],
        
      ),
    ));
  }
}
//flutter pub run easy_localization:generate -S assets/translations -f keys -o locale_keys.g.dart