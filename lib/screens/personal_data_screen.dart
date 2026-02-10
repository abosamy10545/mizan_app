import 'package:flutter/material.dart';
import 'package:mizan_app/core/widgets/personal_data/personal_app_bar.dart';
import 'package:mizan_app/core/widgets/personal_data/profile_card.dart';
import 'package:mizan_app/models/user_model.dart';

class PersonalDataScreen extends StatefulWidget {
  final UserModel user;
  const PersonalDataScreen({super.key, required this.user});

  @override
  State<PersonalDataScreen> createState() => _PersonalDataScreenState();
}

class _PersonalDataScreenState extends State<PersonalDataScreen> {
  late UserModel userData;

  @override
  void initState() {
    super.initState();
    userData = widget.user;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfffff3df),
      appBar: const PersonalAppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            const SizedBox(height: 100),
            ProfileCard(
              user: userData,
              onUpdate: (newUser) {
                setState(() {
                  userData = newUser;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
