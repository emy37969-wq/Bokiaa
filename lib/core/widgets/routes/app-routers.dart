// // import 'package:bokiaa/core/widgets/routes/app-routes.dart';
// // import 'package:bokiaa/feature/auth/cubit/auth-cubit.dart';
// // import 'package:bokiaa/feature/auth/ui/bottom-nav-bar-screen.dart';
// // import 'package:bokiaa/feature/auth/ui/login-screen.dart';
// // import 'package:bokiaa/feature/auth/ui/register-screen.dart';
// // import 'package:bokiaa/feature/home/cupit/home-cupit.dart';
// // import 'package:bokiaa/feature/home/sliders/slider-screen.dart';
// // import 'package:bokiaa/feature/home/ui/home-screen.dart';
// // import 'package:bokiaa/feature/search/cupit/search-cupit.dart';
// // import 'package:bokiaa/feature/search/ui/search-screen.dart';
// // import 'package:flutter/material.dart';
// // import 'package:flutter_bloc/flutter_bloc.dart';

// // class AppRouter {
// //   Route? onGenerateRoute(RouteSettings settings) {
// //     switch (settings.name) {
// //       case AppRoutes.login:
// //         return MaterialPageRoute(
// //           builder: (_) => BlocProvider(
// //             create: (context) => Authcubit(),
// //             child: LoginScreen(),
// //           ),
// //         );
// //       case AppRoutes.register:
// //         return MaterialPageRoute(builder: (_) => BlocProvider(create: (context) => Authcubit(),
// //           child: RegisterScreen()));
// //       case AppRoutes.bottomNavBarScreen:
// //         return MaterialPageRoute(builder: (_) => BottomNavBarScreen());

// //         case AppRoutes.searchScreen:
// //         return MaterialPageRoute(builder: (_) => BlocProvider(create: (context) => Searchcupit(),
// //         child: Searchscreen()));
// //      case AppRoutes.home:
// //         return MaterialPageRoute(builder: (_) => BlocProvider(create: (context) => HomeCubit(),
// //         child: Homescreen()));

// //       default:
// //         return null;
// //     }
// //   }
// // }

// // // // // import 'package:bokiaa/core/widgets/routes/routes.dart';
// // // // // import 'package:bokiaa/feature/auth/cubit/auth-cubit.dart';
// // // // // import 'package:bokiaa/feature/auth/ui/bottom-nav-bar-screen.dart';
// // // // // import 'package:bokiaa/feature/auth/ui/login-screen.dart';
// // // // // import 'package:bokiaa/feature/auth/ui/register-screen.dart';
// // // // // import 'package:bokiaa/feature/home/ui/home-screen.dart';
// // // // // import 'package:bokiaa/feature/welcome/ui/widgets/welcome-screen.dart';
// // // // // import 'package:flutter/material.dart';
// // // // // import 'package:flutter_bloc/flutter_bloc.dart';

// // // // // class AppRouter {
// // // // //   Route<dynamic>? onGenerateRoute(RouteSettings settings) {
// // // // //     switch (settings.name) {

// // // // //       case Routes.loginScreen:
// // // // //         return MaterialPageRoute(
// // // // //           builder: (_) => BlocProvider(
// // // // //             create: (_) => Authcubit(),
// // // // //             child: const LoginScreen(),
// // // // //           ),
// // // // //         );

// // // // //       case Routes.registerScreen:
// // // // //         return MaterialPageRoute(
// // // // //           builder: (_) => BlocProvider(
// // // // //             create: (_) => Authcubit(),
// // // // //             child: const RegisterScreen(),
// // // // //           ),
// // // // //         );

// // // // //       case Routes.bottomNavBarScreen:
// // // // //         return MaterialPageRoute(
// // // // //           builder: (_) => const BottomNavBarScreen(),
// // // // //         );

// // // // //          case Routes.welcomeScreen:
// // // // //         return MaterialPageRoute(
// // // // //           builder: (_) => const WelcomeScreen(),
// // // // //         );

// // // // //            case Routes.homescreen:
// // // // //         return MaterialPageRoute(
// // // // //           builder: (_) => const Homescreen() ,

// // // // //         );
// // // // //       default:
// // // // //         return MaterialPageRoute(
// // // // //           builder: (_) => const Scaffold(
// // // // //             body: Center(
// // // // //               child: Text("No Route Found"),
// // // // //             ),
// // // // //           ),
// // // // //         );
// // // // //     }
// // // // //   }
// // // // // }

// // // import 'package:bokiaa/core/widgets/routes/app-routes.dart';
// // // import 'package:bokiaa/feature/auth/cubit/auth-cubit.dart';
// // // import 'package:bokiaa/feature/auth/ui/bottom-nav-bar-screen.dart';
// // // import 'package:bokiaa/feature/auth/ui/create-password-screen.dart';
// // // import 'package:bokiaa/feature/auth/ui/forget-password-screen.dart';
// // // import 'package:bokiaa/feature/auth/ui/login-screen.dart';
// // // import 'package:bokiaa/feature/auth/ui/otp-screen.dart';
// // // import 'package:bokiaa/feature/auth/ui/password-change-screen.dart';
// // // import 'package:bokiaa/feature/auth/ui/register-screen.dart';
// // // import 'package:bokiaa/feature/editprofile/ui/editprofile-screen.dart';
// // // import 'package:bokiaa/feature/orders/ui/myorders-screen.dart';
// // // import 'package:bokiaa/feature/search/cupit/search-cupit.dart';
// // // import 'package:bokiaa/feature/search/ui/search-screen.dart';
// // // import 'package:flutter/material.dart';
// // // import 'package:flutter_bloc/flutter_bloc.dart';

// // // class Approuter {
// // //   get onGenerateRoute => null;

// // //   static Route<dynamic> generateRoute(RouteSettings settings) {
// // //     switch (settings.name) {
// // //       // case AppRoutes.onboarding:
// // //       //   return MaterialPageRoute(builder: (_) => const OnBoardingScreen());

// // //       case AppRoutes.login:
// // //         final cubit = Authcubit();
// // //         return MaterialPageRoute(
// // //           builder: (_) =>
// // //               BlocProvider.value(value: cubit, child: const LoginScreen()),
// // //         );

// // //       case AppRoutes.register:
// // //         final cubit = Authcubit();
// // //         return MaterialPageRoute(
// // //           builder: (_) =>
// // //               BlocProvider.value(value: cubit, child: const RegisterScreen()),
// // //         );
// // //       case AppRoutes.forgotPasswordScreen:
// // //         return MaterialPageRoute(builder: (_) => ForgotPasswordScreen());
// // //       case AppRoutes.otpVerfication:
// // //         return MaterialPageRoute(builder: (_) => Otpscreen());
// // //       case AppRoutes.createNewPasswordScreen:
// // //         return MaterialPageRoute(builder: (_) => CreateNewPasswordScreen());
// // //       case AppRoutes.passwordChangedSuccess:
// // //         return MaterialPageRoute(builder: (_) => PasswordChangedScreen());
// // //       // case AppRoutes.congrates:
// // //       //   return MaterialPageRoute(builder: (_) => CongratesScreen());
// // //       // case AppRoutes.showMyorders:
// // //       //   return MaterialPageRoute(builder: (_) => MyOrdersScreen());
// // //       // case AppRoutes.editProfile:
// // //       //   return MaterialPageRoute(builder: (_) => EditProfileScreen());
// // //       // case AppRoutes.editPassword:
// // //       //   return MaterialPageRoute(builder: (_) => UpdateNewPasswordScreen());
// // //       // case AppRoutes.placeOrder:
// // //       //   final total = settings.arguments as String;
// // //       //   return MaterialPageRoute(
// // //       //     builder: (_) => PlaceOrderScreen(total: total),
// // //       //   );
// // //       // case AppRoutes.searchScreen:
// // //       //   final args = settings.arguments as SearchArgs;
// // //       //   return MaterialPageRoute(
// // //       //     builder: (_) => MultiBlocProvider(
// // //       //       providers: [
// // //       //         BlocProvider(create: (_) => Searchcupit()),
// // //       //         BlocProvider.value(value: args.cartCubit),
// // //       //         BlocProvider.value(value: args.wishlistCubit),
// // //       //       ],
// // //       //       child: const Searchscreen(),
// // //       //     ),
// // //       //   );

// // //       case AppRoutes.bottomNavBarScreen:
// // //         return MaterialPageRoute(builder: (_) => const BottomNavBarScreen());

// // //       // case AppRoutes.booksDetails:
// // //       //   final args = settings.arguments as BookDetailsArgs;
// // //       //   return MaterialPageRoute(
// // //       //     builder: (_) => MultiBlocProvider(
// // //       //       providers: [
// // //       //         BlocProvider.value(value: args.cartCubit),
// // //       //         BlocProvider.value(value: args.wishlistCubit),
// // //       //       ],
// // //       //       child: BookDetailsScreen(book: args.book),
// // //       //     ),
// // //       //   );

// // //       default:
// // //         return MaterialPageRoute(
// // //           builder: (_) => Scaffold(
// // //             body: Center(child: Text('No route defined for ${settings.name}')),
// // //           ),
// // //         );
// // //     }
// // //   }
// // // }

// // import 'package:bokiaa/core/ntework/paymob_service.dart';
// // import 'package:bokiaa/core/theme/app-colors.dart';
// // import 'package:bokiaa/core/theme/app_theme.dart';
// // import 'package:bokiaa/core/widgets/routes/app-routes.dart';
// // import 'package:bokiaa/feature/auth/cubit/auth-cubit.dart';
// // import 'package:bokiaa/feature/auth/ui/bottom-nav-bar-screen.dart';
// // import 'package:bokiaa/feature/auth/ui/create-password-screen.dart';
// // import 'package:bokiaa/feature/auth/ui/forget-password-screen.dart';
// // import 'package:bokiaa/feature/auth/ui/login-screen.dart';
// // import 'package:bokiaa/feature/auth/ui/otp-screen.dart';
// // import 'package:bokiaa/feature/auth/ui/password-change-screen.dart';
// // import 'package:bokiaa/feature/auth/ui/register-screen.dart';
// // import 'package:bokiaa/feature/cart/data/repo/model/place_order_args.dart';
// // import 'package:bokiaa/feature/cart/ui/congrates_screen.dart';
// // import 'package:bokiaa/feature/cart/ui/place_order_screen.dart';
// // import 'package:bokiaa/feature/home/data/models/book_details_arg.dart';
// // import 'package:bokiaa/feature/home/ui/book_details/book_deatials_screen.dart';
// // import 'package:bokiaa/feature/on_boarding_screen.dart';
// // import 'package:bokiaa/feature/orders/ui/myorders-screen.dart';
// // import 'package:bokiaa/feature/payment/cupit/payment_cupit.dart';
// // import 'package:bokiaa/feature/payment/ui/paymop_webview_screen.dart';
// // import 'package:bokiaa/feature/profile/ui/update_profile.dart';
// // import 'package:bokiaa/feature/search/cupit/search-cupit.dart';
// // import 'package:bokiaa/feature/search/data/model/search_args.dart';
// // import 'package:bokiaa/feature/search/ui/search-screen.dart';
// // import 'package:flutter/material.dart';
// // import 'package:flutter_bloc/flutter_bloc.dart';
// // import 'package:flutter_screenutil/flutter_screenutil.dart';

// // class AppRouter {
// //   Route<dynamic>? onGenerateRoute(RouteSettings settings) {
// //     return AppRouter.generateRoute(settings);
// //   }

// //   static Route<dynamic> generateRoute(RouteSettings settings) {
// //     switch (settings.name) {
// //       case AppRoutes.onboarding:
// //         return MaterialPageRoute(builder: (_) => const OnBoardingScreen());

// //       case AppRoutes.login:
// //         final cubit = Authcubit();
// //         return MaterialPageRoute(
// //           builder: (_) =>
// //               BlocProvider.value(value: cubit, child: const LoginScreen()),
// //         );

// //       case AppRoutes.register:
// //         final cubit = Authcubit();
// //         return MaterialPageRoute(
// //           builder: (_) =>
// //               BlocProvider.value(value: cubit, child: const RegisterScreen()),
// //         );
// //       case AppRoutes.forgotPasswordScreen:
// //         return MaterialPageRoute(builder: (_) => ForgotPasswordScreen());
// //       case AppRoutes.otpVerfication:
// //         return MaterialPageRoute(builder: (_) => Otpscreen());
// //       case AppRoutes.createNewPasswordScreen:
// //         return MaterialPageRoute(builder: (_) => CreateNewPasswordScreen());
// //       case AppRoutes.passwordChangedSuccess:
// //         return MaterialPageRoute(builder: (_) => PasswordChangedScreen());
// //       case AppRoutes.congrates:
// //         return MaterialPageRoute(builder: (_) => CongratesScreen());
// //       case AppRoutes.paymentWebView:
// //         final url = settings.arguments as String;
// //         return MaterialPageRoute(
// //           builder: (_) => PaymobWebViewScreen(paymentUrl: url),
// //         );
// //       case AppRoutes.payment:
// //         final args = settings.arguments as PlaceOrderArgs;
// //         return MaterialPageRoute(
// //           builder: (_) => BlocProvider(
// //             create: (_) => PaymentCubit(PaymobService()),
// //             child: _PaymentLoader(args: args),
// //           ),
// //         );
// //       case AppRoutes.showMyorders:
// //         return MaterialPageRoute(builder: (_) => MyOrdersScreen());
// //       case AppRoutes.editProfile:
// //         return MaterialPageRoute(builder: (_) => EditProfileScreen());
// //       case AppRoutes.editPassword:
// //         return MaterialPageRoute(builder: (_) => CreateNewPasswordScreen());
// //       case AppRoutes.placeOrder:
// //         final total = settings.arguments as String;
// //         return MaterialPageRoute(
// //           builder: (_) => PlaceOrderScreen(total: total),
// //         );
// //       case AppRoutes.searchScreen:
// //         final args = settings.arguments as SearchArgs;
// //         return MaterialPageRoute(
// //           builder: (_) => MultiBlocProvider(
// //             providers: [
// //               BlocProvider(create: (_) => SearchCubit()),
// //               BlocProvider.value(value: args.cartCubit),
// //               BlocProvider.value(value: args.wishlistCubit),
// //             ],
// //             child: const SearchScreen(),
// //           ),
// //         );

// //       case AppRoutes.bottomNavBarScreen:
// //         return MaterialPageRoute(builder: (_) => const BottomNavBarScreen());

// //       case AppRoutes.booksDetails:
// //         final args = settings.arguments as BookDetailsArgs;
// //         return MaterialPageRoute(
// //           builder: (_) => MultiBlocProvider(
// //             providers: [
// //               BlocProvider.value(value: args.cartCubit),
// //               BlocProvider.value(value: args.wishlistCubit),
// //             ],
// //             child: BookDetailsScreen(book: args.book),
// //           ),
// //         );

// //       default:
// //         return MaterialPageRoute(
// //           builder: (_) => Scaffold(
// //             body: Center(child: Text('No route defined for ${settings.name}')),
// //           ),
// //         );
// //     }
// //   }
// // }

// // class _PaymentLoader extends StatefulWidget {
// //   const _PaymentLoader({required this.args});

// //   final PlaceOrderArgs args;

// //   @override
// //   State<_PaymentLoader> createState() => _PaymentLoaderState();
// // }

// // class _PaymentLoaderState extends State<_PaymentLoader> {
// //   @override
// //   void initState() {
// //     super.initState();
// //     context.read<PaymentCubit>().initiatePayment(
// //           amount: double.parse(widget.args.total),
// //           firstName: widget.args.name,
// //           email: widget.args.email,
// //           phone: widget.args.phone,
// //         );
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //     return BlocListener<PaymentCubit, PaymentState>(
// //       listener: (context, state) {
// //         if (state is PaymentUrlReady) {
// //           Navigator.pushReplacementNamed(
// //             context,
// //             AppRoutes.paymentWebView,
// //             arguments: state.url,
// //           );
// //         } else if (state is PaymentError) {
// //           ScaffoldMessenger.of(context).showSnackBar(
// //             SnackBar(content: Text(state.message), backgroundColor: Colors.red),
// //           );
// //           Navigator.pop(context);
// //         }
// //       },
// //       child: Scaffold(
// //         backgroundColor: context.appColors.background,
// //         body: Center(
// //           child: Column(
// //             mainAxisSize: MainAxisSize.min,
// //             children: [
// //               const CircularProgressIndicator(color: AppColors.primaryColor),
// //               const SizedBox(height: 16),
// //               Text(
// //                 'Preparing your payment...',
// //                 style: TextStyle(
// //                   color: context.appColors.subtitle,
// //                   fontSize: 14.sp,
// //                 ),
// //               ),
// //             ],
// //           ),
// //         ),
// //       ),
// //     );
// //   }
// // }


// import 'package:bokiaa/core/ntework/paymob_service.dart';
// import 'package:bokiaa/core/theme/app-colors.dart';
// import 'package:bokiaa/core/theme/app_theme.dart';
// import 'package:bokiaa/core/widgets/routes/app-routes.dart';
// import 'package:bokiaa/feature/auth/cubit/auth-cubit.dart';
// import 'package:bokiaa/feature/auth/ui/bottom-nav-bar-screen.dart';
// import 'package:bokiaa/feature/auth/ui/create-password-screen.dart';
// import 'package:bokiaa/feature/auth/ui/forget-password-screen.dart';
// import 'package:bokiaa/feature/auth/ui/login-screen.dart';
// import 'package:bokiaa/feature/auth/ui/password-change-screen.dart';
// import 'package:bokiaa/feature/auth/ui/register-screen.dart';
// import 'package:bokiaa/feature/auth/ui/widgets/otp_verfication_screen.dart';
// import 'package:bokiaa/feature/cart/data/repo/model/place_order_args.dart';
// import 'package:bokiaa/feature/cart/ui/congrates_screen.dart';
// import 'package:bokiaa/feature/cart/ui/place_order_screen.dart';
// import 'package:bokiaa/feature/home/data/models/book_details_arg.dart';
// import 'package:bokiaa/feature/home/ui/book_details/book_deatials_screen.dart';
// import 'package:bokiaa/feature/on_boarding_screen.dart';
// import 'package:bokiaa/feature/orders/ui/myorders-screen.dart';
// import 'package:bokiaa/feature/payment/cupit/payment_cupit.dart';
// import 'package:bokiaa/feature/payment/ui/paymop_webview_screen.dart';
// import 'package:bokiaa/feature/profile/ui/update_profile.dart';
// import 'package:bokiaa/feature/search/cupit/search-cupit.dart';
// import 'package:bokiaa/feature/search/data/model/search_args.dart';
// import 'package:bokiaa/feature/search/ui/search-screen.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:gap/gap.dart';


// class AppRouter {
//   get onGenerateRoute => null;

//   static Route<dynamic> generateRoute(RouteSettings settings) {
//     switch (settings.name) {
//       case AppRoutes.onboarding:
//         return MaterialPageRoute(builder: (_) => const OnBoardingScreen());

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
//         return MaterialPageRoute(builder: (_) => OtpVerificationScreen());
//       case AppRoutes.createNewPasswordScreen:
//         return MaterialPageRoute(builder: (_) => CreateNewPasswordScreen());
//       case AppRoutes.passwordChangedSuccess:
//         return MaterialPageRoute(builder: (_) => PasswordChangedScreen());
//       case AppRoutes.congrates:
//         return MaterialPageRoute(builder: (_) => CongratesScreen());
//       case AppRoutes.paymentWebView:
//         final url = settings.arguments as String;
//         return MaterialPageRoute(
//           builder: (_) => PaymobWebViewScreen(paymentUrl: url),
//         );
//       case AppRoutes.payment:
//         final args = settings.arguments as PlaceOrderArgs;
//         return MaterialPageRoute(
//           builder: (_) => BlocProvider(
//             create: (_) => PaymentCubit(PaymobService()),
//             child: _PaymentLoader(args: args),
//           ),
//         );
//       case AppRoutes.showMyorders:
//         return MaterialPageRoute(builder: (_) => MyOrdersScreen());
//       case AppRoutes.editProfile:
//         return MaterialPageRoute(builder: (_) => EditProfileScreen());
//       case AppRoutes.editPassword:
//         return MaterialPageRoute(builder: (_) => EditProfileScreen());
//       case AppRoutes.placeOrder:
//         final total = settings.arguments as String;
//         return MaterialPageRoute(
//           builder: (_) => PlaceOrderScreen(total: total),
//         );
//       case AppRoutes.searchScreen:
//         final args = settings.arguments as SearchArgs;
//         return MaterialPageRoute(
//           builder: (_) => MultiBlocProvider(
//             providers: [
//               BlocProvider(create: (_) => SearchCubit()),
//               BlocProvider.value(value: args.cartCubit),
//               BlocProvider.value(value: args.wishlistCubit),
//             ],
//             child: const SearchScreen(),
//           ),
//         );

//       case AppRoutes.bottomNavBarScreen:
//         return MaterialPageRoute(builder: (_) => const BottomNavBarScreen());

//       case AppRoutes.booksDetails:
//         final args = settings.arguments as BookDetailsArgs;
//         return MaterialPageRoute(
//           builder: (_) => MultiBlocProvider(
//             providers: [
//               BlocProvider.value(value: args.cartCubit),
//               BlocProvider.value(value: args.wishlistCubit),
//             ],
//             child: BookDetailsScreen(book: args.book),
//           ),
//         );

//       default:
//         return MaterialPageRoute(
//           builder: (_) => Scaffold(
//             body: Center(child: Text('No route defined for ${settings.name}')),
//           ),
//         );
//     }
//   }
// }

// class _PaymentLoader extends StatefulWidget {
//   const _PaymentLoader({required this.args});

//   final PlaceOrderArgs args;

//   @override
//   State<_PaymentLoader> createState() => _PaymentLoaderState();
// }

// class _PaymentLoaderState extends State<_PaymentLoader> {
//   @override
//   void initState() {
//     super.initState();
//     context.read<PaymentCubit>().initiatePayment(
//       amount: double.parse(widget.args.total),
//       firstName: widget.args.name,
//       email: widget.args.email,
//       phone: widget.args.phone,
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return BlocListener<PaymentCubit, PaymentState>(
//       listener: (context, state) {
//         if (state is PaymentUrlReady) {
//           Navigator.pushReplacementNamed(
//             context,
//             AppRoutes.paymentWebView,
//             arguments: state.url,
//           );
//         } else if (state is PaymentError) {
//           ScaffoldMessenger.of(context).showSnackBar(
//             SnackBar(content: Text(state.message), backgroundColor: Colors.red),
//           );
//           Navigator.pop(context);
//         }
//       },
//       child: Scaffold(
//         backgroundColor: context.appColors.background,
//         body: Center(
//           child: Column(
//             mainAxisSize: MainAxisSize.min,
//             children: [
//               const CircularProgressIndicator(color: AppColors.primaryColor),
//               const Gap(16),
//               Text(
//                 'Preparing your payment...',
//                 style: TextStyle(
//                   color: context.appColors.subtitle,
//                   fontSize: 14.sp,
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }


import 'package:bokiaa/core/ntework/paymob_service.dart';
import 'package:bokiaa/core/theme/app-colors.dart';
import 'package:bokiaa/core/theme/app_theme.dart';
import 'package:bokiaa/core/widgets/routes/app-routes.dart';
import 'package:bokiaa/feature/auth/cubit/auth-cubit.dart';
import 'package:bokiaa/feature/auth/ui/bottom-nav-bar-screen.dart';
import 'package:bokiaa/feature/auth/ui/create-password-screen.dart';
import 'package:bokiaa/feature/auth/ui/forget-password-screen.dart';
import 'package:bokiaa/feature/auth/ui/login-screen.dart';
import 'package:bokiaa/feature/auth/ui/password-change-screen.dart';
import 'package:bokiaa/feature/auth/ui/register-screen.dart';
import 'package:bokiaa/feature/auth/ui/widgets/otp_verfication_screen.dart';
import 'package:bokiaa/feature/cart/data/repo/model/place_order_args.dart';
import 'package:bokiaa/feature/cart/ui/congrates_screen.dart';
import 'package:bokiaa/feature/cart/ui/place_order_screen.dart';
import 'package:bokiaa/feature/home/data/models/book_details_arg.dart';
import 'package:bokiaa/feature/home/ui/book_details/book_deatials_screen.dart';
import 'package:bokiaa/feature/on_boarding_screen.dart';
import 'package:bokiaa/feature/orders/ui/myorders-screen.dart';
import 'package:bokiaa/feature/payment/cupit/payment_cupit.dart';
import 'package:bokiaa/feature/payment/ui/paymop_webview_screen.dart';
import 'package:bokiaa/feature/profile/ui/new_password.dart';
import 'package:bokiaa/feature/profile/ui/update_profile.dart';
import 'package:bokiaa/feature/search/cupit/search-cupit.dart';
import 'package:bokiaa/feature/search/data/model/search_args.dart';
import 'package:bokiaa/feature/search/ui/search-screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';


class AppRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.onboarding:
        return MaterialPageRoute(builder: (_) => const OnBoardingScreen());

      case AppRoutes.login:
        final cubit = Authcubit();
        return MaterialPageRoute(
          builder: (_) =>
              BlocProvider.value(value: cubit, child: const LoginScreen()),
        );

      case AppRoutes.register:
        final cubit = Authcubit();
        return MaterialPageRoute(
          builder: (_) =>
              BlocProvider.value(value: cubit, child: const RegisterScreen()),
        );
      case AppRoutes.forgotPasswordScreen:
        return MaterialPageRoute(builder: (_) => ForgotPasswordScreen());
      case AppRoutes.otpVerfication:
        return MaterialPageRoute(builder: (_) => OtpVerificationScreen());
      case AppRoutes.createNewPasswordScreen:
        return MaterialPageRoute(builder: (_) => CreateNewPasswordScreen());
      case AppRoutes.passwordChangedSuccess:
        return MaterialPageRoute(builder: (_) => PasswordChangedScreen());
      case AppRoutes.congrates:
        return MaterialPageRoute(builder: (_) => CongratesScreen());
      case AppRoutes.paymentWebView:
        final url = settings.arguments as String;
        return MaterialPageRoute(
          builder: (_) => PaymobWebViewScreen(paymentUrl: url),
        );
      case AppRoutes.payment:
        final args = settings.arguments as PlaceOrderArgs;
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (_) => PaymentCubit(PaymobService()),
            child: _PaymentLoader(args: args),
          ),
        );
      case AppRoutes.showMyorders:
        return MaterialPageRoute(builder: (_) => MyOrdersScreen());
      case AppRoutes.editProfile:
        return MaterialPageRoute(builder: (_) => EditProfileScreen());
      case AppRoutes.editPassword:
        return MaterialPageRoute(builder: (_) => UpdateNewPasswordScreen());
      case AppRoutes.placeOrder:
        final total = settings.arguments as String;
        return MaterialPageRoute(
          builder: (_) => PlaceOrderScreen(total: total),
        );
      case AppRoutes.searchScreen:
        final args = settings.arguments as SearchArgs;
        return MaterialPageRoute(
          builder: (_) => MultiBlocProvider(
            providers: [
              BlocProvider(create: (_) => SearchCubit()),
              BlocProvider.value(value: args.cartCubit),
              BlocProvider.value(value: args.wishlistCubit),
            ],
            child: const SearchScreen(),
          ),
        );

      case AppRoutes.bottomNavBarScreen:
        return MaterialPageRoute(builder: (_) => const BottomNavBarScreen());

      case AppRoutes.booksDetails:
        final args = settings.arguments as BookDetailsArgs;
        return MaterialPageRoute(
          builder: (_) => MultiBlocProvider(
            providers: [
              BlocProvider.value(value: args.cartCubit),
              BlocProvider.value(value: args.wishlistCubit),
            ],
            child: BookDetailsScreen(book: args.book),
          ),
        );

      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(child: Text('No route defined for ${settings.name}')),
          ),
        );
    }
  }
}

class _PaymentLoader extends StatefulWidget {
  const _PaymentLoader({required this.args});

  final PlaceOrderArgs args;

  @override
  State<_PaymentLoader> createState() => _PaymentLoaderState();
}

class _PaymentLoaderState extends State<_PaymentLoader> {
  @override
  void initState() {
    super.initState();
    context.read<PaymentCubit>().initiatePayment(
      amount: double.parse(widget.args.total),
      firstName: widget.args.name,
      email: widget.args.email,
      phone: widget.args.phone,
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<PaymentCubit, PaymentState>(
      listener: (context, state) {
        if (state is PaymentUrlReady) {
          Navigator.pushReplacementNamed(
            context,
            AppRoutes.paymentWebView,
            arguments: state.url,
          );
        } else if (state is PaymentError) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.message), backgroundColor: Colors.red),
          );
          Navigator.pop(context);
        }
      },
      child: Scaffold(
        backgroundColor: context.appColors.background,
        body: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const CircularProgressIndicator(color: AppColors.primaryColor),
              const Gap(16),
              Text(
                'Preparing your payment...',
                style: TextStyle(
                  color: context.appColors.subtitle,
                  fontSize: 14.sp,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
