import 'package:bokiaa/core/widgets/routes/app-router.dart';
import 'package:bokiaa/core/widgets/routes/app-routes.dart';
import 'package:bokiaa/feature/welcome/ui/widgets/welcome-screen.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Bookstoreapp extends StatelessWidget {
  const Bookstoreapp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode:true,
      child: MaterialApp(
       localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      theme: ThemeData(fontFamily: "DM"),
        // onGenerateRoute:AppRoutes().onGenerateRoute ,

        home:WelcomeScreen(),
        
      ),
    );
  }
}



















// import 'package:bokiaa/core/helper/app-constants.dart';
// import 'package:bokiaa/core/widgets/routes/app-router.dart';
// import 'package:bokiaa/feature/buttom-nav-bar/bottom-nav-bar-screen.dart';
// import 'package:bokiaa/feature/welcome/ui/widgets/welcome-screen.dart';
// import 'package:easy_localization/easy_localization.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';

// class BookStoreApp extends StatelessWidget {
//   const BookStoreApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return ScreenUtilInit(
//       designSize: const Size(375, 812),
//       minTextAdapt: true,
//       splitScreenMode: true,
//       child: MaterialApp(
//         localizationsDelegates: context.localizationDelegates,
//         supportedLocales: context.supportedLocales,
//         locale: context.locale,
//         theme: ThemeData(
//           fontFamily:"DM",
//           scaffoldBackgroundColor: Colors.white
//         ),
//         onGenerateRoute:AppRouter().onGenerateRoute ,
//         home: startScreen(),
//       ),
//     );
//   }

//   Widget startScreen(){
//     if(AppConstants.token==null){
//       return WelcomeScreen();
//     }else{
//       return BottomNavBarScreen();
//     }
//   }
// }

