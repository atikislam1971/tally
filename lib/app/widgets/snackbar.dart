import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:tally/app/core/theme/color.dart';


ScaffoldFeatureController<SnackBar, SnackBarClosedReason> snackbar(String message)
=> ScaffoldMessenger.of(Get.context!).showSnackBar(
    SnackBar(
      backgroundColor: AppColors.BLACK,
        duration: Duration(milliseconds: 1500),
        behavior: SnackBarBehavior.floating,
        content: Text(message)
    )
);