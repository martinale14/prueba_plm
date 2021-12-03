import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';

class RegisterProvider with ChangeNotifier, DiagnosticableTreeMixin {
  TextEditingController nameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController documentNumberController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

  File? _imageFile;

  String _documentType = '';
  String _birthday = '';

  String? _emailValidationText;
  String? _cedulaValidationText;
  String? _phoneValidationText;

  File? get imageFile => _imageFile;

  String get documentType => _documentType;

  String get birthday => _birthday;

  String? get emailValidationText => _emailValidationText;

  String? get cedulaValidationText => _cedulaValidationText;

  String? get phoneValidationText => _phoneValidationText;

  set imageFile(File? file) {
    _imageFile = file;
    notifyListeners();
  }

  set documentType(String type) {
    _documentType = type;
    notifyListeners();
  }

  set birthday(String date) {
    _birthday = date;
    notifyListeners();
  }

  set emailValidationText(String? validationText) {
    _emailValidationText = validationText;
    notifyListeners();
  }

  set cedulaValidationText(String? validationText) {
    _cedulaValidationText = validationText;
    notifyListeners();
  }

  set phoneValidationText(String? validationText) {
    _phoneValidationText = validationText;
    notifyListeners();
  }

  @override
  void dispose() {
    nameController.dispose();
    lastNameController.dispose();
    documentNumberController.dispose();
    emailController.dispose();
    phoneController.dispose();
    super.dispose();
  }
}
