
import 'package:bokiaa/core/theme/app-colors.dart';
import 'package:bokiaa/core/widgets/app-button.dart';
import 'package:bokiaa/core/widgets/custom-text-form-faild.dart';
import 'package:bokiaa/core/widgets/routes/app-routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  bool _isLoading = false;

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  Future<void> _onSendCode() async {
    FocusScope.of(context).unfocus();
    if (_formKey.currentState?.validate() ?? false) {
      setState(() => _isLoading = true);
      try {
        await Future.delayed(const Duration(seconds: 2));
        if (mounted) {
          // context.pushNamed(AppRoutes.otpVerfication);
          Navigator.of(context).pushNamedAndRemoveUntil(
  AppRoutes.otpVerfication,
  (Route<dynamic> route) => false,
);

        }
      } finally {
        if (mounted) {
          setState(() => _isLoading = false);
        }
      }
    }
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
              SizedBox(
                height: 16.h,
              ),
              // const Customtextformfaild(),
              SizedBox(
                height: 32.h,
              ),
              Text(
                'Forgot Password?',
                style: TextStyle(
                  fontSize: 28.sp,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              SizedBox(
                height: 12.h,
              ),
              Text(
                "Don't worry! It occurs. Please enter the email\naddress linked with your account.",
                style: TextStyle(
                  fontSize: 14.sp,
                  color: Colors.grey.shade500,
                  height: 1.5,
                ),
              ),
              SizedBox(
                height: 32.h,
              ),
              Form(
                key: _formKey,
                child: CustomTextFormField(
                  hintText: 'Enter your email',
                  controller: _emailController,
                  keyboardType: TextInputType.emailAddress,
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'Please enter your email';
                    }
                    final bool emailValid = RegExp(
                      r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$',
                    ).hasMatch(value.trim());
                    if (!emailValid) return 'Please enter a valid email';
                    return null;
                  }, onChanged: (v) {  },  autofillHints: [], 
                ),
              ),
              SizedBox(
                height: 24.h,
              ),
              _isLoading
                  ? Center(
                      child: CircularProgressIndicator(
                        color: Appcolors.maincolor
                      ),
                    )
                  : Appbutton(
                      title: 'Send Code',
onTap: () {
  
},                   
  //  isFilled: true,
                      backgroundColor: const Color(0xFFBB9457),
                      // textColor: Colors.white,
                    
                    ),
              const Spacer(),
              Center(
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'Remember Password? ',
                      style: TextStyle(fontSize: 14.sp, color: Colors.black),
                    ),
                    // GestureDetector(
                    //   onTap: () =>
                    //       context.pushNamedAndRemoveUntil(AppRoutes.login),
                    // child:
                    InkWell(
                      onTap: () {
                        Navigator.popAndPushNamed(context, AppRoutes.login);
                      },
                      child: Text(
                        'Login',
                        style: TextStyle(
                          fontSize: 14.sp,
                          color: const Color(0xFFBB9457),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    // ),
                  ],
                ),
              ),
              SizedBox(
                height: 24.h,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
