import 'package:shared_preferences/shared_preferences.dart';

class PreferencesService {
  PreferencesService._();

  static Future<bool> getAcceptedTerms() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool accepted = prefs.getBool('accepted_terms') ?? false;

    return accepted;
  }

  static saveAcceptedTerms(bool acepted) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('accepted_terms', acepted);
  }
}
