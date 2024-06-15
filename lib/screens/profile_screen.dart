import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:project_1/screens/screen.dart';
import 'package:project_1/widgets/app_bar_profile.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final db = FirebaseFirestore.instance;

  void settingProfile() async {
    final user = FirebaseAuth.instance.currentUser;

    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => SettingProfileUser(
                  email: user!.email!,
                  name: user.displayName!,
                  profilePic: user.photoURL!,
                )));
  }

  void getUsername() async {
    final docRef = await db.collection('users').doc().get();

    final user = docRef.data();
    log(user as num);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBarProfile(onTap: settingProfile),
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
          child: Column(
            children: [
              Row(
                children: [
                  Container(
                    height: 50,
                    width: 50,
                    child: ClipRect(
                      child: Image.asset("assets/images/google_logo.png"),
                    ),
                  )
                ],
              )
            ],
          ),
        ));
  }
}
