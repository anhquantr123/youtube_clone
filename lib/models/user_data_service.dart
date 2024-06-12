import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UserDataService {
  FirebaseAuth firebaseAuth;
  FirebaseFirestore firebaseFirestore;

  // create constructor

  UserDataService(
      {required this.firebaseAuth, required this.firebaseFirestore});

  addUser() async {}
}
