class ValidatorUtils {
  static bool isValidEmail(String email) {
    final regex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    return regex.hasMatch(email);
  }

  static bool isLengthValid(String value, int minLength) {
    return value.length >= minLength;
  }
}
