import 'dart:async';

import 'package:get/get.dart';
import 'package:tally/app/routes/app_pages.dart';

class WelcomeController extends GetxController {
  //TODO: Implement WelcomeController

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    Timer(
      const Duration(seconds: 3),
          () {
        Get.offAllNamed(Routes.HOME);
      },
    );
  }
}
