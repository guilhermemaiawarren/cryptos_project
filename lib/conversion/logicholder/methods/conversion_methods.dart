class ConversionMethods {
  static String coinRegExp(String value) {
    return value.replaceAll(RegExp(r'[^\w\s]+'), '.');
  }

  static bool validCoinValue(String source) {
    return !source.startsWith(RegExp(r'[!@#$%^&*(),.?":{}|<>]'));
  }

  static String convertedValue(String value, void Function() fn) {
    fn;
    return value;
  }
}
