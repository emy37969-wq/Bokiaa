

import 'package:bokiaa/core/theme/app-colors.dart';
import 'package:bokiaa/core/widgets/app-button.dart';
import 'package:bokiaa/core/widgets/custom-back-button.dart';
import 'package:bokiaa/core/widgets/custom-text-form-faild.dart';
import 'package:bokiaa/core/widgets/routes/app-routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CreateNewPasswordScreen extends StatefulWidget {
  const CreateNewPasswordScreen({super.key});

  @override
  State<CreateNewPasswordScreen> createState() =>
      _CreateNewPasswordScreenState();
}

class _CreateNewPasswordScreenState extends State<CreateNewPasswordScreen> {
  final _formKey = GlobalKey<FormState>();
  final _newPasswordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  bool _showNewPassword = false;
  bool _showConfirmPassword = false;
  bool _isLoading = false;

  @override
  void dispose() {
    _newPasswordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  void _onResetPassword() async {
    FocusScope.of(context).unfocus();
    if (_formKey.currentState?.validate() ?? false) {
      setState(() => _isLoading = true);
      try {
        await Future.delayed(const Duration(seconds: 2));
        if (mounted) {
          Navigator.of(context).pushNamedAndRemoveUntil(
  AppRoutes.login,
  (Route<dynamic> route) => false,
);

        }
      } finally {
        if (mounted) {
          setState(() => _isLoading = false);
        }
      }
    }
    // if (_formKey.currentState?.validate() ?? false) {
    //   context.pushNamedAndRemoveUntil(AppRoutes.passwordChangedSuccess);
    // }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 16.h,),
              const Custombackbutton(),
              SizedBox(height: 30.h,),
              Text(
                'Create new password',
                style: TextStyle(
                  fontSize: 28.sp,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 30.h,),
              Text(
                'Your new password must be unique from those\npreviously used.',
                style: TextStyle(
                  fontSize: 14.sp,
                  color: Colors.grey.shade500,
                  height: 1.5,
                ),
              ),
              SizedBox(height: 30.h,),
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    CustomTextFormField(
                      hintText: 'New Password',
                      controller: _newPasswordController,
                      isPassword: !_showNewPassword,
                      // textInputAction: TextInputAction.next,
                      autofillHints: const [AutofillHints.newPassword],
                      // suffixIcon: IconButton(
                      //   icon: Icon(
                      //     _showNewPassword
                      //         ? Icons.visibility_off_outlined
                      //         : Icons.visibility_outlined,
                      //     color: Colors.grey,
                      //   ),
                      //   onPressed: () => setState(
                      //     () => _showNewPassword = !_showNewPassword,
                      //   ),
                      // ),
                      validator: (value) {
                        if (value == null || value.trim().isEmpty) {
                          return 'Please enter a new password';
                        }
                        if (value.trim().length < 8) {
                          return 'Password must be at least 8 characters';
                        }
                        return null;
                      }, onChanged: (v) {  },
                    ),
                    SizedBox(height:  16.h),
                    CustomTextFormField(
                      hintText: 'Confirm Password',
                      controller: _confirmPasswordController,
                      isPassword: !_showConfirmPassword,
                      // textInputAction: TextInputAction.done,
                      autofillHints: const [AutofillHints.newPassword],
                      // suffixIcon: IconButton(
                      //   icon: Icon(
                      //     _showConfirmPassword
                      //         ? Icons.visibility_off_outlined
                      //         : Icons.visibility_outlined,
                      //     color: Colors.grey,
                      //   ),
                      //   onPressed: () => setState(
                      //     () => _showConfirmPassword = !_showConfirmPassword,
                      //   ),
                      // ),
                      validator: (value) {
                        if (value == null || value.trim().isEmpty) {
                          return 'Please confirm your password';
                        }
                        if (value.trim() !=
                            _newPasswordController.text.trim()) {
                          return 'Passwords do not match';
                        }
                        return null;
                      }, onChanged: (v) {  },
                    ),
                  ],
                ),
              ),
             SizedBox(height:  24.h),
              _isLoading
                  ? Center(
                      child: CircularProgressIndicator(
                        color: Appcolors.maincolor,
                      ),
                    )
                  : Appbutton(
                      title: 'Reset Password',
                      // onPressed: _onResetPassword,
                      // isFilled: true,
                      backgroundColor: const Color(0xFFBB9457),
                      // textColor: Colors.white,
                    ),
            ],
          ),
        ),
      ),
    );
  }
}