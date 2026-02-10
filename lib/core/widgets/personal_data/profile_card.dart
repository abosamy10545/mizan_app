import 'package:flutter/material.dart';
import 'package:mizan_app/models/user_model.dart';
import 'profile_avatar.dart';
import 'profile_info.dart';
import 'salary_row.dart';
import 'edit_button.dart';
import 'edit_personal_data_sheet.dart';

class ProfileCard extends StatelessWidget {
  final UserModel user;
  final ValueChanged<UserModel> onUpdate;

  const ProfileCard({
    super.key,
    required this.user,
    required this.onUpdate,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.topCenter,
      children: [
        Container(
          width: double.infinity,
          height: 550,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(40),
            color: const Color(0xffb7c498),
          ),
        ),

        const Positioned(top: -80, child: ProfileAvatar()),

        Positioned(top: 100, child: ProfileInfo(user: user)),

        Positioned(
          top: 300,
          child: SalaryRow(
            salary: user.monthlySalary,
            balance: user.bankBalance,
          ),
        ),

        Positioned(
          bottom: 30,
          child: EditButton(
            onTap: () async {
              final updatedUser =
                  await showModalBottomSheet<UserModel>(
                context: context,
                isScrollControlled: true,
                backgroundColor: Colors.transparent,
                builder: (_) => EditPersonalDataSheet(user: user),
              );

              if (updatedUser != null) {
                onUpdate(updatedUser);
              }
            },
          ),
        ),
      ],
    );
  }
}
