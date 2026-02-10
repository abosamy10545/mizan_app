import 'package:flutter/material.dart';

class LoginTitle extends StatelessWidget {
  const LoginTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return const Text(
      'Mizan',
      style: TextStyle(
        fontSize: 35,
        fontWeight: FontWeight.bold,
        fontFamily: 'ReemKufi',
      ),
    );
  }
}
