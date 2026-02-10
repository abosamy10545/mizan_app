import 'package:flutter/material.dart';

class MonthlySalaryField extends StatelessWidget {
  final TextEditingController controller;
  final bool isHidden;
  final VoidCallback onToggle;

  const MonthlySalaryField({
    super.key,
    required this.controller,
    required this.isHidden,
    required this.onToggle,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: TextInputType.number,
      obscureText: isHidden,
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
          onPressed: onToggle,
          icon: Icon(
            isHidden ? Icons.visibility_off : Icons.visibility,
          ),
        ),
      ),
    );
  }
}
