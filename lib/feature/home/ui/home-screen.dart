import 'package:bokiaa/feature/home/cupit/home-cupit.dart';
import 'package:bokiaa/feature/home/cupit/home-state.dart';
import 'package:bokiaa/feature/home/sliders/slider-screen.dart';
import 'package:bokiaa/feature/home/ui/home-appbar.dart';
import 'package:bokiaa/feature/home/ui/product-item.dart';
import 'package:bokiaa/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skeletonizer/skeletonizer.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  int activeindex = 0;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Homeappbar(),
        SizedBox(
          height: 5.h,
        ),
        Sliderscreen(),
        SizedBox(
          height: 15.h,
        ),
        Text(
          LocaleKeys.saller.tr(),
          style: TextStyle(
            fontSize: 24.sp,
          ),
        ),
        BlocBuilder<HomeCubit, Homestate>(
          buildWhen: (prev,current)=> current is BestsellerSuccessState||current is BestsellerLoadingState||current is BestsellerErrorState,
          builder: (context, state) {
            if (state is BestsellerLoadingState) {
              return Skeletonizer(enabled: true,
          child: Container(
            height: 150.h, width: double.infinity,color: Colors.grey,
          ),
        );

            } else if (state is BestsellerSuccessState) {
              return Expanded(
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 11.w,
                      mainAxisSpacing: 11.h,
                      childAspectRatio: .60),
                  itemCount: state.products?.length,
                  itemBuilder: (context, index) {
                    return Productitem(
                      productt: state.products?[index],
                    );
                  },
                ),
              );
            } else {
              return Text("error");
            }
          },
        ),
      ],
    );
  }
}
