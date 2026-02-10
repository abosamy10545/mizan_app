import 'package:flutter/material.dart';

class ConverterHeader extends StatelessWidget {
  const ConverterHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          height: 140,
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              const CircleAvatar(
                radius: 35,
                backgroundImage: AssetImage('assets/images/logo.png'),
              ),
              Positioned(
                left: 78,
                top: 40,
                child: Container(
                  width: 270,
                  height: 100,
                  padding: const EdgeInsets.all(8),
                  decoration: const BoxDecoration(
                    color: Color(0xffb7c498),
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(20),
                      bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20),
                    ),
                  ),
                  child: const Text(
                    'In this room you can exchange currencies to their dollar value',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Lemonada',
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
