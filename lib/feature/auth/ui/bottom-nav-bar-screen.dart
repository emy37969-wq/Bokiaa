import 'package:bokiaa/core/widgets/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class BottomNavBarScreen extends StatelessWidget {
  const BottomNavBarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          IconButton(onPressed: ()async{
            SharedPreferences pref=await  SharedPreferences.getInstance();
            await pref.remove("token");
            // ignore: use_build_context_synchronously
            Navigator.pushNamedAndRemoveUntil((context), Routes.loginScreen,(e)=>false );
          }, icon: Icon(Icons.login))
        ],
      ),
    );
  }
}