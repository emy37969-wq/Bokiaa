







//       // Padding(
//       //   padding: const EdgeInsets.all(16.0),
//       //   child: Container(
//       //             width: double.infinity,
//       //                      padding: EdgeInsets.symmetric(vertical: 19.h),
//       //                      alignment: Alignment.center,
//       //                      decoration: BoxDecoration(
//       //                        border:  Border.all(color: Colors.grey),
//       //                          color:Appcolors.maincolor,
//       //                          borderRadius: BorderRadius.circular(8.r)),
//       //                      child: Row(
//       //                       mainAxisAlignment: MainAxisAlignment.center,
//       //                        children: [

//       //                             Text(
//       //                                LocaleKeys.backlogin.tr(),
//       //                                style: TextStyle(fontSize: 15.sp,
//       //                                 color: Colors.white ,
//       //                                                            ),
//       //                                                   ),

//       //                        ],
//       //                      )),
//       // ),]));
//     ]));
//   }
// }

import 'package:bokiaa/core/theme/app-colors.dart';
import 'package:bokiaa/core/widgets/app-button.dart';
import 'package:bokiaa/core/widgets/routes/app-routes.dart';
import 'package:flutter/material.dart';

class PasswordChangedScreen extends StatelessWidget {
  const PasswordChangedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // void backToLogin() {
    //   context.pushNamedAndRemoveUntil(AppRoutes.login);
    // }
    Navigator.of(context).pushNamedAndRemoveUntil(
  AppRoutes.login,
  (Route<dynamic> route) => false,
);
    return Scaffold(
      backgroundColor: Appcolors.Bordercolor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(child:Image.asset("assets/images/Sticker.png"),),
              const SizedBox(height: 32),
              const Text(
                'Password Changed!',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Serif',
                  color: Appcolors.darkgraycolor
                ),
              ),
              const SizedBox(height: 12),
              const Text(
                'Your password has been changed\nsuccessfully.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  color: Appcolors.darkgraycolor,
                  height: 1.5,
                ),
              ),
              const SizedBox(height: 48),
              Appbutton(
                title: 'Back To Login',
                // onPressed: backToLogin,
                // isFilled: true,
                backgroundColor: Appcolors.maincolor,
                // textColor:Appcolors.Bordercolor,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
