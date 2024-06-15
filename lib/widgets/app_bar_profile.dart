import 'package:flutter/material.dart';

import 'package:iconsax/iconsax.dart';

class AppBarProfile extends StatelessWidget implements PreferredSizeWidget {
  final VoidCallback onTap;
  const AppBarProfile({
    required this.onTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: AppBar(
        actions: [
          GestureDetector(
            onTap: onTap,
            child: const Icon(
              Iconsax.setting,
            ),
          )
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(30);
}
