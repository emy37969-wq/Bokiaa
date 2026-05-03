// import 'package:bokiaa/core/theme/app-colors.dart';
// import 'package:bokiaa/feature/cart/cupit/cart_cupit.dart';
// import 'package:bokiaa/feature/cart/ui/cart-screen.dart';
// import 'package:bokiaa/feature/home/cupit/home-cupit.dart';
// import 'package:bokiaa/feature/home/ui/home-screen.dart';
// import 'package:bokiaa/feature/profile/ui/profile_screen.dart';
// import 'package:bokiaa/feature/wishlist/ui/wishlist-screen.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// class BottomNavBarScreen extends StatefulWidget {
//   const BottomNavBarScreen({super.key});

//   @override
//   State<BottomNavBarScreen> createState() => _BottomNavBarScreenState();
// }

// class _BottomNavBarScreenState extends State<BottomNavBarScreen> {
//   int activindex = 0;
  // int _currentIndex = 0;
  // late final CartCubit _cartCubit;
  // late final WishlistCubit _wishlistCubit;
  // late final List<Widget> _screens;

//   List<Widget> screens = [
//     BlocProvider(
//         create: (context) => HomeCubit()
//           ..getslider()
//           ..getbestseeler(),
//         child: Homescreen()),
//     Wishlistscreen(),
//     BlocProvider(
//       create: (context) => CartCubit()..getCart(),
//       child: CartScreen(),
//     ),
//     ProfileScreen()
//   ];
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       bottomNavigationBar: BottomNavigationBar(
//         currentIndex: activindex,
//         onTap: (index) {
//           setState(() {
//             activindex = index;
//           });
//         },
//         items: [
//           BottomNavigationBarItem(
//               icon: Image.asset(
//                 "assets/images/Home.png",
//                 color: activindex == 0 ? AppColors.primaryColor : Colors.black,
//               ),
//               label: ""),
//           BottomNavigationBarItem(
//               icon: Image.asset(
//                 "assets/images/Bookmark (1).png",
//                 color: activindex == 1 ? AppColors.primaryColor : Colors.black,
//               ),
//               label: ""),
//           BottomNavigationBarItem(
//               icon: Image.asset(
//                 "assets/images/Category.png",
//                 color: activindex == 2 ? AppColors.primaryColor : Colors.black,
//               ),
//               label: ""),
//           BottomNavigationBarItem(
//               icon: Image.asset(
//                 "assets/images/Profile.png",
//                 color: activindex == 3 ? AppColors.primaryColor : Colors.black,
//               ),
//               label: ""),
//         ],
//       ),
//       // body: screens[activindex],
//       body: screens[activindex.clamp(0, screens.length - 1)],

//       // body:
//       // Padding(
//       //   padding: const EdgeInsets.all(8.0),
//       //   child: Column(children: [
//       //     SafeArea(
//       //       child: Row(
//       //         mainAxisAlignment: MainAxisAlignment.start,
//       //         children: [
//       //           Image.asset("assets/images/bookk.png"),
//       //           SizedBox(
//       //             width: 5.w,
//       //           ),
//       //           InkWell(
//       //               onTap: () {
//       //                 Navigator.pushReplacement(context,
//       //                     MaterialPageRoute(builder: (_) => WelcomeScreen()));
//       //               },
//       //               child: Text(
//       //                 "Bookia",
//       //                 style: TextStyle(fontSize: 20.sp),
//       //               )),
//       //           SizedBox(
//       //             width: 230.w,
//       //           ),
//       //           InkWell(
//       //               onTap: () {
//       //                 Navigator.push(context,
//       //                     MaterialPageRoute(builder: (_) => Searchscreen()));
//       //               },
//       //               child: Image.asset("assets/images/search-normal.png"))
//       //         ],
//       //       ),
//       //     ),
//       //     SizedBox(
//       //       height: 20.h,
//       //     ),
//       // Container(
//       //   decoration: BoxDecoration(
//       //     borderRadius: BorderRadius.circular(20),
//       //     image: DecorationImage(
//       //       image: AssetImage("assets/images/binkbook.png"),
//       //       fit: BoxFit.cover,
//       //     ),
//       //   ),
//       //   width: 400,
//       //   height: 150,
//       // ),
//       // SizedBox(
//       //   height: 10.h,
//       // ),
//       // Row(
//       //   mainAxisAlignment: MainAxisAlignment.center,
//       //   children: [
//       //     Container(
//       //       width: 35,
//       //       height: 10,
//       //       decoration: BoxDecoration(
//       //         borderRadius: BorderRadius.circular(20),
//       //         color: Color(0xffBFA054),
//       //       ),
//       //     ),
//       //     SizedBox(width: 7.w),
//       //     Container(
//       //       width: 10,
//       //       height: 10,
//       //       decoration: BoxDecoration(
//       //         color: Colors.grey[300],
//       //         borderRadius: BorderRadius.circular(20),
//       //       ),
//       //     ),
//       //     SizedBox(width: 7.w),
//       //     Container(
//       //       width: 10,
//       //       height: 10,
//       //       decoration: BoxDecoration(
//       //         color: Colors.grey[300],
//       //         borderRadius: BorderRadius.circular(20),
//       //       ),
//       //     ),
//       //   ],
//       // ),
//       //     SizedBox(
//       //       height: 10.h,
//       //     ),
//       //     Align(
//       //         alignment: Alignment.centerLeft,
//       //         child: Padding(
//       //           padding: const EdgeInsets.all(8.0),
//       //           child: Text(
//       //             LocaleKeys.saller.tr(),
//       //             style: TextStyle(
//       //               fontSize: 20.sp,
//       //             ),
//       //           ),
//       //         ))
//       //   ]),
//       // ),
//       //  Column(
//       //   mainAxisAlignment: MainAxisAlignment.center,
//       //   children: [
//       //     IconButton(onPressed: ()async{
//       //       SharedPreferences pref=await  SharedPreferences.getInstance();
//       //       await pref.remove("token");
//       //       // ignore: use_build_context_synchronously
//       //       Navigator.pushNamedAndRemoveUntil((context), Routes.loginScreen,(e)=>false );
//       //     }, icon: Icon(Icons.login))
//       //   ],
//       // ),
//     );
//   }
// }


import 'package:bokiaa/core/theme/app-colors.dart';
import 'package:bokiaa/feature/cart/cupit/cart_cupit.dart';
import 'package:bokiaa/feature/cart/ui/cart-screen.dart';
import 'package:bokiaa/feature/home/cupit/home-cupit.dart';
import 'package:bokiaa/feature/home/ui/home-screen.dart';
import 'package:bokiaa/feature/profile/cupit/profile_cupit.dart';
import 'package:bokiaa/feature/profile/ui/profile_screen.dart';
import 'package:bokiaa/feature/wishlistt/cupit/wishlist_cupit.dart';
import 'package:bokiaa/feature/wishlistt/ui/wishlist_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/theme/app_theme.dart';

class BottomNavBarScreen extends StatefulWidget {
  const BottomNavBarScreen({super.key});

  @override
  State<BottomNavBarScreen> createState() => _BottomNavBarScreenState();
}

class _BottomNavBarScreenState extends State<BottomNavBarScreen> {
  int _currentIndex = 0;
  int activindex = 0;
  late final CartCubit _cartCubit;
  late final WishlistCubit _wishlistCubit;
  late final List<Widget> _screens;

  @override
  void initState() {
    super.initState();
    _cartCubit = CartCubit()..getCart();
    _wishlistCubit = WishlistCubit()..getWishlist();
    _screens = [
      BlocProvider(
        create: (_) => HomeCubit()..getHomeData(),
        child: const HomeScreen(),
      ),
      BlocProvider.value(value: _wishlistCubit, child: const WishlistScreen()),
      BlocProvider.value(value: _cartCubit, child: const CartScreen()),
      BlocProvider(create: (_) => ProfileCubit(), child: const ProfileScreen()),
    ];
  }

  @override
  void dispose() {
    _cartCubit.close();
    _wishlistCubit.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider.value(value: _cartCubit),
        BlocProvider.value(value: _wishlistCubit),
      ],
      child: Scaffold(
        backgroundColor: context.appColors.background,
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          onTap: (index) => setState(() => _currentIndex = index),
          backgroundColor: context.appColors.background,
          type: BottomNavigationBarType.fixed,
          showSelectedLabels: true,
          showUnselectedLabels: false,
          elevation: 0,
          items: [
          BottomNavigationBarItem(
              icon: Image.asset(
                "assets/images/Home.png",
                color: activindex == 0 ? AppColors.primaryColor : Colors.black,
              ),
              label: ""),
          BottomNavigationBarItem(
              icon: Image.asset(
                "assets/images/Bookmark (1).png",
                color: activindex == 1 ? AppColors.primaryColor : Colors.black,
              ),
              label: ""),
          BottomNavigationBarItem(
              icon: Image.asset(
                "assets/images/Category.png",
                color: activindex == 2 ? AppColors.primaryColor : Colors.black,
              ),
              label: ""),
          BottomNavigationBarItem(
              icon: Image.asset(
                "assets/images/Profile.png",
                color: activindex == 3 ? AppColors.primaryColor : Colors.black,
              ),
              label: ""),
          ],
        ),
        body: IndexedStack(index: _currentIndex, children: _screens),
      ),
    );
  }
}
