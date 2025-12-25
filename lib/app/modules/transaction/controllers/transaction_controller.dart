import 'package:get/get.dart';
import 'package:tally/app/data/services/firebase_service.dart';
import 'package:tally/app/widgets/snackbar.dart';

class TransactionController extends GetxController {

  var selectedDate=DateTime.now().obs;
  RxString dilam=RxString('');
  RxString pelam=RxString('');
  RxString biboron=RxString('');
  final _firestore=FirebaseService.to.firestore;
  
  RxBool isLoading =RxBool(false);
  Future submitTrx(String customerID) async{
    isLoading.value =true;
    final customerRef =_firestore.collection('customer').doc(customerID);
    final trxRef=customerRef.collection('transaction');
    
    await trxRef.add({
      'dilam': dilam.value,
      'pelam': pelam.value,
      'biboron': biboron.value,
      'created_at': DateTime.now().toIso8601String(),
      'date_for_date': selectedDate.value.toIso8601String(),
    });
    isLoading.value=false;
    snackbar('ডাটা সফলভাবে সংরক্ষিত হয়েছে!');
    Get.back();


    //ToDo: ডাটা সংরক্ষিত হয়েছে এখন টাস্ক হলো সেই ডাটা ফায়ারবেস থেকে হোম বিউ তে দেখানো
  }


}
