import 'package:flutter/material.dart';

class ProfileAvatar extends StatelessWidget {
  const ProfileAvatar({super.key});

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 90,
      backgroundColor: const Color(0xffb7c498),
      child: const CircleAvatar(
        radius: 75,
        backgroundImage: AssetImage('assets/images/slogan.gif'),
      ),
    );
  }
}
