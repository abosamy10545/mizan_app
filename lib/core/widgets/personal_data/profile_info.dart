import 'package:flutter/material.dart';
import 'package:mizan_app/models/user_model.dart';

class ProfileInfo extends StatelessWidget {
  final UserModel user;
  const ProfileInfo({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          user.name,
          style: const TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.w600,
            fontFamily: 'Lemonada',
          ),
        ),
        const SizedBox(height: 10),
        Text(
          user.email,
          style: const TextStyle(
            fontSize: 17,
            fontWeight: FontWeight.w500,
            fontFamily: 'Lemonada',
          ),
        ),
        const SizedBox(height: 15),
        Container(
          width: 140,
          height: 60,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            color: const Color(0xff708872),
          ),
          child: Center(
            child: Text(
              user.country,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
                fontFamily: 'Lemonada',
              ),
            ),
          ),
        ),
      ],
    );
  }
}
