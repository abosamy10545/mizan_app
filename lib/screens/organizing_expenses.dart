import 'package:flutter/material.dart';
import 'package:mizan_app/models/user_model.dart';

class OrganizingExpenses extends StatefulWidget {
  final UserModel user;
  const OrganizingExpenses({super.key, required this.user});

  @override
  State<OrganizingExpenses> createState() => _OrganizingExpensesState();
}

class _OrganizingExpensesState extends State<OrganizingExpenses> {
  late UserModel userData;
  @override
  void initState() {
    super.initState();
    userData = widget.user;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfffff3df),
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
        padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10),
        child: Column(
          children: [
            Row(
              children: [
                SizedBox(
                  height: 140,
                  child: Stack(
                    clipBehavior: Clip.none,
                    children: [
                      const CircleAvatar(
                        radius: 35,
                        backgroundImage: AssetImage('assets/images/logo.png'),
                      ),
                      Positioned(
                        left: 78,
                        top: 40,
                        child: Container(
                          width: 270,
                          height: 100,
                          padding: const EdgeInsets.all(8),
                          decoration: const BoxDecoration(
                            color: Color(0xffb7c498),
                            borderRadius: BorderRadius.only(
                              topRight: Radius.circular(20),
                              bottomLeft: Radius.circular(20),
                              bottomRight: Radius.circular(20),
                            ),
                          ),
                          child: Text(
                            'This page displays the best expense rankings from your system.',
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
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
            const SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 200,
                  height: 80,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Color(0xff606676),
                  ),
                  child: Center(
                    child: Text(
                      userData.monthlySalary.toString(),
                      style: const TextStyle(
                        fontSize: 35,
                        fontFamily: 'Handjet',
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Expanded(
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  Row(
                    children: [
                      Container(
                        width: 200,
                        height: 420,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(color: Colors.black, width: 5),
                          color: Color(0xfffff3df),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'مصروفاتك\n الاساسيه اليوميه',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 21,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'ReadexPro',
                              ),
                            ),
                            const SizedBox(height: 10),
                            Container(
                              width: 150,
                              height: 150,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(100),
                                gradient: LinearGradient(
                                  stops: [0.5, 0.5],
                                  colors: [
                                    Color(0xff708872),
                                    Color(0xffb7c498),
                                  ],
                                ),
                              ),
                              child: Center(
                                child: Container(
                                  width: 135,
                                  height: 135,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(100),
                                    color: Color(0xfffff3df),
                                  ),
                                  child: Column(
                                    children: [
                                      SizedBox(height: 10),
                                      Center(
                                        child: Text(
                                          '50.0%',
                                          style: const TextStyle(
                                            fontSize: 35,
                                            fontFamily: 'Handjet',
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                      SizedBox(height: 10),
                                      Center(
                                        child: Text(
                                          (userData.monthlySalary / 2)
                                              .toString(),
                                          style: const TextStyle(
                                            fontSize: 35,
                                            fontFamily: 'Handjet',
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(height: 5),
                            Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Column(
                                spacing: 10,
                                children: [
                                  Row(
                                    spacing: 5,
                                    children: [
                                      Image(
                                        image: AssetImage(
                                          'assets/images/1.1.png',
                                        ),
                                        width: 20,
                                      ),
                                      Text(
                                        'فواتير الكهرباء والمياه',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16,
                                          fontFamily: 'ReadexPro',
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    spacing: 5,
                                    children: [
                                      Image(
                                        image: AssetImage(
                                          'assets/images/1.2.png',
                                        ),
                                        width: 20,
                                      ),
                                      Text(
                                        'مصاريف التعليم',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16,
                                          fontFamily: 'ReadexPro',
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    spacing: 5,
                                    children: [
                                      Image(
                                        image: AssetImage(
                                          'assets/images/1.3.png',
                                        ),
                                        width: 20,
                                      ),
                                      Text(
                                        'الرعايه الصحيه',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16,
                                          fontFamily: 'ReadexPro',
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    spacing: 5,
                                    children: [
                                      Image(
                                        image: AssetImage(
                                          'assets/images/1.4.png',
                                        ),
                                        width: 20,
                                      ),
                                      Text(
                                        'النقل',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16,
                                          fontFamily: 'ReadexPro',
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    spacing: 5,
                                    children: [
                                      Image(
                                        image: AssetImage(
                                          'assets/images/1.5.png',
                                        ),
                                        width: 17,
                                      ),
                                      Text(
                                        'الاتصالات',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16,
                                          fontFamily: 'ReadexPro',
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(width: 10),
                      Container(
                        width: 200,
                        height: 420,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(color: Colors.black, width: 5),
                          color: Color(0xfffff3df),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'المصروفات \nالشخصيه المتغيره',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 21,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'ReadexPro',
                              ),
                            ),
                            const SizedBox(height: 10),
                            Container(
                              width: 150,
                              height: 150,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(100),
                                gradient: LinearGradient(
                                  stops: [0.3, 0.3],
                                  colors: [
                                    Color(0xff708872),
                                    Color(0xffb7c498),
                                  ],
                                ),
                              ),
                              child: Center(
                                child: Container(
                                  width: 135,
                                  height: 135,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(100),
                                    color: Color(0xfffff3df),
                                  ),
                                  child: Column(
                                    children: [
                                      SizedBox(height: 10),
                                      Center(
                                        child: Text(
                                          '30.0%',
                                          style: const TextStyle(
                                            fontSize: 35,
                                            fontFamily: 'Handjet',
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                      SizedBox(height: 10),
                                      Center(
                                        child: Text(
                                          (userData.monthlySalary * 30 / 100)
                                              .toString(),
                                          style: const TextStyle(
                                            fontSize: 35,
                                            fontFamily: 'Handjet',
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(height: 35),
                            Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Column(
                                spacing: 10,
                                children: [
                                  Row(
                                    spacing: 5,
                                    children: [
                                      Image(
                                        image: AssetImage(
                                          'assets/images/2.1.png',
                                        ),
                                        width: 20,
                                      ),
                                      Text(
                                        'التسوق',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16,
                                          fontFamily: 'ReadexPro',
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    spacing: 5,
                                    children: [
                                      Image(
                                        image: AssetImage(
                                          'assets/images/2.2.png',
                                        ),
                                        width: 20,
                                      ),
                                      Text(
                                        'الانشطه الترفيهيه',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16,
                                          fontFamily: 'ReadexPro',
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    spacing: 5,
                                    children: [
                                      Image(
                                        image: AssetImage(
                                          'assets/images/2.3.png',
                                        ),
                                        width: 20,
                                      ),
                                      Text(
                                        'الرحلات',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16,
                                          fontFamily: 'ReadexPro',
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    spacing: 5,
                                    children: [
                                      Image(
                                        image: AssetImage(
                                          'assets/images/2.4.png',
                                        ),
                                        width: 17,
                                      ),
                                      Text(
                                        'الهدايا',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16,
                                          fontFamily: 'ReadexPro',
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(width: 10),
                      Container(
                        width: 200,
                        height: 420,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(color: Colors.black, width: 5),
                          color: Color(0xfffff3df),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'الادخارات\nوالاستثمارات',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 21,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'ReadexPro',
                              ),
                            ),
                            const SizedBox(height: 10),
                            Container(
                              width: 150,
                              height: 150,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(100),
                                gradient: LinearGradient(
                                  stops: [0.2, 0.2],
                                  colors: [
                                    Color(0xff708872),
                                    Color(0xffb7c498),
                                  ],
                                ),
                              ),
                              child: Center(
                                child: Container(
                                  width: 135,
                                  height: 135,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(100),
                                    color: Color(0xfffff3df),
                                  ),
                                  child: Column(
                                    children: [
                                      SizedBox(height: 10),
                                      Center(
                                        child: Text(
                                          '20.0%',
                                          style: const TextStyle(
                                            fontSize: 35,
                                            fontFamily: 'Handjet',
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                      SizedBox(height: 10),
                                      Center(
                                        child: Text(
                                          (userData.monthlySalary * 2 / 100)
                                              .toString(),
                                          style: const TextStyle(
                                            fontSize: 35,
                                            fontFamily: 'Handjet',
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(height: 60),
                            Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Column(
                                spacing: 10,
                                children: [
                                  Row(
                                    spacing: 5,
                                    children: [
                                      Image(
                                        image: AssetImage(
                                          'assets/images/3.1.png',
                                        ),
                                        width: 20,
                                      ),
                                      Text(
                                        'زياده المدخرات',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16,
                                          fontFamily: 'ReadexPro',
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    spacing: 5,
                                    children: [
                                      Image(
                                        image: AssetImage(
                                          'assets/images/3.2.png',
                                        ),
                                        width: 20,
                                      ),
                                      Text(
                                        'تعجيل سداد الديون',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16,
                                          fontFamily: 'ReadexPro',
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    spacing: 5,
                                    children: [
                                      Image(
                                        image: AssetImage(
                                          'assets/images/3.2.png',
                                        ),
                                        width: 20,
                                      ),
                                      Text(
                                        'حالات الطوارئ',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16,
                                          fontFamily: 'ReadexPro',
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
