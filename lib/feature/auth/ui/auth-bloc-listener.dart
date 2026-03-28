import 'package:bokiaa/core/widgets/app-button.dart';
import 'package:bokiaa/core/widgets/routes/routes.dart';
import 'package:bokiaa/feature/auth/cubit/auth-cubit.dart';
import 'package:bokiaa/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Authbloclistener extends StatelessWidget {
  final TextEditingController email;
  final TextEditingController password;
  // final TextEditingController name;
  // final TextEditingController password_confirmation;

  const Authbloclistener({
    super.key,
    required this.email,
    required this.password,
    // required this.name,
    // required this.password_confirmation,
  });

  @override
  Widget build(BuildContext context) {
    return BlocListener<Authcubit, Authstate>(
      listener: (context, state) {
        if (state is AuthLoadingState) {
          showDialog(
            context: context,
            builder: (context) => Center(child: CircularProgressIndicator()),
          );
        } else if (state is AuthErroeState) {
          Navigator.pop(context);
          showDialog(
            context: context,
            builder: (context) => AlertDialog(
              title: Text(LocaleKeys.Error.tr()),
              content: Text(LocaleKeys.Wrong.tr()),
            ),
          );
        } else if (state is AuthSucssesState) {
          Navigator.pushNamedAndRemoveUntil(
            context,
            Routes.bottomNavBarScreen,
            (route) => false,
          );
        }
      },
      child: AppButton(
        title: LocaleKeys.Login.tr(),
        onTap: () {
          context
              .read<Authcubit>()
              .login(email: email.text, password: password.text);
        },
      ),
      
    );
  }
}
