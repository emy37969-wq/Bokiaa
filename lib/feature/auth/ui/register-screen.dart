import 'package:bokiaa/core/theme/app-colors.dart';
import 'package:bokiaa/core/widgets/app-button.dart';
import 'package:bokiaa/core/widgets/custom-back-button.dart';
import 'package:bokiaa/core/widgets/custom-text-form-faild.dart';
import 'package:bokiaa/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

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
          child: Text(LocaleKeys.RegisterPrompt.tr(),
              style: TextStyle(fontFamily: "DM",fontSize: 30.sp),
              ),
        ),
        SizedBox(height: 10.h,),
        CustomTextFormField(
          
          hintText: LocaleKeys.name.tr(),
          keyboardType: TextInputType.emailAddress,
        ),
        SizedBox(height: 10.h,),
                CustomTextFormField(
          hintText: LocaleKeys.email.tr(),
          keyboardType: TextInputType.emailAddress,
         
        ),  
        SizedBox(height: 10.h,) ,
CustomTextFormField(
          hintText: LocaleKeys.pass.tr(),
          keyboardType: TextInputType.visiblePassword,
         
        ), 
        SizedBox(height: 10.h,),
        CustomTextFormField(
          hintText: LocaleKeys.Confirm.tr(),
          keyboardType: TextInputType.visiblePassword,
          
        ), 
        SizedBox(height: 25.h,),
        AppButton(title: LocaleKeys.Register.tr(),),
        SizedBox(height: 100.h,),
        
                     Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text
            (LocaleKeys.already.tr(),
                  style: TextStyle(fontFamily: "DM",fontSize: 15.sp,
                 color: Colors.black),
                  ),
                  Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text
            (LocaleKeys.login.tr(),
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




// import 'package:flutter/material.dart';


// class RegisterScreen extends StatelessWidget {
//   const RegisterScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return const Placeholder();
//   }
// }
