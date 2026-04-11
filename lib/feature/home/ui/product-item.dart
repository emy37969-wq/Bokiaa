
import 'package:bokiaa/core/theme/app-colors.dart';
import 'package:bokiaa/core/widgets/custom-network.dart';
import 'package:bokiaa/feature/home/cupit/home-cupit.dart';
import 'package:bokiaa/feature/home/cupit/home-state.dart';
import 'package:bokiaa/feature/home/data/models/best-seller-response.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Productitem extends StatelessWidget {
  final product? productt;
  final Color? backgroundcolor;
  const Productitem({super.key, required this.productt, this.backgroundcolor});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
            color: backgroundcolor ?? Appcolors.productbackground,
            borderRadius: BorderRadius.circular(12.r)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12.r),
              child: Customnetwork(imageurl: productt?.image ?? ""),
            ),
            SizedBox(
              height: 10.h,
            ),
            Text(
              productt?.name ?? "",
              style: TextStyle(fontSize: 16.sp),
              maxLines: 1,
              overflow: TextOverflow.clip,
            ),
            SizedBox(
              height: 10.h,
            ),
            Row(
              children: [
                Expanded(
                    child: Text(productt?.price ?? "",
                        style: TextStyle(fontSize: 16.sp))),
                BlocListener<HomeCubit, Homestate>(
                  listener: (context, State) {
                    if (State is AddtocartLoadingState) {
                      showDialog(
                          context: context,
                          builder: (context) => CircularProgressIndicator());
                    } else {
                      if (State is AddtocartSuccessState) {
                        Navigator.pop(context);
                        ScaffoldMessenger.of(context)
                            .showSnackBar(SnackBar(content: Text("Added to cart")));
                      }
                    }
                  },
                  child: InkWell(
                    onTap: () {
                      context.read<HomeCubit>().addtocart(productt?.id ?? 0);
                    },
                    child: Container(
                        height: 40.h,
                        width: 60.w,
                        color: Colors.black,
                        child: Center(
                          child: Text(
                            "Buy",
                            style:
                                TextStyle(fontSize: 18.sp, color: Colors.white),
                          ),
                        )),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
