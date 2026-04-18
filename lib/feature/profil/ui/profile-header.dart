import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class ProfileHeader extends StatelessWidget {
  const ProfileHeader({
    super.key,
    required this.name,
    required this.email,
    required this.imageUrl,
  });

  final String name;
  final String email;
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(20.w, 24.h, 20.w, 0),
      child: Row(
        children: [
          Container(
            width: 64.w,
            height: 64.w,
            decoration: const BoxDecoration(shape: BoxShape.circle),
            // child: ClipOval(
            //   child: custom(
            //     url: imageUrl,
            //     fit: BoxFit.cover,
            //     width: 64.w,
            //     height: 64.w,
            //   ),
            // ),
          ),
          SizedBox(height: 16.h,),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                name,
                style: TextStyle(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 6.h,),
              Text(
                email,
                style: TextStyle(fontSize: 13.sp, color: Colors.grey.shade500),
              ),
            ],
          ),
        ],
      ),
    );
  }
}