import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:iconsax/iconsax.dart';
import 'package:project_1/firebase_options.dart';
import 'package:project_1/screens/screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int currentIndex = 0;
  List pages = const [
    HomeScreen(),
    ShortScreen(),
    VideoUpLoadingScreen(),
    SubScreen(),
    ProfileScreen(),
  ];

  void onTap(int index) {
    setState(() {
      currentIndex = index;
    });
  }

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
                onTap: onTap,
                unselectedFontSize: 0,
                selectedFontSize: 0,
                type: BottomNavigationBarType.fixed,
                currentIndex: currentIndex,
                selectedItemColor: Colors.black,
                unselectedItemColor: Colors.black45,
                showSelectedLabels: false,
                showUnselectedLabels: false,
                elevation: 10,
                items: const [
                  BottomNavigationBarItem(
                    icon: Icon(Iconsax.home),
                    label: "Home",
                  ),
                  BottomNavigationBarItem(
                      icon: Icon(Iconsax.video), label: "Short"),
                  BottomNavigationBarItem(
                      icon: Icon(Iconsax.add), label: "Upload"),
                  BottomNavigationBarItem(
                      icon: Icon(Iconsax.subtitle), label: "Kenh"),
                  BottomNavigationBarItem(
                      icon: Icon(Iconsax.user), label: "Profile")
                ],
              ),
              body: pages[currentIndex],
            );
          },
        ));
  }
}
