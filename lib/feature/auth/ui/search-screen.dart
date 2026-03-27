import 'package:bokiaa/core/widgets/custom-back-button.dart';
import 'package:bokiaa/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Searchscreen extends StatelessWidget {
  const Searchscreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        Custombackbutton(),
        Container(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(children: [
              Icon(Icons.search),
              SizedBox(width: 5.w,),
              Text(LocaleKeys.search.tr(),style: TextStyle(fontSize: 15.sp,color: Color(0xff7C7C7C)),)
            ],),
          ),
                width: 330,
                height: 50,
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 235, 232, 232),
                  borderRadius: BorderRadius.circular(20),
                  
                ),
              ),
    ]));

    
  
    
  }
}