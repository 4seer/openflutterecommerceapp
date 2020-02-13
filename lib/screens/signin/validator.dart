class Validator {
  static String valueExists(dynamic value) {
    if (value == null || value.isEmpty) {
      return "Please fill this field";
    } else {
      return null;
    }
  }

  static String passwordCorrect(dynamic value) {
    String emptyResult = valueExists(value);
    if (emptyResult == null || emptyResult.isEmpty) {
      String pattern = r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[#?!@$%^&*-]).{8,}$';
      RegExp regExp = new RegExp(pattern);
      if (!regExp.hasMatch(value)) {
        return 'Your password must be at least 8 symbols with number, big and small letter and special character (!@#\$%^&*).';
      } else {
        return null;
      }
    } else {
      return emptyResult;
    }
  }

  static String validateEmail(dynamic value) {
    String pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regExp = new RegExp(pattern);
    String emptyResult = valueExists(value);
    if (emptyResult != null) {
      return emptyResult;
    } else if (!regExp.hasMatch(value)) {
      return "Not a valid email address. Should be your@email.com";
    } else {
      return null;
    }
  }
}
