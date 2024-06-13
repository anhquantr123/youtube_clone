import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:project_1/models/auth_service.dart';

class LoginScreen extends ConsumerWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
          child: Center(
        child: Column(
          children: [
            Image.asset("assets/images/youtube_logo.png"),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
              child: GestureDetector(
                onTap: () async {
                  await ref.read(authServiceProvider).signInWithGoogle();
                },
                child: Container(
                    decoration: BoxDecoration(
                        color: Colors.white60,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Colors.black38)),
                    child: Padding(
                      padding: const EdgeInsets.all(6.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            "assets/images/google_logo.png",
                            height: 40,
                          ),
                          const Text(
                            "Tiếp tục với Google ",
                            style: TextStyle(fontSize: 18),
                          )
                        ],
                      ),
                    )),
              ),
            )
          ],
        ),
      )),
    );
  }
}
