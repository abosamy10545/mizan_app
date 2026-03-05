import 'package:flutter/material.dart';
import 'package:mizan_app/core/widgets/auth/bank_balance_field.dart';
import 'package:mizan_app/core/widgets/auth/login_button.dart';
import 'package:mizan_app/core/widgets/auth/login_country_selector.dart';

import 'package:mizan_app/core/widgets/auth/login_image.dart';
import 'package:mizan_app/core/widgets/auth/login_text_field.dart';
import 'package:mizan_app/core/widgets/auth/login_title.dart';
import 'package:mizan_app/core/widgets/auth/monthly_salary_field.dart';
import 'package:mizan_app/models/user_model.dart';
import 'package:mizan_app/screens/home_screen.dart';
import 'package:mizan_app/services/shared_pref_user.dart';

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
                  const LoginTitle(),
                  const SizedBox(height: 10),
                  const LoginImage(),
                  const SizedBox(height: 20),

                  LoginTextField(
                    controller: nameController,
                    label: 'Name',
                    errorText: 'please enter your name',
                  ),
                  const SizedBox(height: 10),

                  LoginTextField(
                    controller: emailController,
                    label: 'Email',
                    errorText: 'please enter your email',
                  ),
                  const SizedBox(height: 10),

                  MonthlySalaryField(
                    controller: monthlySalaryController,
                    isHidden: isShownMonthlySalary,
                    onToggle: () {
                      setState(() {
                        isShownMonthlySalary = !isShownMonthlySalary;
                      });
                    },
                  ),
                  const SizedBox(height: 10),

                  BankBalanceField(
                    controller: bankBalanceController,
                    isHidden: isShownBankBalance,
                    onToggle: () {
                      setState(() {
                        isShownBankBalance = !isShownBankBalance;
                      });
                    },
                  ),

                  const SizedBox(height: 10),

                  LoginCountrySelector(
                    countries: arabCountries,
                    onSelected: (country) {
                      selectedCountry = country;
                    },
                  ),

                  const SizedBox(height: 20),

                  LoginButton(
                    onPressed: () async {
                      if (!formKey.currentState!.validate()) return;

                      if (selectedCountry == null) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('اختار الدولة')),
                        );
                        return;
                      }

                      final user = UserModel(
                        name: nameController.text,
                        email: emailController.text,
                        monthlySalary: int.parse(monthlySalaryController.text),
                        bankBalance: int.parse(bankBalanceController.text),
                        country: selectedCountry!,
                      );

                      await SharedPref.saveUser(user);

                      if (!mounted) return;

                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (_) => HomeScreen(user: user),
                        ),
                      );
                    },
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
