import 'package:bokiaa/core/theme/app-colors.dart';
import 'package:bokiaa/feature/home/cupit/home-cupit.dart';
import 'package:bokiaa/feature/home/cupit/home-state.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class Sliderscreen extends StatefulWidget {
  @override
  State<Sliderscreen> createState() => _SliderscreenState();
}

class _SliderscreenState extends State<Sliderscreen> {
  int activeindex = 0;
  @override
  Widget build(BuildContext context) {
        return BlocBuilder<HomeCubit, Homestate>(builder: (context, state) {
      if (state is SliderLoadingState) {
        return CircularProgressIndicator();
      } else if (state is SliderSuccessState) {

    return Column(
      children: [
        CarouselSlider(
          options: CarouselOptions(
              height: 150.0,
              autoPlay: true,
              viewportFraction: 1,
              onPageChanged: (index, r) {
                setState(() {
                  activeindex = index;
                });
              }),
          items: state.sliders?.map((i) {
            return Builder(
              builder: (BuildContext context) {
                return ClipRRect(
                  borderRadius: BorderRadius.circular(12.r),
                  child: Image.network(
                    i.image??"",
                    fit: BoxFit.cover,
                  ),
                );
              },
            );
          }).toList(),
        ),
        SizedBox(
          height: 10.h,
        ),
        AnimatedSmoothIndicator(
          activeIndex: activeindex,
          count: state.sliders?.length??0,
          effect: ExpandingDotsEffect(
              dotHeight: 10, activeDotColor: Appcolors.maincolor),
        )
      ],
    );
          } else {
        return Text("error");
      }
    });
  }

  }

