
import 'package:bokiaa/core/theme/app-colors.dart';
import 'package:bokiaa/core/widgets/app-button.dart';
import 'package:bokiaa/core/widgets/routes/app-routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pinput/pinput.dart';

class Otpscreen extends StatefulWidget {
  const Otpscreen({super.key});

  @override
  State<Otpscreen> createState() => _OtpVerificationScreenState();
}

class _OtpVerificationScreenState extends State<Otpscreen> {
  final _pinController = TextEditingController();
  final _focusNode = FocusNode();

  bool _isResending = false;

  @override
  void dispose() {
    _pinController.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  void _onVerify() {
    if (_pinController.text.length == 6) {
      // context.pushNamed(AppRoutes.createNewPasswordScreen);
      Navigator.of(context).pushNamedAndRemoveUntil(
  AppRoutes.createNewPasswordScreen,
  (Route<dynamic> route) => false,
);

    }
  }

  // 2. Extract the resend logic into a dedicated async method
  Future<void> _onResend() async {
    if (_isResending) return; // Prevent multiple taps

    setState(() {
      _isResending = true;
    });

    try {
      // TODO: Replace with your actual API call to resend the code
      await Future.delayed(const Duration(seconds: 2));
    } finally {
      if (mounted) {
        setState(() {
          _isResending = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final defaultPinTheme = PinTheme(
      width: 50.w,
      height: 56.h,
      textStyle: TextStyle(
        fontSize: 20.sp,
        fontWeight: FontWeight.bold,
        color:Colors.black
      ),
      decoration: BoxDecoration(
        color: Appcolors.Bordercolor,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Appcolors.Bordercolor),
      ),
    );

    final focusedPinTheme = defaultPinTheme.copyWith(
      decoration: defaultPinTheme.decoration!.copyWith(
        border: Border.all(color: Appcolors.maincolor, width: 1.5),
      ),
    );

    final submittedPinTheme = defaultPinTheme.copyWith(
      decoration: defaultPinTheme.decoration!.copyWith(
        border: Border.all(color: Appcolors.maincolor),
        color: Appcolors.productbackground,
      ),
    );

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 16.h,),
              // const Customtextformfaild(),
              SizedBox(height: 30.h,),
              Text(
                'OTP Verification',
                style: TextStyle(
                  fontSize: 28.sp,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 12.h,),
              Text(
                'Enter the verification code we just sent on\nyour email address.',
                style: TextStyle(
                  fontSize: 14.sp,
                  color: Colors.grey.shade500,
                  height: 1.5,
                ),
              ),
             SizedBox(height: 40.h,),
              Center(
                child: Pinput(
                  length: 6,
                  controller: _pinController,
                  focusNode: _focusNode,
                  autofocus: true,
                  defaultPinTheme: defaultPinTheme,
                  focusedPinTheme: focusedPinTheme,
                  submittedPinTheme: submittedPinTheme,
                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  onCompleted: (_) => _onVerify(),
                ),
              ),
             SizedBox(height: 30.h,),
              Appbutton(
                title: 'Verify',
                // onPressed: _onVerify,
                // isFilled: true,
                backgroundColor: Appcolors.maincolor,
                // textColor: Colors.white, 
              ),
              const Spacer(),
              Center(
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      "Didn't received code? ",
                      style: TextStyle(
                        fontSize: 14.sp,
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    GestureDetector(
                      onTap: _isResending ? null : _onResend,
                      child: Container(
                        color: Colors.transparent,
                        child: _isResending
                            ? SizedBox(
                                width: 16.sp,
                                height: 16.sp,
                                child: const CircularProgressIndicator(
                                  color: Appcolors.maincolor,
                                  strokeWidth: 2,
                                ),
                              )
                            : Text(
                                'Resend',
                                style: TextStyle(
                                  fontSize: 14.sp,
                                  color: Appcolors.maincolor,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 24.h,)
            ],
          ),
        ),
      ),
    );
  }
}
