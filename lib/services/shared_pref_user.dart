import 'package:mizan_app/models/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPref {
  static Future<void> saveUser(UserModel user) async {
    final prefs = await SharedPreferences.getInstance();

    await prefs.setString('name', user.name);
    await prefs.setString('email', user.email);
    await prefs.setInt('salary', user.monthlySalary.toInt());
    await prefs.setInt('balance', user.bankBalance.toInt());
    await prefs.setString('country', user.country);
  }

  static Future<UserModel?> getUser() async {
    final prefs = await SharedPreferences.getInstance();

    final name = prefs.getString('name');
    if (name == null) return null;

    return UserModel(
      name: name,
      email: prefs.getString('email') ?? '',
      monthlySalary: prefs.getInt('salary') ?? 0,
      bankBalance: (prefs.getInt('balance') ?? 0),
      country: prefs.getString('country') ?? '',
    );
  }

  static Future<void> clear() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.clear();
  }
}
