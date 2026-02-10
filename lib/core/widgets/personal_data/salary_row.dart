import 'package:flutter/material.dart';
import 'package:mizan_app/core/widgets/personal_data/circle_info.dart';

class SalaryRow extends StatelessWidget {
  final int salary;
  final int balance;

  const SalaryRow({
    super.key,
    required this.salary,
    required this.balance,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleInfo(
          salary: salary,
          text: 'Monthly Salary',
        ),
        const SizedBox(width: 50),
        CircleInfo(
          salary: balance,
          text: 'Bank Balance',
        ),
      ],
    );
  }
}
