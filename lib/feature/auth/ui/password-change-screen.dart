
import 'package:bokiaa/core/widgets/app-button.dart';
import 'package:bokiaa/core/widgets/custom-back-button.dart';
import 'package:bokiaa/feature/auth/ui/login-screen.dart';
import 'package:bokiaa/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:bokiaa/feature/auth/cubit/auth-cubit.dart';

class Passwordchangescreen extends StatelessWidget {
  const Passwordchangescreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(children: [
      Custombackbutton(),
      SizedBox(
        height: 110,
      ),
      Image.asset("assets/images/Sticker.png"),
      SizedBox(
        height: 20.h,
      ),
      Text(
        LocaleKeys.passwordchange.tr(),
        style: TextStyle(
          fontFamily: "DM",
          fontSize: 30.sp,
        ),
      ),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 65.0),
        child: Text(
          LocaleKeys.changesuccess.tr(),
          style: TextStyle(
              fontFamily: "DM", fontSize: 15.sp, color: Color(0xff6A707C)),
        ),
      ),
      SizedBox(
        height: 30.h,
      ),
      Padding(
        padding: const EdgeInsets.all(16.0),
        child: InkWell(
       onTap: () {
        Navigator.pushReplacement(
  context,
  MaterialPageRoute(
    builder: (_) => BlocProvider(
      create: (context) => Authcubit(),
      child: LoginScreen(),
    ),
  ),
);

            },
            child: AppButton(title: LocaleKeys.backlogin.tr())),
      )







      // Padding(
      //   padding: const EdgeInsets.all(16.0),
      //   child: Container(
      //             width: double.infinity,
      //                      padding: EdgeInsets.symmetric(vertical: 19.h),
      //                      alignment: Alignment.center,
      //                      decoration: BoxDecoration(
      //                        border:  Border.all(color: Colors.grey),
      //                          color:Appcolors.maincolor,
      //                          borderRadius: BorderRadius.circular(8.r)),
      //                      child: Row(
      //                       mainAxisAlignment: MainAxisAlignment.center,
      //                        children: [

      //                             Text(
      //                                LocaleKeys.backlogin.tr(),
      //                                style: TextStyle(fontSize: 15.sp,
      //                                 color: Colors.white ,
      //                                                            ),
      //                                                   ),

      //                        ],
      //                      )),
      // ),]));
    ]));
  }
}
