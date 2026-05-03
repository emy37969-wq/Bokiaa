import 'package:bokiaa/core/helper/validators.dart';
import 'package:bokiaa/core/widgets/app-button.dart';
import 'package:bokiaa/core/widgets/custom-text-form-faild.dart';
import 'package:bokiaa/feature/profile/ui/widgets/profile_image_widget.dart';
import 'package:flutter/material.dart';

import '../../../core/theme/app_theme.dart';

class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.appColors.background,
      appBar: AppBar(
        backgroundColor: context.appColors.background,
        elevation: 0,
        leading: const BackButton(),
        title: const Text(
          "Edit Profile",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 22.0),
        child: Column(
          children: [
            const SizedBox(height: 30),
            const ProfileImageWidget(),
            const SizedBox(height: 40),

            // Form Fields
            CustomTextField(
              hintText: "Full Name",
              controller: TextEditingController(),
               autofillHints: [AutofillHints.name], validator: (value) { return AppValidators.name(value); }, // Assuming you have a name validator in AppValidators
            ),
            const SizedBox(height: 20),
            CustomTextField(
              hintText: "phone",
              keyboardType: TextInputType.phone,
              controller: TextEditingController(),
              autofillHints: [AutofillHints.telephoneNumber],
              validator: (value) { return AppValidators.phone(value); },
            ),
            const SizedBox(height: 20),
            CustomTextField(
              hintText: "Email",
              keyboardType: TextInputType.emailAddress,
              controller: TextEditingController(),
              autofillHints: [AutofillHints.email],
              validator: (value) { return AppValidators.email(value); },
            ),
            Spacer(),
            AppButton(text: 'Update Profile', onPressed: () {}, isFilled: true),
            const SizedBox(height: 60),
          ],
        ),
      ),
    );
  }
}