import 'package:bokiaa/core/theme/app-colors.dart';
import 'package:bokiaa/feature/auth/ui/search-screen.dart';
import 'package:bokiaa/feature/home/cupit/home-cupit.dart';
import 'package:bokiaa/feature/home/cupit/home-state.dart';
import 'package:bokiaa/feature/home/sliders/slider-screen.dart';
import 'package:bokiaa/feature/home/ui/home-appbar.dart';
import 'package:bokiaa/feature/welcome/ui/widgets/welcome-screen.dart';
import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  int activeindex = 0;
  @override
  Widget build(BuildContext context) {
    // return BlocBuilder<HomeCubit, Homestate>(builder: (context, state) {
    //   if (state is SliderLoadingState) {
    //     return CircularProgressIndicator();
    //   } else if (state is SliderSuccessState) {
        return Column(
          children: [
            Homeappbar(),
            SizedBox(
              height: 5.h,
            ),
            Sliderscreen()
            // Column(
            //   children: [
            //     CarouselSlider(
            //       options: CarouselOptions(
            //           height: 150.0,
            //           autoPlay: true,
            //           viewportFraction: 1,
            //           onPageChanged: (index, r) {
            //             setState(() {
            //               activeindex = index;
            //             });
            //           }),
            //       items: [1, 2, 3, 4, 5].map((i) {
            //         return Builder(
            //           builder: (BuildContext context) {
            //             return ClipRRect(
            //               borderRadius: BorderRadius.circular(12.r),
            //               child: Image.network(
            //                 "https://codingarabic.online/storage/slider/UOtz83Ow0ChFQOZYeDp48yWreuvBYjRwb8BNUexc.jpg",
            //                 fit: BoxFit.cover,
            //               ),
            //             );
            //           },
            //         );
            //       }).toList(),
            //     ),
            //     SizedBox(
            //       height: 10.h,
            //     ),
            //     AnimatedSmoothIndicator(
            //       activeIndex: activeindex,
            //       count: 5,
            //       effect: ExpandingDotsEffect(
            //           dotHeight: 10, activeDotColor: Appcolors.maincolor),
            //     )
            //   ],
            // )
          ],
        );
  //     } else {
  //       return Text("error");
  //     }
  //   });
  // }
}}
//       Padding(
//         padding: const EdgeInsets.all(8.0),
//         child: Column(children: [
//           SafeArea(
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.start,
//               children: [
//                 Image.asset("assets/images/bookk.png"),
//                 SizedBox(
//                   width: 5.w,
//                 ),
//                 InkWell(
//                     onTap: () {
//                       Navigator.pushReplacement(context,
//                           MaterialPageRoute(builder: (_) => WelcomeScreen()));
//                     },
//                     child: Text(
//                       "Bookia",
//                       style: TextStyle(fontSize: 20.sp),
//                     )),
//                 SizedBox(
//                   width: 230.w,
//                 ),
//                 InkWell(
//                     onTap: () {
//                       Navigator.push(context,
//                           MaterialPageRoute(builder: (_) => Searchscreen()));
//                     },
//                     child: Image.asset("assets/images/search-normal.png"))
//               ],
//             ),

//           ),
//       // mainAxisAlignment: MainAxisAlignment.center,
//       // children: [Text("home")],

//     ]));
//   }
// }
// import 'package:bokiaa/feature/auth/ui/search-screen.dart';
// import 'package:bokiaa/feature/welcome/ui/widgets/welcome-screen.dart';
// import 'package:bokiaa/generated/locale_keys.g.dart';
// import 'package:easy_localization/easy_localization.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';

// class Homeescreen extends StatelessWidget {
//   const Homeescreen({super.key});
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Padding(
//         padding: const EdgeInsets.all(8.0),
//         child: Column(children: [
//           SafeArea(
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.start,
//               children: [
//                 Image.asset("assets/images/bookk.png"),
//                 SizedBox(
//                   width: 5.w,
//                 ),
//                 InkWell(
//                     onTap: () {
//                       Navigator.pushReplacement(context,
//                           MaterialPageRoute(builder: (_) => WelcomeScreen()));
//                     },
//                     child: Text(
//                       "Bookia",
//                       style: TextStyle(fontSize: 20.sp),
//                     )),
//                 SizedBox(
//                   width: 230.w,
//                 ),
//                 InkWell(
//                     onTap: () {
//                       Navigator.push(context,
//                           MaterialPageRoute(builder: (_) => Searchscreen()));
//                     },
//                     child: Image.asset("assets/images/search-normal.png"))
//               ],
//             ),
//           ),
//           SizedBox(
//             height: 20.h,
//           ),
//           Container(
//             decoration: BoxDecoration(
//               borderRadius: BorderRadius.circular(20),
//               image: DecorationImage(
//                 image: AssetImage("assets/images/binkbook.png"),
//                 fit: BoxFit.cover,
//               ),
//             ),
//             width: 400,
//             height: 150,
//           ),
//           SizedBox(
//             height: 10.h,
//           ),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Container(
//                 width: 35,
//                 height: 10,
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(20),
//                   color: Color(0xffBFA054),
//                 ),
//               ),
//               SizedBox(width: 7.w),
//               Container(
//                 width: 10,
//                 height: 10,
//                 decoration: BoxDecoration(
//                   color: Colors.grey[300],
//                   borderRadius: BorderRadius.circular(20),
//                 ),
//               ),
//               SizedBox(width: 7.w),
//               Container(
//                 width: 10,
//                 height: 10,
//                 decoration: BoxDecoration(
//                   color: Colors.grey[300],
//                   borderRadius: BorderRadius.circular(20),
//                 ),
//               ),
//             ],
//           ),
//           SizedBox(
//             height: 10.h,
//           ),
//           Align(
//               alignment: Alignment.centerLeft,
//               child: Padding(
//                 padding: const EdgeInsets.all(8.0),
//                 child: Text(
//                   LocaleKeys.saller.tr(),
//                   style: TextStyle(
//                     fontSize: 20.sp,
//                   ),
//                 ),
//               ))
//         ]),
//       ),
//     );
//   }
// }
