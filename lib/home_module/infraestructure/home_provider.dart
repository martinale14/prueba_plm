import 'package:flutter/foundation.dart';

class HomeProvider with ChangeNotifier, DiagnosticableTreeMixin {
  bool _acceptedTerms = false;

  bool get acceptedTerms => _acceptedTerms;

  set acceptedTerms(bool acepptedTerms) {
    _acceptedTerms = acceptedTerms;
    notifyListeners();
  }
}
