class RegisterValidationService {
  RegisterValidationService._();

  static String? validateEmail(String email) {
    String? validationMessage;

    if (!RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(email)) {
      validationMessage = 'Invalid email';
    }
    if (email.isEmpty) {
      validationMessage = 'The field can´t be empty';
    }

    return validationMessage;
  }

  static String? validatePassword(String password) {
    String? validationMessage;

    if (password.isEmpty) {
      validationMessage = 'The field can´t be empty';
    }

    return validationMessage;
  }

  static String? validateCedula(String cedula) {
    String? validationMessage;

    for (int i = 0; i < cedula.length; i++) {
      if (!isDigit(cedula[i], 0)) {
        validationMessage = 'Invalid Character';
      }
    }

    return validationMessage;
  }

  static String? validatePhone(String phone) {
    String? validationMessage;

    for (int i = 0; i < phone.length; i++) {
      if ((!isDigit(phone[i], 0)) || (phone[i] == '+' && i != 0)) {
        validationMessage = 'Invalid character';
      }
    }

    return validationMessage;
  }

  static bool isDigit(String s, int idx) =>
      "0".compareTo(s[idx]) <= 0 && "9".compareTo(s[idx]) >= 0;

  static bool validateGroup(List<String?> validationsTexts) {
    for (int i = 0; i < validationsTexts.length; i++) {
      if (validationsTexts[i] != null) {
        return false;
      }
    }

    return true;
  }
}
