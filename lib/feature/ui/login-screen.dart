import 'package:bokiaa/core/theme/app-colors.dart';
import 'package:bokiaa/core/widgets/app-button.dart';
import 'package:bokiaa/core/widgets/custom-back-button.dart';
import 'package:bokiaa/core/widgets/custom-text-form-faild.dart';
import 'package:bokiaa/feature/auth/cubit/auth-cubit.dart';
import 'package:bokiaa/feature/ui/forget-password.dart';
import 'package:bokiaa/feature/ui/register-screen.dart';
import 'package:bokiaa/feature/welcome/ui/widgets/auth-bloc-listener.dart';
import 'package:bokiaa/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var emailController = TextEditingController();
  var passwordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

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
              child: Text(
                LocaleKeys.WelcomeBack.tr(),
                style: TextStyle(fontFamily: "DM", fontSize: 30.sp),
              ),
            ),
            SizedBox(
              height: 5.h,
            ),
            CustomTextFormField(
              controller: emailController,
              hintText: "Email",
              keyboardType: TextInputType.emailAddress,

              // hintText: LocaleKeys.Email.tr(),
              // keyboardType: TextInputType.emailAddress,
            ),
            SizedBox(
              height: 10.h,
            ),
            CustomTextFormField(
              controller: passwordController,
              isPassword: true,
              hintText: "Password",
              keyboardType: TextInputType.visiblePassword,

              // hintText: LocaleKeys.Password.tr(),
              // keyboardType: TextInputType.visiblePassword,
              // isPassword: true,
            ),
            SizedBox(
              height: 5.h,
            ),
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => Forgetpassword()),
                );
              },
              child: Text(
                LocaleKeys.forget.tr(),
                style: TextStyle(
                    fontFamily: "DM",
                    fontSize: 15.sp,
                    color: Color(0xff6A707C)),
              ),
            ),
            Authbloclistener(
                email: emailController.text, password: passwordController.text),
            SizedBox(
              height: 5.h,
            ),
            // BlocListener<Authcubit, Authstate>(
            //     listener: (context, State) {
            //       if (State is authloadingstate) {
            //         showDialog(
            //             context: context,
            //             builder: (context) =>
            //                 Center(child: CircularProgressIndicator()));
            //         // AuthBlocListener(
            //         //     email: emailController.text,
            //         //     password: passwordController.text);
            //       }
            //     },),
                    // AuthBlocListener(
                    //     email: emailController.text,
                    //     password: passwordController.text);
            SizedBox(
              height: 7.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  LocaleKeys.or.tr(),
                  style: TextStyle(
                      fontFamily: "DM",
                      fontSize: 15.sp,
                      color: Color(0xff6A707C)),
                ),
              ],
            ),
            Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(vertical: 19.h),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8.r)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset("assets/images/google_ic.png"),
                    Text(
                      LocaleKeys.Google.tr(),
                      style: TextStyle(
                        fontSize: 15.sp,
                        color: Color(0xff6A707C),
                      ),
                    ),
                  ],
                )),
            SizedBox(
              height: 5.h,
            ),
            Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(vertical: 19.h),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8.r)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.apple),
                    Text(
                      LocaleKeys.Apple.tr(),
                      style:
                          TextStyle(fontSize: 15.sp, color: Color(0xff6A707C)),
                    ),
                  ],
                )),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  LocaleKeys.not.tr(),
                  style: TextStyle(
                      fontFamily: "DM", fontSize: 15.sp, color: Colors.black),
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
                      child: Text(
                        LocaleKeys.now.tr(),
                        style: TextStyle(
                            fontFamily: "DM",
                            fontSize: 15.sp,
                            color: Appcolors.maincolor),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            // AuthBlocListener(email: emailController.text, password: passwordController.text),
          ],
        ),
      ),
    );
  }
}




// import 'package:bokiaa/core/widgets/custom-text-form-faild.dart';
// import 'package:bokiaa/feature/welcome/ui/widgets/auth-bloc-listener.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';

// class LoginScreen extends StatefulWidget {
//   const LoginScreen({super.key});

//   @override
//   State<LoginScreen> createState() => _LoginScreenState();
// }

// class _LoginScreenState extends State<LoginScreen> {
//   var emailController = TextEditingController();
//   var passwordController = TextEditingController();

//   @override
//   void dispose() {
//     emailController.dispose();
//     passwordController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SafeArea(
//         child: Padding(
//           padding: EdgeInsets.symmetric(horizontal: 16.0.w),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               CustomTextFormField(
//                 controller: emailController,
//                 hintText: "Email",
//                 keyboardType: TextInputType.emailAddress,
//               ),
//               SizedBox(height: 16.h,),
//               CustomTextFormField(
//                 controller: passwordController,
//                 isPassword: true,
//                 hintText: "Password",
//                 keyboardType: TextInputType.visiblePassword,
//               ),
//               SizedBox(height: 30.h,),
//               AuthBlocListener(email: emailController.text, password: passwordController.text),
//             ],
//           ),
//         ),
//       ),
//     );
//   }


// }
