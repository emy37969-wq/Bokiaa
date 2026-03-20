// import 'package:bokiaa/core/theme/app-colors.dart';
// import 'package:bokiaa/core/widgets/app-button.dart';
// import 'package:bokiaa/core/widgets/routes/routes.dart';
// import 'package:bokiaa/feature/auth/cubit/auth-cubit.dart';
// import 'package:bokiaa/generated/locale_keys.g.dart';
// import 'package:easy_localization/easy_localization.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// class AuthBlocListener extends StatelessWidget {
//   final String email;
//   final String password;
//   const AuthBlocListener(
//       {super.key, required this.email, required this.password});

//   @override
//   Widget build(BuildContext context) {
//     return BlocListener<Authcubit, Authstate>(
//       listener: (context, state) {
//         if (state is authloadingstate) {
//           showDialog(
//               context: context,
//               builder: (context) => Center(
//                       child: CircularProgressIndicator(
//                     color: Appcolors.maincolor,
//                   )));
//         } else if (state is autherroestate) {
//           Navigator.pop(context);
//           showDialog(
//               context: context,
//               builder: (context) => AlertDialog(
//                     title: Text("Error"),
//                     content: Text("Something wrong please try again"),
//                   ));
//         } else if (state is authsucssesstate) {
//           Navigator.pushNamedAndRemoveUntil(
//               context, Routes.bottomNavBarScreen, (route) => false);
//         }
//       },
//       child: AppButton(
//         title: LocaleKeys.login.tr(),
//         onTap: () {
//           context.read<Authcubit>().login(email: email,password: password);
//           // context.read<AppButton>().login(email: email, password: password);
//         },
//       ),
//     );
//   }
// }
import 'package:bokiaa/core/widgets/app-button.dart';
import 'package:bokiaa/core/widgets/routes/routes.dart';
import 'package:bokiaa/feature/auth/cubit/auth-cubit.dart';
import 'package:bokiaa/generated/locale_keys.g.dart';
import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/widgets.dart';

class Authbloclistener extends StatelessWidget {
  final String email;
  final String password;

  const Authbloclistener(
      {super.key, required this.email, required this.password});

  @override
  Widget build(BuildContext context) {
    return BlocListener<Authcubit, Authstate>(
      listener: (context, state) {
        if (state is authloadingstate) {
          showDialog(
            context: context,
            builder: (context) => Center(child: CircularProgressIndicator()),
          );
        } else if (state is autherroestate) {
          Navigator.pop(context);
          // showDialog(
          //   context: context,
          //   builder: (context) => AlertDialog(
          //     title: Text("Error"),
          //     content: Text("Somehing Wrong Please try again"),
          //   ),
          // );
        } else if (state is authsucssesstate) {
          Navigator.pushNamedAndRemoveUntil(
            context,
            Routes.bottomNavBarScreen,
            (route) => false,
          );
        }
      },
      child: AppButton(
        title: LocaleKeys.login.tr(),
        onTap: () {
          context.read<Authcubit>().login(context,email: email, password: password);
        },
      ),
    );
  }
}
