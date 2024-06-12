import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: NavigationBar(
        destinations: const [
          NavigationDestination(icon: Icon(Iconsax.home), label: "Trang chủ"),
          NavigationDestination(icon: Icon(Iconsax.home), label: "Short"),
          NavigationDestination(icon: Icon(Iconsax.add), label: ""),
          NavigationDestination(
              icon: Icon(Iconsax.video), label: "Kênh đăng ký"),
          NavigationDestination(icon: Icon(Iconsax.user), label: "Profile"),
        ],
      ),
      body: const Center(),
    );
  }
}
