import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:tally/app/widgets/custom_button.dart';
import 'package:tally/app/widgets/custom_text_field.dart';

import '../controllers/profile_setup_controller.dart';

class ProfileSetupView extends GetView<ProfileSetupController> {
  const ProfileSetupView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'ব্যাবসা প্রতিষ্ঠানের নাম দিন',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 15.5,
                      color: Colors.black.withOpacity(.7),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  CustomTextField(
                    labelText: 'ব্যবসা প্রতিষ্ঠানের নাম',
                    hintText: 'আপনার ব্যাবসা প্রতিষ্ঠানের নাম দিন',
                    leadingIcon: Icons.business_outlined,
                    onChanged: (value) => controller.businessName.value = value,
                  ),
                ],
              ),
              Obx(
                    () => CustomButton(
                  label: 'নিশ্চিত',
                  buttonType: controller.businessName.isEmpty
                      ? ButtonType.DISABLED
                      : ButtonType.ENABLED,
                  onTap: controller.finishSetup,
                  isLoading: controller.isSettingUp.value,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
