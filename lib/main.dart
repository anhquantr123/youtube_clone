import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:iconsax/iconsax.dart';
import 'package:project_1/firebase_options.dart';
import 'package:project_1/screens/screen.dart';

void main() async {
  //WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List pages = const [
    HomeScreen(),
    ShortScreen(),
    VideoUpLoadingScreen(),
    SubScreen(),
    ProfileScreen(),
  ];

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
            if (!snapshot.hasData) {
              const LoginScreen();
            }
            // neu co du lieu tra ve
            return Scaffold(
              bottomNavigationBar: BottomNavigationBar(
                selectedItemColor: Colors.black,
                unselectedItemColor: Colors.black45,
                items: const [
                  BottomNavigationBarItem(icon: Icon(Iconsax.home)),
                  BottomNavigationBarItem(icon: Icon(Iconsax.video)),
                  BottomNavigationBarItem(icon: Icon(Iconsax.add)),
                  BottomNavigationBarItem(icon: Icon(Iconsax.video2)),
                  BottomNavigationBarItem(icon: Icon(Iconsax.profile))
                ],
              ),
              body: pages[0],
            );
          },
        ));
  }
}
