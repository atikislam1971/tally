import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:tally/app/routes/app_pages.dart';
import 'package:tally/app/widgets/snackbar.dart';

class ProfileSetupController extends GetxController {
  RxString businessName = RxString('');
  RxBool isSettingUp = RxBool(false);

  final user = FirebaseAuth.instance.currentUser;
  final firestore = FirebaseFirestore.instance;


  Future finishSetup() async {

    print("click this button");

    if (user == null) {
      snackbar('কোন ব্যবহারকারী পাওয়া যায়নি');
      return;
    }

    isSettingUp.value = true;

    final profileData = {
      'business_name' : businessName.value,
      'phone_number' : user!.phoneNumber,
    };

    await firestore.collection('users').doc(user!.phoneNumber).set(profileData);

    isSettingUp.value = false;
    snackbar('প্রোফাইল সফলভাবে সংরক্ষণ করা হয়েছে!');

    Get.offAllNamed(Routes.WELCOME);

  }

}
