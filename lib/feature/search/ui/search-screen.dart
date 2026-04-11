import 'package:bokiaa/core/widgets/custom-back-button.dart';
import 'package:bokiaa/core/widgets/custom-text-form-faild.dart';
import 'package:bokiaa/feature/home/ui/product-item.dart';
import 'package:bokiaa/feature/search/cupit/search-cupit.dart';
import 'package:bokiaa/feature/search/cupit/search-state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skeletonizer/skeletonizer.dart';

class Searchscreen extends StatefulWidget {
  const Searchscreen({super.key});

  @override
  State<Searchscreen> createState() => _SearchscreenState();
}

class _SearchscreenState extends State<Searchscreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            children: [
              Custombackbutton(),
              CustomTextFormField(
                hintText: "Search Store",
                onChanged: (v) {
                  context.read<Searchcupit>().search(v);
                },
              ),
              SizedBox(height: 20.h,),
                      BlocBuilder<Searchcupit, Searchstate>(
          builder: (context, state) {
            if (state is searchLoadingState) {
              return Skeletonizer(enabled: true,
          child: Container(
            height: 150.h, width: double.infinity,color: Colors.grey,
          ),
        );

            } else if (state is searchSuccessState) {
              return Expanded(
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 11.w,
                      mainAxisSpacing: 11.h,
                      childAspectRatio: .5),
                  itemCount: state.products?.length,
                  itemBuilder: (context, index) {
                    return Productitem(
                      productt: state.products?[index],
                    );
                  },
                ),
              );
            } else {
              return Text("error");
            }
          },
        ),

            ],
          ),
        ),
      ),
    );
  }
}





// import 'package:bokiaa/core/widgets/custom-back-button.dart';
// import 'package:bokiaa/generated/locale_keys.g.dart';
// import 'package:easy_localization/easy_localization.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';

// class Searchscreen extends StatelessWidget {
//   const Searchscreen({super.key});
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Column(children: [
//         Custombackbutton(),
//         Container(
//           child: Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: Row(children: [
//               Icon(Icons.search),
//               SizedBox(width: 5.w,),
//               Text(LocaleKeys.search.tr(),style: TextStyle(fontSize: 15.sp,color: Color(0xff7C7C7C)),)
//             ],),
//           ),
//                 width: 330,
//                 height: 50,
//                 decoration: BoxDecoration(
//                   color: const Color.fromARGB(255, 235, 232, 232),
//                   borderRadius: BorderRadius.circular(20),
                  
//                 ),
//               ),
//     ]));

    
  
    
//   }
// }