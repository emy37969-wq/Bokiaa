import 'package:bokiaa/feature/auth/ui/search-screen.dart';
import 'package:bokiaa/feature/welcome/ui/widgets/welcome-screen.dart';
import 'package:bokiaa/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Homescreen extends StatelessWidget {
  const Homescreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(children: [
          SafeArea(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Image.asset("assets/images/bookk.png"),
                SizedBox(
                  width: 5.w,
                ),
                InkWell(
                    onTap: () {
                      Navigator.pushReplacement(context,
                          MaterialPageRoute(builder: (_) => WelcomeScreen()));
                    },
                    child: Text(
                      "Bookia",
                      style: TextStyle(fontSize: 20.sp),
                    )),
                SizedBox(
                  width: 230.w,
                ),
                InkWell(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (_) => Searchscreen()));
                    },
                    child: Image.asset("assets/images/search-normal.png"))
              ],
            ),
          ),
          SizedBox(
            height: 20.h,
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              image: DecorationImage(
                image: AssetImage("assets/images/binkbook.png"),
                fit: BoxFit.cover,
              ),
            ),
            width: 400,
            height: 150,
          ),
          SizedBox(
            height: 10.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 35,
                height: 10,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Color(0xffBFA054),
                ),
              ),
              SizedBox(width: 7.w),
              Container(
                width: 10,
                height: 10,
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              SizedBox(width: 7.w),
              Container(
                width: 10,
                height: 10,
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 10.h,
          ),
          Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  LocaleKeys.saller.tr(),
                  style: TextStyle(
                    fontSize: 20.sp,
                  ),
                ),
              ))
        ]),
      ),
    );
  }
}
