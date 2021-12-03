import 'package:flutter/foundation.dart';

class HomeProvider with ChangeNotifier, DiagnosticableTreeMixin {
  bool _isShowing = false;

  bool get isShowing => _isShowing;

  set isShowing(bool isShowing) {
    _isShowing = isShowing;
    notifyListeners();
  }
}
