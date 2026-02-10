import 'package:flutter/material.dart';

class PersonalAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  const PersonalAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      elevation: 0,
      backgroundColor: const Color(0xfffff3df),
      centerTitle: true,
      title: const Text(
        'Mizan',
        style: TextStyle(
          fontSize: 40,
          fontWeight: FontWeight.bold,
          fontFamily: 'ReemKufi',
          color: Colors.black,
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
