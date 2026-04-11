import 'package:bokiaa/core/widgets/routes/app-router.dart';
import 'package:bokiaa/core/widgets/routes/routes.dart';
import 'package:bokiaa/feature/search/ui/search-screen.dart';
import 'package:bokiaa/feature/welcome/ui/widgets/welcome-screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Homeappbar extends StatelessWidget {
  const Homeappbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(children: [
          SafeArea(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Image.asset("assets/images/bookk.png"),
                SizedBox(
                  width: 5.w,
                ),
                InkWell(
                    onTap: () {
                      Navigator.pushReplacement(context,
                          MaterialPageRoute(builder: (_) => WelcomeScreen()));
                    },
                    child: Text(
                      "Bookia",
                      style: TextStyle(fontSize: 20.sp),
                    )),
                SizedBox(
                  width: 230.w,
                ),
                InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, Routes.searchscreen);
                      // push(context,
                      //     MaterialPageRoute(builder: (_) => Searchscreen()));
                    },
                    child: Image.asset("assets/images/search-normal.png"))
              ],
            ),
          ),
          // mainAxisAlignment: MainAxisAlignment.center,
          // children: [Text("home")],
        ]));
  }
}
