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
                }, controller: TextEditingController(), autofillHints: [], validator: (value) {  },
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





