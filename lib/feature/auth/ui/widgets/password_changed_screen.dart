import 'package:bokiaa/core/helper/extenstions.dart';
import 'package:bokiaa/core/theme/app-colors.dart';
import 'package:bokiaa/core/theme/app_theme.dart';
import 'package:bokiaa/core/widgets/app-button.dart';
import 'package:bokiaa/core/widgets/routes/app-routes.dart';
import 'package:flutter/material.dart';

class PasswordChangedScreen extends StatelessWidget {
  const PasswordChangedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    void backToLogin() {
      context.pushNamedAndRemoveUntil(AppRoutes.login);
    }

    return Scaffold(
      backgroundColor: context.appColors.background,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(child: Image.asset("assets/images/Sticker.png")),
              const SizedBox(height: 32),
              Text(
                'Password Changed!',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Serif',
                  color: context.appColors.textPrimary,
                ),
              ),
              const SizedBox(height: 12),
              Text(
                'Your password has been changed\nsuccessfully.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  color: context.appColors.secondaryGray,
                  height: 1.5,
                ),
              ),
              const SizedBox(height: 48),
              AppButton(
                text: 'Back To Login',
                onPressed: backToLogin,
                isFilled: true,
                backgroundColor: AppColors.primaryColor,
                textColor: AppColors.white,
              ),
            ],
          ),
        ),
      ),
    );
  }
}