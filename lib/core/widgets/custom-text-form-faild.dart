import 'package:bokiaa/core/theme/app-colors.dart';
import 'package:bokiaa/core/theme/app-text-style.dart';
import 'package:flutter/material.dart';

class Customtextformfaild extends StatefulWidget {
  final String hinttext;
  final TextInputType? keyboardtype;
  final bool ispassword;
  const Customtextformfaild(
      {super.key,
      required this.hinttext,
      this.keyboardtype,
      this.ispassword = false});

  @override
  State<Customtextformfaild> createState() => _CustomtextformfaildState();
}

class _CustomtextformfaildState extends State<Customtextformfaild> {
  bool isobscure = true;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onTapOutside: (v) {
        FocusScope.of(context).unfocus();
      },
      keyboardType: widget.keyboardtype,
      obscureText: widget.ispassword && isobscure,
      decoration: InputDecoration(
          suffixIcon: widget.ispassword
              ? InkWell(
                  onTap: () {
                    setState(() {
                      isobscure =! isobscure;
                    });
                  },
                  child:isobscure? Icon(Icons.visibility_off):Icon(Icons.visibility))
              : null,
          fillColor: Appcolors.Bordercolor,
          filled: true,
          hintText: widget.hinttext,
          hintStyle: Apptextstyle.hintStyle,
          border: OutlineInputBorder(),
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Appcolors.greycolor)),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Appcolors.maincolor))),
    );
  }
}
