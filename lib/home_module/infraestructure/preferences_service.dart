import 'package:shared_preferences/shared_preferences.dart';

class PreferencesService {
  PreferencesService._();

  Future<bool> getAcceptedTerms() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool accepted = prefs.getBool('accepted_terms') ?? false;

    return accepted;
  }
}
