import 'package:flutter/material.dart';
import 'package:mizan_app/core/widgets/currency/amount_input.dart';
import 'package:mizan_app/core/widgets/currency/convert_button.dart';
import 'package:mizan_app/core/widgets/currency/converter_header.dart';
import 'package:mizan_app/core/widgets/currency/currency_selector.dart';
import 'package:mizan_app/core/widgets/currency/result_card.dart';

class CurrencyConverterScreen extends StatefulWidget {
  const CurrencyConverterScreen({super.key});

  @override
  State<CurrencyConverterScreen> createState() =>
      _CurrencyConverterScreenState();
}

class _CurrencyConverterScreenState extends State<CurrencyConverterScreen> {
  final formKey = GlobalKey<FormState>();
  final TextEditingController amountController = TextEditingController();

  String selectedCountry = 'Egypt (EGP)';
  double result = 0;

  final Map<String, double> rates = {
    'Egypt (EGP)': 50.0,
    'Saudi Arabia (SAR)': 3.75,
    'UAE (AED)': 3.67,
    'Bahrain (BHD)': 0.38,
    'Kuwait (KWD)': 0.31,
    'Qatar (QAR)': 3.64,
    'Tunisia (TND)': 3.10,
    'Syria (SYP)': 13000.0,
    'Algeria (DZD)': 135.0,
    'Palestine (ILS)': 3.70,
    'Oman (OMR)': 0.38,
    'Sudan (SDG)': 600.0,
    'Lebanon (LBP)': 89000.0,
    'Libya (LYD)': 4.90,
    'Mauritania (MRU)': 39.0,
    'Iraq (IQD)': 1300.0,
    'Jordan (JOD)': 0.71,
    'Somalia (SOS)': 570.0,
    'Djibouti (DJF)': 178.0,
    'Comoros (KMF)': 460.0,
    'Morocco (MAD)': 10.0,
  };

  void convert() {
    final amount = double.tryParse(amountController.text);
    if (amount == null) return;

    setState(() {
      result = amount / rates[selectedCountry]!;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfffdf2dc),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Color(0xfffff3df),
        title: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Text(
            'Mizan',
            style: TextStyle(
              fontSize: 40,
              fontWeight: FontWeight.bold,
              fontFamily: 'ReemKufi',
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            const ConverterHeader(),
            const SizedBox(height: 10),

            CurrencySelector(
              selectedCountry: selectedCountry,
              rates: rates,
              onChanged: (value) {
                setState(() => selectedCountry = value!);
              },
            ),

            const SizedBox(height: 20),
            Form(
              key: formKey,
              child: Column(
                children: [
                  AmountInput(
                    controller: amountController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter an amount';
                      }
                      if (double.tryParse(value) == null) {
                        return 'Enter a valid number';
                      }
                      if (double.parse(value) <= 0) {
                        return 'Amount must be greater than zero';
                      }
                      return null;
                    },
                  ),
                ],
              ),
            ),

            const SizedBox(height: 30),
            ConvertButton(
              onPressed: () {
                if (!formKey.currentState!.validate()) return;

                final amount = double.parse(amountController.text);

                setState(() {
                  result = amount / rates[selectedCountry]!;
                });
              },
            ),

            const SizedBox(height: 25),
            ResultCard(country: selectedCountry, result: result),
          ],
        ),
      ),
    );
  }
}
