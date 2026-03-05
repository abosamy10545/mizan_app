import 'package:flutter/material.dart';

AppBar buildAppBar() {
  return AppBar(
    automaticallyImplyLeading: false,
    elevation: 0,
    backgroundColor: const Color(0xfffff3df),
    title: const Text(
      'Mizan',
      style: TextStyle(
        fontSize: 28,
        fontWeight: FontWeight.bold,
        fontFamily: 'ReemKufi',
        color: Colors.black,
      ),
    ),
  );
}