// import 'package:bokiaa/core/theme/app-colors.dart';
// import 'package:bokiaa/feature/auth/cubit/auth-cubit.dart';
// import 'package:bokiaa/feature/ui/login-screen.dart';
// import 'package:bokiaa/generated/locale_keys.g.dart';
// import 'package:easy_localization/easy_localization.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';

// class Appbutton extends StatelessWidget {
//   final Color? background;
//   final String title;
//   final void Function()? onTap;
//   const Appbutton({super.key, this.background, required this.title, this.onTap});

//   @override
//   Widget build(BuildContext context) {
//     return InkWell(
//       onTap: () {
//         context
//             .read<Authcubit>()
//             .login(email: LocaleKeys.Email, password: LocaleKeys.Password);
//         // Navigator.push(
//         //   context,
//         //   MaterialPageRoute(builder: (_) => LoginScreen()),
//         // );
//       },
//       child: Container(
//         width: double.infinity,
//         padding: EdgeInsets.symmetric(vertical: 19.h),
//         alignment: Alignment.center,
//         decoration: BoxDecoration(
//             border: background == null ? null : Border.all(color: Colors.black),
//             color: background ?? Appcolors.maincolor,
//             borderRadius: BorderRadius.circular(8.r)),
//         child: Text(
//           LocaleKeys.Login.tr(),
//           style: TextStyle(
//               fontSize: 15.sp,
//               color: background == Colors.white ? Colors.black : Colors.white),
//         ),
//       ),
//     );
//   }
// }



import 'package:bokiaa/core/theme/app-colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';



class AppButton extends StatelessWidget {
  final Color? backgroundColor;
  final String title;
  final void Function()? onTap;
  const AppButton( {super.key,  this.backgroundColor, required this.title, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.circular(8.r),
      color: backgroundColor??Appcolors.maincolor,
      clipBehavior:Clip.antiAlias ,
      child: InkWell(
        onTap: onTap,
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(vertical: 19.h),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            border:backgroundColor==null?null :Border.all(
              color: Colors.black
            ),
            borderRadius: BorderRadius.circular(8.r)
          ),
          child: Text(title,style: TextStyle(
            fontSize: 15.sp,
            color:backgroundColor==null?Colors.white:Colors.black
          ),),
        ),
      ),
    );
  }

  void login({required String email, required String password}) {}
  void register({required String email, required String password,required String name ,required String password_confirmation}) {}


}