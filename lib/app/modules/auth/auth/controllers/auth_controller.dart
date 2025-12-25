import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:tally/app/data/services/firebase_service.dart';
import 'package:tally/app/widgets/snackbar.dart';

import '../../../../../exports.dart';

class AuthController extends GetxController {
  //TODO: Implement AuthController
  RxString number = RxString('');
  RxString numberWithCountryCode = RxString('');
  final numberController = TextEditingController();

  RxString otp = RxString('');
  RxBool isOtpVerifying=RxBool(false);

  RxBool isOtpSending = RxBool(false);

  RxBool isTimerActive = RxBool(false);
  RxInt second=15.obs;

  RxString verificationID=RxString('');

  FirebaseAuth auth=FirebaseService.to.auth;


  FirebaseFirestore fireStore=FirebaseService.to.firestore;

  final List<TextEditingController> otpController=List.generate(6, (_) => TextEditingController());



  Future logiinOrRegister() async{
    isOtpSending.value=true;
    try{
      await auth.verifyPhoneNumber(
        phoneNumber: numberWithCountryCode.value,
        verificationCompleted: (credential) async{
          await _signInWithInfo(credential);
        },
        verificationFailed: (FirebaseAuthException error){
          isOtpSending.value=false;
          snackbar(error.message!);
          print(error.message);
          if(error.code=='invalid-phone-number'){
            snackbar('মোবাইল নম্বর সঠিক নয়!');
          }
      },
        codeSent: (String id, int? resendToken){
          isOtpSending.value=false;
          verificationID.value=id;
          snackbar('আপনার মোবাইলের ভেরিফিকেশন কোড পাঠানো হয়েছে');
          Get.toNamed(Routes.OTP);
          startTimer();
        },
        codeAutoRetrievalTimeout: (String verificationID){
          isOtpSending.value=false;
          print('code auth retrieval timeout');
      }
      );

    }catch(e){
      isOtpSending.value=false;
      print(e.toString());

    }
  }

  void onOtpChanged(String value, int index, BuildContext context){
    if(value.length== 1 && index<5){
      FocusScope.of(context).nextFocus();
    }
    if(value.isEmpty && index>0){
      FocusScope.of(context).previousFocus();
    }
    otp.value=otpController.map((controller) => controller.text).join();
  }
  Future verifyOTP() async{
    isOtpVerifying.value=true;
    try{
      PhoneAuthCredential credential=PhoneAuthProvider.credential(
          verificationId: verificationID.value,
          smsCode: otp.value
      );

      _signInWithInfo(credential);
      isOtpVerifying.value=false;

    }on FirebaseAuthException catch(e){
      isOtpVerifying.value=false;
      snackbar(e.message!);
    } catch (e){
      isOtpVerifying.value=false;
      snackbar('একটি সমস্যা হয়েছে। ${e.toString()}');
    }
  }

  Future<UserCredential> _signInWithInfo(AuthCredential credential) async {
    isOtpVerifying.value = true;

    UserCredential userData = await auth.signInWithCredential(credential);

    if (userData.user != null) {
      User user = userData.user!;

      isOtpVerifying.value = false;
      snackbar('আপনার ভেরিফিকেশন সফল হয়েছে!');

      DocumentSnapshot userDoc = await fireStore.collection('users').doc(user.phoneNumber).get();

      if (userDoc.exists) {
        Get.offAllNamed(
          Routes.HOME,
        );
      } else {
        Get.offAllNamed(
          Routes.PROFILE_SETUP,
        );
      }

      return userData;
    }

    isOtpVerifying.value = false;
    snackbar('User not found after sign-in.');

    return userData;
  }

  void startTimer(){
    isTimerActive.value=true;
    second.value=15;
    var timer=Timer.periodic(const Duration(seconds: 1),(timer){
      if(second.value>0){
        second.value--;
      }else{
        isTimerActive.value=false;
        timer.cancel();
      }
    }
    );

  }
  void resentOtp(){
    startTimer();
    snackbar('পুনরায় কোড পাঠানো হয়েছে।');
  }

}
