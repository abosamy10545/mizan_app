import 'package:flutter/material.dart';
import 'package:mizan_app/models/user_model.dart';

class HomeHeader extends StatelessWidget {
  final UserModel user;

  const HomeHeader({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
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
              child: Text(
                'Welcome to Mizan\n${user.name}',
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Lemonada',
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
