// import 'package:bokiaa/core/theme/app-colors.dart';
// import 'package:bokiaa/core/theme/app-text-style.dart';
// import 'package:flutter/material.dart';

// class Customtextformfaild extends StatefulWidget {
//   final String hinttext;
//   final TextInputType? keyboardtype;
//   final bool ispassword;
//   final TextEditingController? controller;
//   const Customtextformfaild(
//       {super.key,
//       required this.hinttext,
//       this.keyboardtype,
//       this.ispassword = false, this.controller});

//   @override
//   State<Customtextformfaild> createState() => _CustomtextformfaildState();
// }

// class _CustomtextformfaildState extends State<Customtextformfaild> {
//   bool isobscure = true;
//   @override
//   Widget build(BuildContext context) {
//     return TextFormField(
//       controller: widget.controller,
//       onTapOutside: (v) {
//         FocusScope.of(context).unfocus();
//       },
//       keyboardType: widget.keyboardtype,
//       obscureText: widget.ispassword && isobscure,
//       decoration: InputDecoration(
//           suffixIcon: widget.ispassword
//               ? InkWell(
//                   onTap: () {
//                     setState(() {
//                       isobscure =! isobscure;
//                     });
//                   },
//                   child:isobscure? Icon(Icons.visibility_off):Icon(Icons.visibility))
//               : null,
//           fillColor: Appcolors.Bordercolor,
//           filled: true,
//           hintText: widget.hinttext,
//           hintStyle: Apptextstyle.hintStyle,
//           border: OutlineInputBorder(),
//           enabledBorder: OutlineInputBorder(
//               borderSide: BorderSide(color: Appcolors.greycolor)),
//           focusedBorder: OutlineInputBorder(
//               borderSide: BorderSide(color: Appcolors.maincolor))),
//     );
//   }
// }

import 'package:bokiaa/core/theme/app-colors.dart';
import 'package:bokiaa/core/theme/app-text-style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextFormField extends StatefulWidget {
  final String hintText;
  final TextInputType? keyboardType;
  final bool isPassword;
  final TextEditingController? controller;
  final void Function (String)? onChanged;
  const CustomTextFormField({
    super.key,
    required this.hintText,
    this.keyboardType,
    this.isPassword = false,
    this.controller, this.onChanged, required List<String> autofillHints, required String? Function(dynamic value) validator,
  });

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  bool isObscure = true;
  @override
  Widget build(BuildContext context) {
    // print("rebuild custom text ");

    return TextFormField(
      controller: widget.controller,
      onTapOutside: (v) {
        FocusScope.of(context).unfocus();
      },
      onChanged: widget.onChanged,
      cursorColor: Appcolors.maincolor,
      keyboardType: widget.keyboardType,
      obscureText: widget.isPassword && isObscure,
      decoration: InputDecoration(
          suffixIcon: widget.isPassword
              ? Padding(
                  padding: EdgeInsets.all(8.0.r),
                  child: InkWell(
                      onTap: () {
                        setState(() {
                          isObscure = !isObscure;
                        });
                      },
                      child: isObscure
                          ? Icon(Icons.visibility_off)
                          : Icon(Icons.visibility)))
              : null,
          fillColor: const Color.fromARGB(255, 243, 240, 240),
          filled: true,
          hintText: widget.hintText,
          hintStyle: AppTextStyle.hint16,
          border: OutlineInputBorder(),
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Appcolors.Bordercolor)),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Appcolors.maincolor))),
    );
  }
}


// import 'package:bokiaa/core/theme/app-colors.dart';
// import 'package:flutter/material.dart';

// class Customtextformfaild extends StatefulWidget {
//   final String hintText;
//   final bool isPassword;
//   final Widget? suffixIcon;
//   final TextEditingController controller;
//   final String? Function(String?)? validator;
//   final TextInputType? keyboardType;
//   final Iterable<String>? autofillHints;
//   final TextInputAction? textInputAction;

//   const Customtextformfaild({
//     super.key,
//     required this.hintText,
//     this.isPassword = false,
//     this.suffixIcon,
//     required this.controller,
//     this.validator,
//     this.keyboardType,
//     this.autofillHints,
//     this.textInputAction, required Null Function(dynamic v) onChanged,
//   });

//   @override
//   State<Customtextformfaild> createState() => _CustomTextFieldState();
// }

// class _CustomTextFieldState extends State<Customtextformfaild> {
//   final FocusNode _focusNode = FocusNode();
//   // Only start validating after the user has left the field at least once
//   bool _hasUnfocused = false;

//   @override
//   void initState() {
//     super.initState();
//     _focusNode.addListener(() {
//       if (!_focusNode.hasFocus && !_hasUnfocused) {
//         setState(() => _hasUnfocused = true);
//       }
//     });
//   }

//   @override
//   void dispose() {
//     _focusNode.dispose();
//     super.dispose();
//   }

//   static const _borderRadius = BorderRadius.all(Radius.circular(8));

//   @override
//   Widget build(BuildContext context) {
//     return TextFormField(
//       // Only auto-validate after the user has left the field once
//       autovalidateMode: _hasUnfocused
//           ? AutovalidateMode.onUserInteraction
//           : AutovalidateMode.disabled,
//       focusNode: _focusNode,
//       controller: widget.controller,
//       validator: widget.validator,
//       keyboardType: widget.keyboardType,
//       autofillHints: widget.autofillHints,
//       textInputAction: widget.textInputAction,
//       obscureText: widget.isPassword,
//       cursorColor: Appcolors.primaryColor,
//       decoration: InputDecoration(
//         hintText: widget.hintText,
//         hintStyle: const TextStyle(color: Appcolors.greycolor),
//         fillColor: Appcolors.productbackground,
//         filled: true,
//         suffixIcon: widget.suffixIcon,
//         border: const OutlineInputBorder(
//           borderRadius: _borderRadius,
//           borderSide: BorderSide(color: Appcolors.Bordercolor),
//         ),
//         enabledBorder: const OutlineInputBorder(
//           borderRadius: _borderRadius,
//           borderSide: BorderSide(color: Appcolors.Bordercolor),
//         ),
//         focusedBorder: const OutlineInputBorder(
//           borderRadius: _borderRadius,
//           borderSide: BorderSide(color: Appcolors.maincolor, width: 1.5),
//         ),
//         errorBorder: const OutlineInputBorder(
//           borderRadius: _borderRadius,
//           borderSide: BorderSide(color: Colors.red, width: 1.5),
//         ),
//         focusedErrorBorder: const OutlineInputBorder(
//           borderRadius: _borderRadius,
//           borderSide: BorderSide(color: Colors.red, width: 1.5),
//         ),
//       ),
//     );
//   }
// }
