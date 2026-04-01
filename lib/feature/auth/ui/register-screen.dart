import 'package:bokiaa/core/theme/app-colors.dart';
import 'package:bokiaa/core/widgets/app-button.dart';
import 'package:bokiaa/core/widgets/custom-back-button.dart';
import 'package:bokiaa/core/widgets/custom-text-form-faild.dart';
import 'package:bokiaa/feature/auth/cubit/auth-cubit.dart';
import 'package:bokiaa/feature/auth/ui/auth-bloc-listener.dart';
import 'package:bokiaa/feature/auth/ui/uth-bloc-listener.dart';
import 'package:bokiaa/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  var nameController = TextEditingController();
  var password_confirmationController = TextEditingController();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();

  @override
  void dispose() {
    nameController.dispose();
    password_confirmationController.dispose();
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
                LocaleKeys.RegisterPrompt.tr(),
                style: TextStyle(fontFamily: "DM", fontSize: 30.sp),
              ),
            ),
            SizedBox(
              height: 10.h,
            ),
            CustomTextFormField(
              controller: nameController,
              hintText: LocaleKeys.name.tr(),
              keyboardType: TextInputType.emailAddress,
            ),
            SizedBox(
              height: 10.h,
            ),
            CustomTextFormField(
              controller: emailController,
              hintText: LocaleKeys.email.tr(),
              keyboardType: TextInputType.emailAddress,
            ),
            SizedBox(
              height: 10.h,
            ),
            CustomTextFormField(
              controller: passwordController,
              hintText: LocaleKeys.pass.tr(),
              keyboardType: TextInputType.visiblePassword,
            ),
            SizedBox(
              height: 10.h,
            ),
            CustomTextFormField(
              controller: password_confirmationController,
              hintText: LocaleKeys.Confirm.tr(),
              keyboardType: TextInputType.visiblePassword,
            ),
            SizedBox(
              height: 25.h,
            ),
            AppButton(title: LocaleKeys.Register.tr(),),
            // AppButton(
            //   title: LocaleKeys.Register.tr(),
            //   onTap: () {
            //     context.read<Authcubit>().register(
            //         email: emailController.text,
            //         name: nameController.text,
            //         password: passwordController.text,
            //         password_confirmation:
            //             password_confirmationController.text);
            //   },
            // ),
            // Authbloclistener( email: emailController, password: passwordController, name: nameController, password_confirmation: password_confirmationController,
            //    ),

            SizedBox(
              height: 100.h,
            ),

            //     Authbloclistener(
            //  username: usernameController, confirmpassword: confirmpasswordController, email: emailController, password: passwordController,),
            //                  AppButton(
            //   title: LocaleKeys.Login.tr(),
            //   onTap: () {
            //     context.read<Authcubit>().register(
            //         email: emailController.text,
            //         username: usernameController.text,
            //         password: passwordController.text,
            //         confirmpassword: confirmpasswordController.text);
            //   },
            // ),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  LocaleKeys.already.tr(),
                  style: TextStyle(
                      fontFamily: "DM", fontSize: 15.sp, color: Colors.black),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      LocaleKeys.login.tr(),
                      style: TextStyle(
                          fontFamily: "DM",
                          fontSize: 15.sp,
                          color: Appcolors.maincolor),
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
