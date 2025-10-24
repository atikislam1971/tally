import 'package:get/get.dart';
import 'package:tally/app/modules/auth/auth/controllers/auth_controller.dart';


class OtpBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(AuthController());
}
}
