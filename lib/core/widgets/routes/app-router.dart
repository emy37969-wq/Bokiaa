// import 'package:bokiaa/core/widgets/routes/routes.dart';
// import 'package:booksotre/core/routes/routes.dart';
// import 'package:booksotre/features/auth/cubit/auth_cubit.dart';
// import 'package:booksotre/features/auth/ui/login_screen.dart';
// import 'package:booksotre/features/auth/ui/register_screen.dart';
// import 'package:booksotre/features/bottom_nav_bar/ui/bottom_nav_bar_screen.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// class AppRouter {
//   Route? onGenerateRoute(RouteSettings settings) {
//     switch (settings.name) {
//       case Routes.loginScreen:
//         return MaterialPageRoute(
//           builder: (_) => BlocProvider(
//             create: (context) => AuthCubit(),
//             child: LoginScreen(),
//           ),
//         );
//       case Routes.registerScreen:
//         return MaterialPageRoute(builder: (_) => RegisterScreen());
//       case Routes.bottomNavBarScreen:
//         return MaterialPageRoute(builder: (_) => BottomNavBarScreen());

//       default:
//         return null;
//     }
//   }
// }
// import 'package:bokiaa/core/widgets/routes/routes.dart';
// import 'package:bokiaa/feature/auth/cubit/auth-cubit.dart';
// import 'package:bokiaa/feature/buttom-nav-bar/bottom-nav-bar-screen.dart';
// import 'package:bokiaa/feature/ui/login-screen.dart';
// import 'package:bokiaa/feature/ui/register-screen.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// class AppRouter {
//   Route? onGenerateRoute(RouteSettings settings) {
//     switch (settings.name) {
//       case Routes.loginScreen:
//         return MaterialPageRoute(
//           builder: (_) => BlocProvider(
//             create: (context) => Authcubit(),
//             child:LoginScreen(),
//           ),
//         );
//       case Routes.registerScreen:
//         return MaterialPageRoute(builder: (_) => RegisterScreen());
//       case Routes.bottomNavBarScreen:
//         return MaterialPageRoute(builder: (_) => BottomNavBarScreen());

//       default:
//         return null;
//     }
//   }
// }
import 'package:bokiaa/core/widgets/routes/routes.dart';
import 'package:bokiaa/feature/auth/cubit/auth-cubit.dart';
import 'package:bokiaa/feature/buttom-nav-bar/bottom-nav-bar-screen.dart';
import 'package:bokiaa/feature/ui/login-screen.dart';
import 'package:bokiaa/feature/ui/register-screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppRouter {
  Route? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.loginScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => Authcubit(),
            child: LoginScreen(),
          ),
        );
      case Routes.registerScreen:
        return MaterialPageRoute(builder: (_) => RegisterScreen());
      case Routes.bottomNavBarScreen:
        return MaterialPageRoute(builder: (_) => BottomNavBarScreen());
      default:
        return null;
    }
  }
}