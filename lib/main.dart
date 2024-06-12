import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:project_1/firebase_options.dart';
import 'package:project_1/screens/screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // khoi tao flutter trong du an
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const ProviderScope(child: MyApp())); // khai bao nha  cung cap
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Youtube App',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: StreamBuilder(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            // neu khong co du lieu tra ve
            if (!snapshot.hasData) {
              const LoginScreen();
            }
            // neu co du lieu tra ve
            return Container(
              child: Text(" Ban Da dang nhap "),
            );
          },
        ));
  }
}
