import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
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

  FirebaseAuth auth=FirebaseAuth.instance;


  FirebaseFirestore fireStore=FirebaseFirestore.instance;

  final List<TextEditingController> otpController=List.generate(6, (_) => TextEditingController());



  Future logiinOrRegister() async{
    isOtpSending.value=true;
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
      _signInInfo(credential);
      isOtpVerifying.value=false;

    }on FirebaseAuthException catch(e){
      isOtpVerifying.value=false;
      snackbar(e.message!);
    } catch (e){
      isOtpVerifying.value=false;
      snackbar('একটি সমস্যা হয়েছে। ${e.toString()}');
    }
  }

  Future<UserCredential> _signInInfo(AuthCredential credential)async{
    isOtpSending.value=true;
    UserCredential userData=await auth.signInWithCredential(credential);
    if(userData.user!=null){
      User user=userData.user!;
      isOtpVerifying.value=false;
      snackbar('আপনার ভেরিফিকেশন সফল হয়েছে!');
      DocumentSnapshot userDoc=await fireStore.collection('users').doc(user.phoneNumber).get();
      
      if(userDoc.exists){
        Get.offAllNamed(Routes.HOME);
        
      }else{
        Get.offAllNamed(Routes.PROFILE_SETUP);
      }
      return userData;
    }
    isOtpVerifying.value=false;
    snackbar('user no found after sign-in');
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
