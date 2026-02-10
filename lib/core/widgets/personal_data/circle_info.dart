import 'package:flutter/material.dart';

class CircleInfo extends StatelessWidget {
  final int salary;
  final String text;
  const CircleInfo({super.key, required this.salary, required this.text});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 110,
          width: 110,
          decoration: BoxDecoration(
            color: Color(0xffb7c498),
            borderRadius: BorderRadius.circular(100),
            border: Border.all(color: Color(0xfffbf2e2), width: 8),
          ),
          child: Center(
            child: Text(
              salary.toString(),
              style: TextStyle(
                fontFamily: 'Handjet',
                fontSize: 36,
                fontWeight: FontWeight.w300,
              ),
            ),
          ),
        ),
        Text(
          text,
          style: TextStyle(
            fontFamily: 'ReemKufi',
            fontSize: 20,
            fontWeight: FontWeight.w800,
          ),
        ),
      ],
    );
  }
}
