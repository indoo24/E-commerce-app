class AppValidators {
  AppValidators._();

  static String? validateEmail(String? value) {
    RegExp emailRegex = RegExp(r'^[\w-.]+@([\w-]+\.)+[\w-]{2,4}$');
    if (value == null || value.isEmpty) {
      return 'Please enter your email';
    } else if (!emailRegex.hasMatch(value) == false) {
      return 'Please enter a valid email';
    } else if (value.trim().isEmpty) {
      return 'This field is required';
    }
    return null;
  }

  static String? validateName(String? value) {
    RegExp nameRegex = RegExp(r'^[a-zA-Z\s]+$');
    if (value == null || value.isEmpty) {
      return 'Please enter your name';
    } else if (!nameRegex.hasMatch(value)) {
      return 'Please enter a valid name';
    }
    return null;
  }

  static String? validatePassword(String? value) {
    RegExp passwordRegex =
        RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');
    if (value == null || value.isEmpty) {
      return 'Please enter your password';
    } else if (!passwordRegex.hasMatch(value)) {
      return 'Please enter a valid password';
    } else if (value.length < 8) {
      return 'Password must be at least 8 characters';
    }
    return null;
  }

  static String? validatePhoneNumber(String? value) {
    RegExp phoneNumberRegex = RegExp(r'^[0-9]+$');
    if (value == null || value.isEmpty) {
      return 'Please enter your phone number';
    } else if (!phoneNumberRegex.hasMatch(value)) {
      return 'Please enter a valid phone number';
    } else if (value.length != 11) {
      return 'Phone number must be 11 digits';
    }
    return null;
  }
}
