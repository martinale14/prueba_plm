class RegisterValidationService {
  RegisterValidationService._();

  static String? validateEmail(String email) {
    String? validationMessage;

    if (!RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(email)) {
      validationMessage = 'Dirección de correo no valida';
    }
    if (email.isEmpty) {
      validationMessage = 'El campo no debe estar vacío';
    }

    return validationMessage;
  }

  static String? validatePassword(String password) {
    String? validationMessage;

    if (password.isEmpty) {
      validationMessage = 'El campo no debe estar vacío';
    }

    return validationMessage;
  }

  static String? validateCedula(String cedula) {
    String? validationMessage;

    for (int i = 0; i < cedula.length; i++) {
      if (!isDigit(cedula[i], 0)) {
        validationMessage = 'Carácter no valido';
      }
    }

    return validationMessage;
  }

  static String? validatePhone(String phone) {
    String? validationMessage;

    for (int i = 0; i < phone.length; i++) {
      if ((!isDigit(phone[i], 0)) || (phone[i] == '+' && i != 0)) {
        validationMessage = 'Carácter no valido';
      }
    }

    return validationMessage;
  }

  static String? validateNewPassword(String password) {
    String? validationMessage = '';

    bool hasUppercase = false;
    bool hasLowercase = false;
    bool hasNumber = false;
    bool hasSpecialCharacter =
        password.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'));

    if (password.isEmpty) {
      return 'El campo no debe estar vacío';
    }

    if (password.length < 6) {
      return 'La contraseña debe tener al menos 6 caracteres';
    }

    for (int i = 0; i < password.length; i++) {
      if (password[i] == password[i].toUpperCase() &&
          !isDigit(password[i], 0)) {
        hasUppercase = true;
      }
      if (password[i] == password[i].toLowerCase() &&
          !isDigit(password[i], 0)) {
        hasLowercase = true;
      }

      if (isDigit(password[i], 0)) {
        hasNumber = true;
      }
    }

    validationMessage += hasUppercase ? '' : '\n Mínimo una mayúscula';
    validationMessage += hasLowercase ? '' : '\n Mínimo una minúscula';
    validationMessage += hasNumber ? '' : '\n Mínimo un número';
    validationMessage +=
        hasSpecialCharacter ? '' : '\n Mínimo un caracter especial';

    if (validationMessage.isEmpty) {
      validationMessage = null;
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
