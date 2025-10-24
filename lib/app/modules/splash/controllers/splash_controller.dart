import 'dart:async';

import 'package:get/get.dart';
import 'package:tally/app/routes/app_pages.dart';

class SplashController extends GetxController {
  //TODO: Implement SplashController

  final count = 0.obs;
  @override
  void onInit() {
    Timer(Duration(seconds: 3),(){
      Get.offAllNamed(Routes.AUTH);
    });
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;
}
