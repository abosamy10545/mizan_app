import 'package:flutter/material.dart';

class ResultCard extends StatelessWidget {
  final String country;
  final double result;

  const ResultCard({
    super.key,
    required this.country,
    required this.result,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(18),
        border: Border.all(width: 1.5),
      ),
      child: Column(
        children: [
          Text(
            '$country =',
            style: const TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              fontFamily: 'ReadexPro',
            ),
          ),
          const SizedBox(height: 10),
          Text(
            '${result.toStringAsFixed(3)} USD',
            style: const TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              fontFamily: 'ReadexPro',
            ),
          ),
        ],
      ),
    );
  }
}
