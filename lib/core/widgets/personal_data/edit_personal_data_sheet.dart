import 'package:flutter/material.dart';
import 'package:mizan_app/models/user_model.dart';

class EditPersonalDataSheet extends StatefulWidget {
  final UserModel user;
  const EditPersonalDataSheet({super.key, required this.user});

  @override
  State<EditPersonalDataSheet> createState() => _EditPersonalDataSheetState();
}

class _EditPersonalDataSheetState extends State<EditPersonalDataSheet> {
  late TextEditingController nameController;
  late TextEditingController emailController;
  late TextEditingController salaryController;
  late TextEditingController balanceController;

  late String country;

  final List<String> countries = [
    'مصر',
    'السعودية',
    'الامارات',
    'البحرين',
    'الكويت',
    'قطر',
    'تونس',
    'سوريا',
    'الجزائر',
    'فلسطين',
    'عُمان',
    'السودان',
    'لبنان',
    'ليبيا',
    'موريتانيا',
    'العراق',
    'الاردن',
    'الصومال',
    'جيبوتي',
    'جزر القمر',
    'المغرب',
  ];

  @override
  void initState() {
    super.initState();
    nameController = TextEditingController(text: widget.user.name);
    emailController = TextEditingController(text: widget.user.email);
    salaryController = TextEditingController(
      text: widget.user.monthlySalary.toString(),
    );
    balanceController = TextEditingController(
      text: widget.user.bankBalance.toString(),
    );

    country = countries.contains(widget.user.country)
        ? widget.user.country
        : countries.first;
  }

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    salaryController.dispose();
    balanceController.dispose();
    super.dispose();
  }

  InputDecoration _decoration(String label) {
    return InputDecoration(
      labelText: label,
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 100),
      child: Container(
        height: 550,
        padding: EdgeInsets.only(
          left: 16,
          right: 16,
          top: 20,
          bottom: MediaQuery.of(context).viewInsets.bottom + 20,
        ),
        decoration: const BoxDecoration(
          color: Color(0xfffff3df),
          borderRadius: BorderRadius.all(Radius.circular(20)),
        ),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Row(
                  children: [
                    const Text(
                      'Edit Personal\n data',
                      style: TextStyle(
                        fontSize: 22,
                        fontFamily: 'Lemonada',
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),

                Padding(
                  padding: const EdgeInsets.only(bottom: 12),
                  child: TextField(
                    controller: nameController,
                    decoration: _decoration('الاسم'),
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.only(bottom: 12),
                  child: TextField(
                    controller: emailController,
                    decoration: _decoration('الإيميل'),
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.only(bottom: 12),
                  child: TextField(
                    controller: salaryController,
                    keyboardType: TextInputType.number,
                    decoration: _decoration('الراتب الشهري'),
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.only(bottom: 12),
                  child: TextField(
                    controller: balanceController,
                    keyboardType: TextInputType.number,
                    decoration: _decoration('الرصيد البنكي'),
                  ),
                ),

                Row(
                  spacing: 30,
                  children: [
                    const SizedBox(
                      child: Text(
                        'Select country:',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          fontFamily: 'ReadexPro',
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10.0),
                      child: Expanded(
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton<String>(
                            value: country,

                            dropdownColor: const Color(0xff7c9a7e),
                            menuMaxHeight: 700,
                            icon: const Icon(
                              Icons.arrow_downward_outlined,
                              color: Colors.black,
                              size: 25,
                            ),
                            style: const TextStyle(
                              fontSize: 25,
                              fontFamily: 'Handjet',
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),

                            items: countries.map((c) {
                              return DropdownMenuItem<String>(
                                value: c,
                                child: Text(c),
                              );
                            }).toList(),

                            onChanged: (val) {
                              setState(() {
                                country = val!;
                              });
                            },
                          ),
                        ),
                      ),
                    ),
                  ],
                ),

                Padding(
                  padding: const EdgeInsets.only(top: 20.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xff708872),
                            foregroundColor: Colors.white,
                            padding: const EdgeInsets.symmetric(vertical: 14),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                            elevation: 2,
                          ),
                          onPressed: () {
                            Navigator.pop(
                              context,
                              UserModel(
                                name: nameController.text,
                                email: emailController.text,
                                monthlySalary:
                                    int.tryParse(salaryController.text) ?? 0,
                                bankBalance:
                                    int.tryParse(balanceController.text) ?? 0,
                                country: country,
                              ),
                            );
                          },
                          child: const Text(
                            'حفظ',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Lemonada',
                            ),
                          ),
                        ),
                      ),

                      const SizedBox(width: 12),

                      Expanded(
                        child: OutlinedButton(
                          style: OutlinedButton.styleFrom(
                            padding: const EdgeInsets.symmetric(vertical: 14),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                            side: const BorderSide(
                              color: Color(0xff708872),
                              width: 1.5,
                            ),
                          ),
                          onPressed: () => Navigator.pop(context),
                          child: const Text(
                            'إلغاء',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                              color: Color(0xff708872),
                              fontFamily: 'Lemonada',
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
