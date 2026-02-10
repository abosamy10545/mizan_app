import 'package:flutter/material.dart';
import 'package:mizan_app/core/widgets/personal_data/circle_info.dart';
import 'package:mizan_app/core/widgets/personal_data/edit_personal_data_sheet.dart';
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
      backgroundColor: Color(0xfffff3df),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Color(0xfffff3df),
        title: Text(
          'Mizan',
          style: TextStyle(
            fontSize: 40,
            fontWeight: FontWeight.bold,
            fontFamily: 'ReemKufi',
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            SizedBox(height: 100),
            Stack(
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

                Positioned(
                  top: -80,
                  child: CircleAvatar(
                    radius: 90,
                    backgroundColor: Color(0xffb7c498),
                    child: CircleAvatar(
                      radius: 75,
                      backgroundImage: AssetImage('assets/images/slogan.gif'),
                    ),
                  ),
                ),

                Positioned(
                  top: 100,
                  child: Text(
                    userData.name,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.w600,
                      fontFamily: 'Lemonada',
                    ),
                  ),
                ),

                Positioned(
                  top: 160,
                  child: Text(
                    userData.email,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w500,
                      fontFamily: 'Lemonada',
                    ),
                  ),
                ),
                Positioned(
                  top: 210,
                  child: Container(
                    width: 140,
                    height: 60,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: Color(0xff708872),
                    ),
                    child: Center(
                      child: Text(
                        userData.country,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          fontFamily: 'Lemonada',
                        ),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: 300,
                  child: Row(
                    children: [
                      CircleInfo(
                        salary: userData.monthlySalary,
                        text: 'Monthly Salary',
                      ),
                      SizedBox(width: 50),

                      CircleInfo(
                        salary: userData.bankBalance,
                        text: 'Bank Balance',
                      ),
                    ],
                  ),
                ),
                Positioned(
                  bottom: 30,

                  child: GestureDetector(
                    onTap: () async {
                      final updatedUser = await showModalBottomSheet<UserModel>(
                        context: context,
                        isScrollControlled: true,
                        backgroundColor: Colors.transparent,
                        builder: (_) => EditPersonalDataSheet(user: userData),
                      );

                      if (updatedUser != null) {
                        setState(() {
                          userData = updatedUser;
                        });
                      }
                    },
                    child: Container(
                      width: 100,
                      height: 50,
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.2),
                            blurRadius: 10,
                            spreadRadius: 2,
                            offset: Offset(0, 5), // X , Y
                          ),
                        ],
                        borderRadius: BorderRadius.circular(30),
                        color: Color(0xfffbf2e2),
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
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
