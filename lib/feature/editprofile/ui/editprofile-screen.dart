
import 'package:bokiaa/core/widgets/app-button.dart';
import 'package:bokiaa/core/widgets/custom-text-form-faild.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Editprofilescreen extends StatelessWidget {
  const Editprofilescreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Row(children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Icon(Icons.arrow_back)),
                ),
                SizedBox(width: 90.w,),
                 Text(
                  "Edit Profile",style: TextStyle(fontSize: 24.sp),
                ),
              ],),
              SizedBox(height:30.h ,),
              Stack(
            children: [
              CircleAvatar(
                radius: 60,
                backgroundColor: Color(0xffDADADA),
              ),
              Positioned(
                bottom: 0,
                right: 0,
                child: Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.white,
          ), 
          padding: EdgeInsets.all(6),
          child:Image.asset("assets/images/solar_camera-broken.png")
                ),
              ),
            ],
          ),
          SizedBox(height: 40.h,),
            CustomTextFormField(hintText: "Full Name", autofillHints: [], validator: (value) {  },),
            SizedBox(height: 15.h,),
            CustomTextFormField(hintText: "Phone", autofillHints: [], validator: (value) {  },),
            SizedBox(height: 15.h,),
            CustomTextFormField(hintText: "Address", autofillHints: [], validator: (value) {  },),
            SizedBox(height: 110.h,),
            Appbutton(title: "Update Profile")
            ]),
        )
        ),
      );
  }
}

