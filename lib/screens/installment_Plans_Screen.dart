import 'package:flutter/material.dart';
import 'package:mizan_app/services/shared_pref_installment.dart';
import '../models/installment_model.dart';

class InstallmentPlansScreen extends StatefulWidget {
  const InstallmentPlansScreen({super.key});

  @override
  State<InstallmentPlansScreen> createState() => _InstallmentPlansScreenState();
}

class _InstallmentPlansScreenState extends State<InstallmentPlansScreen> {
  List<InstallmentModel> installments = [];

  @override
  void initState() {
    super.initState();
    loadData();
  }

  Future<void> loadData() async {
    installments = await SharedPrefInstallment.loadInstallments();
    setState(() {});
  }

  Future<void> addInstallment(InstallmentModel installment) async {
    installments.add(installment);
    await SharedPrefInstallment.saveInstallments(installments);
    setState(() {});
  }

  Future<void> deleteInstallment(int index) async {
    installments.removeAt(index);
    await SharedPrefInstallment.saveInstallments(installments);
    setState(() {});
  }

  void showAddInstallmentSheet() {
    final amountController = TextEditingController();
    final dateController = TextEditingController();
    final notesController = TextEditingController();

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: const Color(0xfffff3df),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(25)),
      ),
      builder: (context) {
        return Padding(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
            left: 20,
            right: 20,
            top: 20,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                "اضافة القسط الشهري",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),

              TextField(
                controller: amountController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  hintText: "القسط الشهري",
                  border: OutlineInputBorder(),
                ),
              ),

              const SizedBox(height: 15),

              TextField(
                controller: dateController,
                readOnly: true,
                decoration: const InputDecoration(
                  hintText: "المعاد",
                  border: OutlineInputBorder(),
                ),
                onTap: () async {
                  DateTime? pickedDate = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime.now(),
                    lastDate: DateTime(2100),
                  );

                  if (pickedDate != null) {
                    dateController.text =
                        "${pickedDate.day}/${pickedDate.month}/${pickedDate.year}";
                  }
                },
              ),

              const SizedBox(height: 15),

              TextField(
                controller: notesController,
                decoration: const InputDecoration(
                  hintText: "ملاحظات",
                  border: OutlineInputBorder(),
                ),
              ),

              const SizedBox(height: 20),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      backgroundColor: const Color(0xff708872),
                      padding: const EdgeInsets.symmetric(
                        vertical: 14,
                        horizontal: 20,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(40),
                      ),
                      side: const BorderSide(
                        color: Color(0xff708872),
                        width: 1.5,
                      ),
                    ),
                    onPressed: () {
                      if (amountController.text.isEmpty ||
                          dateController.text.isEmpty) {
                        return;
                      }

                      final newInstallment = InstallmentModel(
                        amount: amountController.text,
                        date: dateController.text,
                        notes: notesController.text,
                      );

                      addInstallment(newInstallment);
                      Navigator.pop(context);
                    },
                    child: const Text(
                      'اضافه',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  const SizedBox(width: 30),
                  OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                        vertical: 14,
                        horizontal: 24,
                      ),
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
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 20),
            ],
          ),
        );
      },
    );
  }

  Widget _buildInstallmentRow(InstallmentModel item) {
    return Row(
      children: [
        Expanded(
          child: Column(
            children: [
              Container(
                height: 30,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.green),
                  color: const Color(0xfffff3df),
                ),
                child: const Text(
                  'القسط الشهري',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                height: 40,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.green),
                  color: const Color(0xfffff3df),
                ),
                child: Text(item.amount, style: const TextStyle(fontSize: 16)),
              ),
            ],
          ),
        ),
        Expanded(
          child: Column(
            children: [
              Container(
                height: 30,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.green),
                  color: const Color(0xfffff3df),
                ),
                child: const Text(
                  'المعاد',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                height: 40,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.green),
                  color: const Color(0xfffff3df),
                ),
                child: Text(item.date, style: const TextStyle(fontSize: 16)),
              ),
            ],
          ),
        ),
        Expanded(
          child: Column(
            children: [
              Container(
                height: 30,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.green),
                  color: const Color(0xfffff3df),
                ),
                child: const Text(
                  'ملاحظات',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                height: 40,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.green),
                  color: const Color(0xfffff3df),
                ),
                child: Text(
                  item.notes,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(fontSize: 16),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfffff3df),

      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        backgroundColor: const Color(0xfffff3df),
        title: const Text(
          'Mizan',
          style: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.bold,
            fontFamily: 'ReemKufi',
            color: Colors.black,
          ),
        ),
      ),

      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color(0xff708872),
        onPressed: showAddInstallmentSheet,
        child: const Icon(Icons.add, color: Colors.white),
      ),

      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10),
        child: Column(
          children: [
            // الجزء الجديد: الـ Avatar مع الـ Container
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
                            style: TextStyle(
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

            const SizedBox(height: 20),

            // باقي الشاشة: الأقساط
            Expanded(
              child: installments.isEmpty
                  ? Center(
                      child: Column(
                        children: [
                          SizedBox(height: 20),
                          const Text(
                            "ليس لديك أي قسط بعد",
                            style: TextStyle(
                              fontSize: 25,
                              color: Color.fromARGB(255, 105, 118, 74),
                            ),
                          ),
                          const SizedBox(height: 10),
                          Container(
                            width: MediaQuery.sizeOf(context).width / 2 + 150,
                            height: 350,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              image: const DecorationImage(
                                image: AssetImage('assets/images/no_quest.gif'),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  : ListView.builder(
                      itemCount: installments.length,
                      itemBuilder: (context, index) {
                        final item = installments[index];

                        return Dismissible(
                          key: Key(index.toString()),
                          direction: DismissDirection.endToStart,
                          background: Container(
                            alignment: Alignment.centerRight,
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            color: Colors.red,
                            child: const Icon(
                              Icons.delete,
                              color: Colors.white,
                            ),
                          ),
                          onDismissed: (direction) async {
                            await deleteInstallment(index);

                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text("تم حذف القسط")),
                            );
                          },
                          child: Padding(
                            padding: const EdgeInsets.only(bottom: 12),
                            child: _buildInstallmentRow(item),
                          ),
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
