

import 'package:bokiaa/core/widgets/routes/routes.dart';
import 'package:bokiaa/feature/auth/cubit/auth-cubit.dart';
import 'package:bokiaa/feature/auth/ui/bottom-nav-bar-screen.dart';
import 'package:bokiaa/feature/auth/ui/login-screen.dart';
import 'package:bokiaa/feature/auth/ui/register-screen.dart';
import 'package:bokiaa/feature/search/cupit/search-cupit.dart';
import 'package:bokiaa/feature/search/ui/search-screen.dart';
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

        case Routes.searchscreen:
        return MaterialPageRoute(builder: (_) => BlocProvider(create: (context) => Searchcupit(), 
        child: Searchscreen()));


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
// import 'package:bokiaa/feature/home/ui/home-screen.dart';
// import 'package:bokiaa/feature/welcome/ui/widgets/welcome-screen.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// class AppRouter {
//   Route<dynamic>? onGenerateRoute(RouteSettings settings) {
//     switch (settings.name) {

//       case Routes.loginScreen:
//         return MaterialPageRoute(
//           builder: (_) => BlocProvider(
//             create: (_) => Authcubit(),
//             child: const LoginScreen(),
//           ),
//         );

//       case Routes.registerScreen:
//         return MaterialPageRoute(
//           builder: (_) => BlocProvider(
//             create: (_) => Authcubit(),
//             child: const RegisterScreen(),
//           ),
//         );

//       case Routes.bottomNavBarScreen:
//         return MaterialPageRoute(
//           builder: (_) => const BottomNavBarScreen(),
//         );


//          case Routes.welcomeScreen:
//         return MaterialPageRoute(
//           builder: (_) => const WelcomeScreen(),  
//         );


//            case Routes.homescreen:
//         return MaterialPageRoute(
//           builder: (_) => const Homescreen() ,
          
//         );
//       default:
//         return MaterialPageRoute(
//           builder: (_) => const Scaffold(
//             body: Center(
//               child: Text("No Route Found"),
//             ),
//           ),
//         );
//     }
//   }
// }
