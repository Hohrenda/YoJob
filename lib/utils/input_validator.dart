abstract class InputValidator {
  static String? presenceValidator(String? input) {
    if (input?.isEmpty == true) {
      return 'This field is required';
    }

    return null;
  }

  static String? emailValidator(String? input) {
    final RegExp regex = RegExp(
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+",
    );
    final int atCount = '@'.allMatches(input ?? '').length;

    if (input?.isEmpty == true) {
      return 'This field is required';
    }

    if (input != null && regex.hasMatch(input) && atCount == 1) {
      return null;
    }

    return 'Email is incorrect';
  }
}
