import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skeletonizer/skeletonizer.dart';

class CartSkeletonList extends StatelessWidget {
  const CartSkeletonList({super.key});

  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
      enabled: true,
      child: ListView.separated(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
        itemCount: 4,
        separatorBuilder: (_, index) => SizedBox(height: 12.h),
        itemBuilder: (_, index) => Row(
          children: [
            Container(
              width: 80.w,
              height: 80.h,
              decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            SizedBox(width: 12.w),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(height: 14.h, color: Colors.grey),
                  SizedBox(height: 8.h),
                  Container(height: 14.h, width: 80.w, color: Colors.grey),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}