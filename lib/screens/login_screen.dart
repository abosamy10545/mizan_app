import 'package:flutter/material.dart';
import 'package:mizan_app/core/widgets/auth/login_country_selector.dart';

import 'package:mizan_app/models/user_model.dart';
import 'package:mizan_app/screens/home_screen.dart';
import 'package:mizan_app/services/shared_pref.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final formKey = GlobalKey<FormState>();

  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final monthlySalaryController = TextEditingController();
  final bankBalanceController = TextEditingController();

  bool isShownMonthlySalary = true;
  bool isShownBankBalance = true;
  String? selectedCountry;

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    monthlySalaryController.dispose();
    bankBalanceController.dispose();
    super.dispose();
  }

  final List<String> arabCountries = [
    'مصر',
    'السعودية',
    'الامارات',
    'البحرين',
    'الكويت',
    'قطر',
    'تونس',
    'سوريا',
    'الجزائر',
    'فلسطين',
    'عُمان',
    'السودان',
    'لبنان',
    'ليبيا',
    'موريتانيا',
    'العراق',
    'الاردن',
    'الصومال',
    'جيبوتى',
    'جزر القمر',
    'المغرب',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Form(
              key: formKey,
              child: Column(
                children: [
                  const Text(
                    'ميزان',
                    style: TextStyle(
                      fontSize: 35,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'ReemKufi',
                    ),
                  ),
                  const SizedBox(height: 10),
                  Image.asset('assets/images/login.gif', width: 230),
                  const SizedBox(height: 20),

                  TextFormField(
                    controller: nameController,
                    validator: (value) =>
                        value!.isEmpty ? 'please enter your name' : null,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Name',
                    ),
                  ),

                  const SizedBox(height: 10),

                  TextFormField(
                    controller: emailController,
                    validator: (value) =>
                        value!.isEmpty ? 'please enter your email' : null,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Email',
                    ),
                  ),

                  const SizedBox(height: 10),

                  TextFormField(
                    controller: monthlySalaryController,
                    keyboardType: TextInputType.number,
                    obscureText: isShownMonthlySalary,
                    validator: (value) {
                      if (value!.isEmpty) return 'enter salary';
                      if (double.tryParse(value) == null) {
                        return 'enter valid number';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      border: const OutlineInputBorder(),
                      labelText: 'Monthly Salary',
                      suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            isShownMonthlySalary = !isShownMonthlySalary;
                          });
                        },
                        icon: Icon(
                          isShownMonthlySalary
                              ? Icons.visibility_off
                              : Icons.visibility,
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 10),

                  TextFormField(
                    controller: bankBalanceController,
                    keyboardType: TextInputType.number,
                    obscureText: isShownBankBalance,
                    validator: (value) {
                      if (value!.isEmpty) return 'enter bank balance';
                      if (double.tryParse(value) == null) {
                        return 'enter valid number';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      border: const OutlineInputBorder(),
                      labelText: 'Bank Balance',
                      suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            isShownBankBalance = !isShownBankBalance;
                          });
                        },
                        icon: Icon(
                          isShownBankBalance
                              ? Icons.visibility_off
                              : Icons.visibility,
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 10),

                  LoginCountrySelector(
                    countries: arabCountries,
                    onSelected: (country) {
                      selectedCountry = country;
                    },
                  ),

                  const SizedBox(height: 20),

                  ElevatedButton(
                    onPressed: () async {
                      if (!formKey.currentState!.validate()) return;

                      final user = UserModel(
                        name: nameController.text,
                        email: emailController.text,
                        monthlySalary: int.parse(
                          monthlySalaryController.text,
                        ),
                        bankBalance: int.parse(bankBalanceController.text),
                        country: selectedCountry!,
                      );

                      await SharedPref.saveUser(user);

                      if (!mounted) return;

                      Navigator.pushReplacement(
                        // ignore: use_build_context_synchronously
                        context,
                        MaterialPageRoute(
                          builder: (_) => HomeScreen(user: user),
                        ),
                      );
                    },
                    style: ButtonStyle(
                      shape: WidgetStateProperty.all(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      backgroundColor: WidgetStateProperty.all(Colors.green),
                      padding: WidgetStateProperty.all(
                        const EdgeInsets.symmetric(
                          horizontal: 40,
                          vertical: 15,
                        ),
                      ),
                    ),
                    child: const Text(
                      'Login',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
