import 'package:flutter/foundation.dart';

class HomeProvider with ChangeNotifier, DiagnosticableTreeMixin {
  bool _isShowing = false;
  bool _isAccepted = false;

  bool get isShowing => _isShowing;

  bool get isAccepted => _isAccepted;

  set isShowing(bool isShowing) {
    _isShowing = isShowing;
    notifyListeners();
  }

  set isAccepted(bool isAccepted) {
    _isAccepted = isAccepted;
    notifyListeners();
  }
}
