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
   const
    CustomTextFormField({super.key, required this.hintText, this.keyboardType,
  this.isPassword=false, this.controller

  });

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  bool isObscure=true;
  @override
  Widget build(BuildContext context) {
    print("rebuild custom text ");

    return TextFormField(
      controller: widget.controller,
      onTapOutside: (v){
        FocusScope.of(context).unfocus();
      },
      cursorColor: Appcolors.maincolor,
      keyboardType:widget.keyboardType ,
      obscureText: widget.isPassword&&isObscure,
      decoration: InputDecoration(
        suffixIcon:widget.isPassword? Padding(
          padding:  EdgeInsets.all(8.0.r),
          child: InkWell(
              onTap: (){
                setState(() {
                 isObscure=!isObscure;
                });
              },
              child:isObscure? Icon(Icons.visibility_off):Icon(Icons.visibility))
        ):null,
        fillColor: const Color.fromARGB(255, 243, 240, 240),
        filled: true,
        hintText: widget.hintText,
        hintStyle: Apptextstyle.hintStyle,
        
        border: OutlineInputBorder(

        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Appcolors.Bordercolor)
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color:Appcolors.maincolor)
        )
      ),
    );
  }
}