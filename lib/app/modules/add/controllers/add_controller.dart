import 'package:get/get.dart';
import 'package:tally/app/data/services/firebase_service.dart';
import 'package:tally/app/widgets/snackbar.dart';

class AddController extends GetxController {
 RxString selectedValue='customer'.obs;
 RxString name=RxString('');
 RxString phone=RxString('');
 RxBool isLoading=RxBool(false);

 final _fireStore=FirebaseService.to.firestore;
 final currentUser=FirebaseService.to.auth.currentUser;

 Future addCustomerOrSupplier() async{
   isLoading.value=true;
   try{
     await _fireStore.collection('customer').doc(phone.value).set({
       'name': name.value,
       'phone': phone.value,
       'user_type': selectedValue.value,
       'created_by_phone': currentUser!.phoneNumber,
       'created_at': DateTime.now().toIso8601String(),
       'updated_at': DateTime.now().toIso8601String(),
     });
     snackbar('${selectedValue.value =='customer' ? 'কাস্টমার' : 'সাপ্লায়ার'} সফলভাবে যুক্ত হয়েছে');
     Get.back();
     isLoading.value=false;

   }catch(e){
     isLoading.value=false;
     snackbar(e.toString());
   }
 }


}
