class Validator {
  static String? validateUsername(String username) {
    if (username.isEmpty) {
      return 'Username cannot be empty';
    }
    return null;
  }

  static String? validatePassword(String password) {
    const pattern =
        r'^(?=.*[A-Z])(?=.*[a-z])(?=.*\d)(?=.*[@_])[A-Za-z\d@_]{5,}$';
    final regExp = RegExp(pattern);

    if (password.isEmpty) {
      return 'Password cannot be empty';
    } else if (!regExp.hasMatch(password)) {
      return 'Password must contain at least:\n- 1 uppercase letter\n- 1 lowercase letter\n- 1 number\n- 1 special character (@ or _)\n- Minimum 8 characters';
    }
    return null;
  }

  static String? confirmPasswords(String password, String confirmPassword) {
    if (password != confirmPassword) {
      return 'Passwords do not match';
    }
    if (password.isEmpty) {
      return '';
    }
    return null;
  }
}
