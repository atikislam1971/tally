import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:tally/exports.dart';
import 'package:tally/firebase_options.dart';

class FirebaseService extends GetxService{
  static FirebaseService get to => Get.find<FirebaseService>();

  late FirebaseApp _app;
  late FirebaseAuth _auth;
  late FirebaseFirestore _firestore;

  FirebaseAuth get auth => _auth;
  FirebaseFirestore get firestore => _firestore;

  Future<FirebaseService> init()async{
    _app=await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
    _auth=FirebaseAuth.instance;
    _firestore=FirebaseFirestore.instance;
    return this;
  }
}