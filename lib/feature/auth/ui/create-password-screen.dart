import 'package:bokiaa/core/widgets/app-button.dart';
import 'package:bokiaa/core/widgets/custom-back-button.dart';
import 'package:bokiaa/core/widgets/custom-text-form-faild.dart';
import 'package:bokiaa/feature/auth/ui/password-change-screen.dart';
import 'package:bokiaa/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Createpasswordscreen extends StatelessWidget {
  const Createpasswordscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(children: [
              Custombackbutton(),
                 Text(
                  LocaleKeys.createpassword.tr(),
                  style: TextStyle(fontFamily: "DM", fontSize: 30.sp),
                
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  LocaleKeys.newpassword.tr(),
                  style: TextStyle(
                      fontFamily: "DM",
                      fontSize: 15.sp,
                      color: Color(0xff6A707C)),
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
              CustomTextFormField(
                // controller: confirmpasswordController,
                hintText: LocaleKeys.Newpassword.tr(),
                keyboardType: TextInputType.emailAddress,

                // hintText: LocaleKeys.Email.tr(),
                // keyboardType: TextInputType.emailAddress,
              ),
              SizedBox(
                height: 15.h,
              ),
              CustomTextFormField(
                // controller: newpassword,
                // isPassword: true,
                hintText: LocaleKeys.confirmpassword.tr(),
                keyboardType: TextInputType.visiblePassword,
              ),
              SizedBox(
                height: 25.h,
              ),
                    
         InkWell(
            onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => Passwordchangescreen()),
                  );
                },
          child: AppButton(title: LocaleKeys.Rsest.tr())),
             ] )
            ));
  }
}
