

// // import 'package:bokiaa/core/widgets/routes/routes.dart';
// // import 'package:bokiaa/feature/auth/cubit/auth-cubit.dart';
// // import 'package:bokiaa/feature/auth/ui/bottom-nav-bar-screen.dart';
// // import 'package:bokiaa/feature/auth/ui/login-screen.dart';
// // import 'package:bokiaa/feature/auth/ui/register-screen.dart';
// // import 'package:bokiaa/feature/search/cupit/search-cupit.dart';
// // import 'package:bokiaa/feature/search/ui/search-screen.dart';
// // import 'package:flutter/material.dart';
// // import 'package:flutter_bloc/flutter_bloc.dart';

// // class AppRouter {
// //   Route? onGenerateRoute(RouteSettings settings) {
// //     switch (settings.name) {
// //       case Routes.loginScreen:
// //         return MaterialPageRoute(
// //           builder: (_) => BlocProvider(
// //             create: (context) => Authcubit(),
// //             child: LoginScreen(),
// //           ),
// //         );
// //       case Routes.registerScreen:
// //         return MaterialPageRoute(builder: (_) => BlocProvider(create: (context) => Authcubit(),
// //           child: RegisterScreen()));
// //       case Routes.bottomNavBarScreen:
// //         return MaterialPageRoute(builder: (_) => BottomNavBarScreen());

// //         case Routes.searchscreen:
// //         return MaterialPageRoute(builder: (_) => BlocProvider(create: (context) => Searchcupit(), 
// //         child: Searchscreen()));


// //       default:
// //         return null;
// //     }
// //   }
// // }





// // // import 'package:bokiaa/core/widgets/routes/routes.dart';
// // // import 'package:bokiaa/feature/auth/cubit/auth-cubit.dart';
// // // import 'package:bokiaa/feature/auth/ui/bottom-nav-bar-screen.dart';
// // // import 'package:bokiaa/feature/auth/ui/login-screen.dart';
// // // import 'package:bokiaa/feature/auth/ui/register-screen.dart';
// // // import 'package:bokiaa/feature/home/ui/home-screen.dart';
// // // import 'package:bokiaa/feature/welcome/ui/widgets/welcome-screen.dart';
// // // import 'package:flutter/material.dart';
// // // import 'package:flutter_bloc/flutter_bloc.dart';

// // // class AppRouter {
// // //   Route<dynamic>? onGenerateRoute(RouteSettings settings) {
// // //     switch (settings.name) {

// // //       case Routes.loginScreen:
// // //         return MaterialPageRoute(
// // //           builder: (_) => BlocProvider(
// // //             create: (_) => Authcubit(),
// // //             child: const LoginScreen(),
// // //           ),
// // //         );

// // //       case Routes.registerScreen:
// // //         return MaterialPageRoute(
// // //           builder: (_) => BlocProvider(
// // //             create: (_) => Authcubit(),
// // //             child: const RegisterScreen(),
// // //           ),
// // //         );

// // //       case Routes.bottomNavBarScreen:
// // //         return MaterialPageRoute(
// // //           builder: (_) => const BottomNavBarScreen(),
// // //         );


// // //          case Routes.welcomeScreen:
// // //         return MaterialPageRoute(
// // //           builder: (_) => const WelcomeScreen(),  
// // //         );


// // //            case Routes.homescreen:
// // //         return MaterialPageRoute(
// // //           builder: (_) => const Homescreen() ,
          
// // //         );
// // //       default:
// // //         return MaterialPageRoute(
// // //           builder: (_) => const Scaffold(
// // //             body: Center(
// // //               child: Text("No Route Found"),
// // //             ),
// // //           ),
// // //         );
// // //     }
// // //   }
// // // }


// import 'package:bokiaa/core/widgets/routes/app-routes.dart';
// import 'package:bokiaa/feature/auth/cubit/auth-cubit.dart';
// import 'package:bokiaa/feature/auth/ui/bottom-nav-bar-screen.dart';
// import 'package:bokiaa/feature/auth/ui/create-password-screen.dart';
// import 'package:bokiaa/feature/auth/ui/forget-password-screen.dart';
// import 'package:bokiaa/feature/auth/ui/login-screen.dart';
// import 'package:bokiaa/feature/auth/ui/otp-screen.dart';
// import 'package:bokiaa/feature/auth/ui/password-change-screen.dart';
// import 'package:bokiaa/feature/auth/ui/register-screen.dart';
// import 'package:bokiaa/feature/editprofile/ui/editprofile-screen.dart';
// import 'package:bokiaa/feature/orders/ui/myorders-screen.dart';
// import 'package:bokiaa/feature/search/cupit/search-cupit.dart';
// import 'package:bokiaa/feature/search/ui/search-screen.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// class Approuter {
//   get onGenerateRoute => null;

//   static Route<dynamic> generateRoute(RouteSettings settings) {
//     switch (settings.name) {
//       // case AppRoutes.onboarding:
//       //   return MaterialPageRoute(builder: (_) => const OnBoardingScreen());

//       case AppRoutes.login:
//         final cubit = Authcubit();
//         return MaterialPageRoute(
//           builder: (_) =>
//               BlocProvider.value(value: cubit, child: const LoginScreen()),
//         );

//       case AppRoutes.register:
//         final cubit = Authcubit();
//         return MaterialPageRoute(
//           builder: (_) =>
//               BlocProvider.value(value: cubit, child: const RegisterScreen()),
//         );
//       case AppRoutes.forgotPasswordScreen:
//         return MaterialPageRoute(builder: (_) => ForgotPasswordScreen());
//       case AppRoutes.otpVerfication:
//         return MaterialPageRoute(builder: (_) => Otpscreen());
//       case AppRoutes.createNewPasswordScreen:
//         return MaterialPageRoute(builder: (_) => CreateNewPasswordScreen());
//       case AppRoutes.passwordChangedSuccess:
//         return MaterialPageRoute(builder: (_) => PasswordChangedScreen());
//       // case AppRoutes.congrates:
//       //   return MaterialPageRoute(builder: (_) => CongratesScreen());
//       // case AppRoutes.showMyorders:
//       //   return MaterialPageRoute(builder: (_) => MyOrdersScreen());
//       // case AppRoutes.editProfile:
//       //   return MaterialPageRoute(builder: (_) => EditProfileScreen());
//       // case AppRoutes.editPassword:
//       //   return MaterialPageRoute(builder: (_) => UpdateNewPasswordScreen());
//       // case AppRoutes.placeOrder:
//       //   final total = settings.arguments as String;
//       //   return MaterialPageRoute(
//       //     builder: (_) => PlaceOrderScreen(total: total),
//       //   );
//       // case AppRoutes.searchScreen:
//       //   final args = settings.arguments as SearchArgs;
//       //   return MaterialPageRoute(
//       //     builder: (_) => MultiBlocProvider(
//       //       providers: [
//       //         BlocProvider(create: (_) => Searchcupit()),
//       //         BlocProvider.value(value: args.cartCubit),
//       //         BlocProvider.value(value: args.wishlistCubit),
//       //       ],
//       //       child: const Searchscreen(),
//       //     ),
//       //   );

//       case AppRoutes.bottomNavBarScreen:
//         return MaterialPageRoute(builder: (_) => const BottomNavBarScreen());

//       // case AppRoutes.booksDetails:
//       //   final args = settings.arguments as BookDetailsArgs;
//       //   return MaterialPageRoute(
//       //     builder: (_) => MultiBlocProvider(
//       //       providers: [
//       //         BlocProvider.value(value: args.cartCubit),
//       //         BlocProvider.value(value: args.wishlistCubit),
//       //       ],
//       //       child: BookDetailsScreen(book: args.book),
//       //     ),
//       //   );

//       default:
//         return MaterialPageRoute(
//           builder: (_) => Scaffold(
//             body: Center(child: Text('No route defined for ${settings.name}')),
//           ),
//         );
//     }
//   }
// }