import 'package:flutter/material.dart';

class CurrencySelector extends StatelessWidget {
  final String selectedCountry;
  final Map<String, double> rates;
  final ValueChanged<String?> onChanged;

  const CurrencySelector({
    super.key,
    required this.selectedCountry,
    required this.rates,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const SizedBox(
          // width: 150,
          child: Text(
            'اختر العمله المراد تحويلها',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              // fontSize: 16,
              fontFamily: 'ReadexPro',
            ),
          ),
        ),
        Container(
          width: 200,
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: DropdownButtonHideUnderline(
            child: DropdownButton<String>(
              value: selectedCountry,
              isExpanded: true,
              dropdownColor: const Color(0xff7c9a7e),
              menuMaxHeight: 700,
              icon: Icon(
                Icons.arrow_downward_outlined,
                color: Colors.black,
                size: 25,
              ),
              style: const TextStyle(
                fontSize: 25,
                fontFamily: 'Handjet',
                color: Colors.black,
              ),
              items: rates.keys.map((country) {
                return DropdownMenuItem(value: country, child: Text(country));
              }).toList(),
              onChanged: onChanged,
            ),
          ),
        ),
      ],
    );
  }
}
