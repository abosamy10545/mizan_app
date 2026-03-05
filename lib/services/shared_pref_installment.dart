import 'package:shared_preferences/shared_preferences.dart';
import '../models/installment_model.dart';

class SharedPrefInstallment {
  static const String _key = "installments";

  static Future<void> saveInstallments(
      List<InstallmentModel> installments) async {
    final prefs = await SharedPreferences.getInstance();

    List<String> data =
        installments.map((e) => e.toJson()).toList();

    await prefs.setStringList(_key, data);
  }

  static Future<List<InstallmentModel>> loadInstallments() async {
    final prefs = await SharedPreferences.getInstance();

    final data = prefs.getStringList(_key);

    if (data == null) return [];

    return data.map((e) => InstallmentModel.fromJson(e)).toList();
  }
}
