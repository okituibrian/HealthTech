import 'package:flutter/services.dart';

class EmailInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(TextEditingValue oldValue, TextEditingValue newValue) {
    // Check if the new value contains '&' character
    if (newValue.text.contains('&')) {
      // Revert to the old value if '&' is found
      return oldValue;
    }

    // Check if the new value starts with '@' character
    if (newValue.text.startsWith('@')) {
      // Revert to the old value if '@' is the first character
      return oldValue;
    }

    // Allow the new value if it contains '@' and doesn't contain '&'
    if (newValue.text.contains('@')) {
      return newValue;
    }

    // Check if the new value contains only alphabetic characters and '@'
    final regex = RegExp(r'^[a-zA-Z@]*$');
    if (regex.hasMatch(newValue.text)) {
      return newValue;
    }

    // Otherwise, revert to the old value
    return oldValue;
  }
}
