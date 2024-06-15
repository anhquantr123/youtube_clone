import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:project_1/models/users.dart';

final userDataServiceProvider = Provider((ref) => UserDataService(
    firebaseAuth: FirebaseAuth.instance,
    firebaseFirestore: FirebaseFirestore.instance));

class UserDataService {
  FirebaseAuth firebaseAuth;
  FirebaseFirestore firebaseFirestore;

  // create constructor

  UserDataService(
      {required this.firebaseAuth, required this.firebaseFirestore});

  addUser({
    String? userId,
    required String name,
    required String userName,
    required String email,
    required String profilePic,
    String? subscriptions,
    String? videos,
    required String descriptions,
    String? type,
  }) async {
    UserData user = UserData(
        userId: firebaseAuth.currentUser!.uid,
        name: name,
        userName: userName,
        email: email,
        profilePic: profilePic,
        subscriptions: [],
        videos: 0,
        descriptions: descriptions,
        type: "user");

    await firebaseFirestore
        .collection("users")
        .doc(firebaseAuth.currentUser!.uid)
        .set(user.toMap());
  }
}
