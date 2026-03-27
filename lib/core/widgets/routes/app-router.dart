import 'package:bokiaa/core/widgets/routes/routes.dart';
import 'package:bokiaa/feature/auth/cubit/auth-cubit.dart';
import 'package:bokiaa/feature/auth/ui/bottom-nav-bar-screen.dart';
import 'package:bokiaa/feature/auth/ui/login-screen.dart';
import 'package:bokiaa/feature/auth/ui/register-screen.dart';
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
        return MaterialPageRoute(builder: (_) => BlocProvider(create: (context) => Authcubit(),
          child: RegisterScreen()));
      case Routes.bottomNavBarScreen:
        return MaterialPageRoute(builder: (_) => BottomNavBarScreen());

      default:
        return null;
    }
  }
}


// import 'package:bokiaa/core/widgets/routes/routes.dart';
// import 'package:bokiaa/feature/auth/cubit/auth-cubit.dart';
// import 'package:bokiaa/feature/auth/ui/bottom-nav-bar-screen.dart';
// import 'package:bokiaa/feature/auth/ui/login-screen.dart';
// import 'package:bokiaa/feature/auth/ui/register-screen.dart';
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






// import 'package:bokiaa/core/widgets/routes/routes.dart';
// import 'package:bokiaa/feature/auth/cubit/auth-cubit.dart';
// import 'package:bokiaa/feature/auth/ui/bottom-nav-bar-screen.dart';
// import 'package:bokiaa/feature/auth/ui/home-screen.dart';
// import 'package:bokiaa/feature/auth/ui/login-screen.dart';
// import 'package:bokiaa/feature/auth/ui/register-screen.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// class AppRouter {
//   Route? onGenerateRoute(RouteSettings settings) {
//     switch (settings.name) {
//       case Routes.loginScreen:
//         return MaterialPageRoute(
//           builder: (_) =>LoginScreen()
//           BlocProvider(
//             create: (context) => Authcubit(),
//             child: LoginScreen()));
          
        
        
//       case Routes.registerScreen:
//         return MaterialPageRoute(builder: (_) =>RegisterScreen());
//          BlocProvider(create: (context) => Authcubit(),
//           child: RegisterScreen());
//       case Routes.bottomNavBarScreen:
//         return MaterialPageRoute(builder: (_) => BottomNavBarScreen());
//         case Routes.homescreen:
//         return MaterialPageRoute(builder: (_) => Homescreen());
//       default:
//         return null;
//     }
//   }
// }