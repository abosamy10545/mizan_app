import 'package:flutter/material.dart';

class EditButton extends StatelessWidget {
  final VoidCallback onTap;
  const EditButton({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 100,
        height: 50,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              blurRadius: 10,
              spreadRadius: 2,
              offset: const Offset(0, 5),
            ),
          ],
          borderRadius: BorderRadius.circular(30),
          color: const Color(0xfffbf2e2),
        ),
        child: const Center(
          child: Text(
            'Edit',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w600,
              fontFamily: 'Lemonada',
            ),
          ),
        ),
      ),
    );
  }
}
