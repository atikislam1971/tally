import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/profile_setup_controller.dart';

class ProfileSetupView extends GetView<ProfileSetupController> {
  const ProfileSetupView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ProfileSetupView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'ProfileSetupView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
