import 'dart:convert';

class InstallmentModel {
  String amount;
  String date;
  String notes;

  InstallmentModel({
    required this.amount,
    required this.date,
    required this.notes,
  });

  Map<String, dynamic> toMap() {
    return {'amount': amount, 'date': date, 'notes': notes};
  }

  factory InstallmentModel.fromMap(Map<String, dynamic> map) {
    return InstallmentModel(
      amount: map['amount'],
      date: map['date'],
      notes: map['notes'],
    );
  }

  String toJson() => json.encode(toMap());

  factory InstallmentModel.fromJson(String source) =>
      InstallmentModel.fromMap(json.decode(source));
}
