import 'package:flutter/material.dart';
import 'package:mizan_app/core/widgets/home/home_feature_card.dart';
import 'package:mizan_app/core/widgets/home/home_header.dart';
import 'package:mizan_app/models/user_model.dart';
import 'package:mizan_app/screens/currency_converter_screen.dart';
import 'package:mizan_app/screens/personal_data_screen.dart';

class HomeScreen extends StatefulWidget {
  final UserModel user;

  const HomeScreen({super.key, required this.user});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: [
            HomeHeader(user: userData),
            const SizedBox(height: 15),

            HomeFeatureCard(
              title: 'Currency conversion calculator to US Dollar',
              image: 'assets/images/dolar.png',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => const CurrencyConverterScreen(),
                  ),
                );
              },
            ),

            const SizedBox(height: 15),
            HomeFeatureCard(
              title: 'Installment plans and payment schedules',
              image: 'assets/images/aqsat.jpg',
              onTap: () {},
            ),

            const SizedBox(height: 15),
            HomeFeatureCard(
              title: 'Organizing expenses in relation to your monthly income',
              image: 'assets/images/masrouf.png',
              onTap: () {},
            ),

            const SizedBox(height: 15),
            HomeFeatureCard(
              title: 'Personal data',
              image: 'assets/images/data.jpg',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => PersonalDataScreen(user: widget.user),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
