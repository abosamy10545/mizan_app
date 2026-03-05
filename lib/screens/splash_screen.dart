import 'package:flutter/material.dart';
import 'package:mizan_app/screens/home_screen.dart';
import 'package:mizan_app/screens/login_screen.dart';
import 'package:mizan_app/services/shared_pref_user.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _navigate();
  }

  void _navigate() async {
    await Future.delayed(const Duration(seconds: 3));

    final user = await SharedPref.getUser();

    if (!mounted) return;

    if (user != null) {
      // ✅ في داتا → Home
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (_) => HomeScreen(user: user),
        ),
      );
    } else {
      // ❌ مفيش داتا → Login
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (_) => const LoginScreen(),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Image(image: AssetImage('assets/images/mizan.png')),
          SizedBox(height: 10),
          Text(
            'ميزان',
            style: TextStyle(
              color: Colors.white,
              fontSize: 30,
              fontFamily: 'Gulzar',
            ),
          ),
        ],
      ),
    );
  }
}
