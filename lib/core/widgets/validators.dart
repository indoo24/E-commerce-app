class AppValidators {
  AppValidators._();

  // Validate Email
  static String? validateEmail(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Please enter your email';
    }

    RegExp emailRegex = RegExp(r'^[\w-.]+@([\w-]+\.)+[\w-]{2,4}$');
    if (!emailRegex.hasMatch(value)) {
      return 'Please enter a valid email';
    }

    return null;
  }

  // Validate Name
  static String? validateName(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Please enter your name';
    }

    RegExp nameRegex = RegExp(r'^[a-zA-Z\s]+$');
    if (!nameRegex.hasMatch(value)) {
      return 'Please enter a valid name';
    }

    return null;
  }

  // Validate Password
  static String? validatePassword(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Please enter your password';
    }

    if (value.length < 8) {
      return 'Password must be at least 8 characters';
    }

    RegExp passwordRegex = RegExp(
      r'^(?=.*[a-z])(?=.*[0-9]).{8,}$',
    );
    if (!passwordRegex.hasMatch(value)) {
      return 'Please enter a valid password';
    }

    return null;
  }

  // Validate Phone Number
  static String? validatePhoneNumber(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Please enter your phone number';
    }

    if (value.length != 11) {
      return 'Phone number must be 11 digits';
    }

    RegExp phoneNumberRegex = RegExp(r'^[0-9]{11}$');
    if (!phoneNumberRegex.hasMatch(value)) {
      return 'Please enter a valid phone number';
    }

    return null;
  }
}
