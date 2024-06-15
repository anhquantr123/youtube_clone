import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:iconsax/iconsax.dart';
import 'package:project_1/models/user_data_service.dart';

final formKey = GlobalKey();

class SettingProfileUser extends ConsumerStatefulWidget {
  final String name;
  final String email;
  final String profilePic;
  const SettingProfileUser(
      {required this.name,
      required this.email,
      required this.profilePic,
      super.key});

  @override
  ConsumerState<SettingProfileUser> createState() => _SettingProfileUserState();
}

class _SettingProfileUserState extends ConsumerState<SettingProfileUser> {
  final TextEditingController userNameController = TextEditingController();
  bool isValidate = true;

  void validateUsername() async {
    final userMap = await FirebaseFirestore.instance.collection("users").get();
    final users = userMap.docs.map((user) => user).toList();
    String? targetedUserName;

    for (var user in users) {
      if (userNameController.text == user.data()['username']) {
        targetedUserName = user.data()['username'];

        setState(() {
          isValidate = false;
        });
      }

      if (userNameController.text != targetedUserName) {
        setState(() {
          isValidate = true;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: const Icon(Iconsax.arrow_left)),
          title: Text("Cài đặt"),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text("Enter user name..."),
              TextFormField(
                onChanged: (value) {
                  validateUsername();
                  log(value.toString());
                },
                autovalidateMode: AutovalidateMode.always,
                key: formKey,
                controller: userNameController,
                validator: (value) {
                  if (isValidate) {
                    return "User name used";
                  } else {
                    return null;
                  }
                },
                decoration: InputDecoration(
                    contentPadding:
                        const EdgeInsets.symmetric(vertical: 6, horizontal: 10),
                    suffixIcon: isValidate
                        ? const Icon(Icons.verified_user_rounded)
                        : const Icon(Icons.cancel),
                    suffixIconColor: isValidate ? Colors.green : Colors.red,
                    hintText: "Username ",
                    border: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black))),
              ),
              const Spacer(),
              Align(
                alignment: Alignment.center,
                child: TextButton(
                  onPressed: () async {
// add user to firestore
                    isValidate
                        ? ref.read(userDataServiceProvider).addUser(
                              name: widget.name,
                              userName: userNameController.text,
                              email: widget.email,
                              profilePic: widget.profilePic,
                              descriptions: "",
                            )
                        : null;
                  },
                  child: Text("Tiếp tục"),
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.blue),
                      foregroundColor: MaterialStateProperty.all(Colors.amber)),
                ),
              )
            ],
          ),
        ));
  }
}
