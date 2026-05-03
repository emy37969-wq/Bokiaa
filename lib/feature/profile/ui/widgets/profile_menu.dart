import 'package:bokiaa/core/theme/app-colors.dart';
import 'package:bokiaa/core/theme/cupit/theme_cupit.dart';
import 'package:bokiaa/core/theme/cupit/theme_state.dart';
import 'package:bokiaa/core/widgets/routes/app-routes.dart';
import 'package:bokiaa/feature/profile/ui/widgets/profile_menu_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/helper/extenstions.dart';

class ProfileMenu extends StatelessWidget {
  const ProfileMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Colors.grey.shade200),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.04),
              blurRadius: 8,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ProfileMenuItem(
              title: 'My Orders',
              onTap: () {
                context.pushNamed(AppRoutes.showMyorders);
              },
            ),
            ProfileMenuItem(
              title: 'Edit Profile',
              onTap: () {
                context.pushNamed(AppRoutes.editProfile);
              },
            ),
            ProfileMenuItem(
              title: 'Reset Password',
              onTap: () {
                context.pushNamed(AppRoutes.editPassword);
              },
            ),
            ProfileMenuItem(title: 'FAQ', onTap: () {}),
            ProfileMenuItem(title: 'Contact Us', onTap: () {}),
            // Last item — no bottom border
            InkWell(
              onTap: () {},
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 18.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Privacy & Terms',
                      style: TextStyle(
                        fontSize: 15.sp,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    Icon(
                      Icons.arrow_forward_ios_rounded,
                      size: 16.sp,
                      color: Colors.grey.shade400,
                    ),
                  ],
                ),
              ),
            ),
            ListTile(
              title: const Text("Dark Mode"),
              trailing: SizedBox(
                width: 60.w,
                child: BlocBuilder<ThemeCubit, ThemeState>(
                  builder: (context, state) {
                    final isDark = state.themeMode == ThemeMode.dark;

                    return Switch(
                      value: isDark,
                      activeTrackColor: AppColors.primaryColor,
                      onChanged: (value) {
                        context.read<ThemeCubit>().changeTheme(
                              value ? ThemeMode.dark : ThemeMode.light,
                            );
                      },
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
