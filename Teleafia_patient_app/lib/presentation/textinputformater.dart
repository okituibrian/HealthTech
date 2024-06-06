import 'package:flutter/services.dart';

class EmailInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(TextEditingValue oldValue, TextEditingValue newValue) {
    // Allow the new value if it is empty
    if (newValue.text.isEmpty) {
      return newValue;
    }

    // Check if the new value starts or ends with '@' or '.'

    if (newValue.text.startsWith('@') || newValue.text.startsWith('.') /*||
        newValue.text.endsWith('@') || newValue.text.endsWith('.')*/) {
      return oldValue;
    }

    // Allow the new value if it contains only alphabetic characters, '@', and '.'
    final regex = RegExp(r'^[a-zA-Z@.]*$');
    if (regex.hasMatch(newValue.text)) {
      return newValue;
    }

    // Otherwise, revert to the old value
    return oldValue;
  }
}

class PhoneNumberInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(TextEditingValue oldValue, TextEditingValue newValue) {
    // Allow the new value if it is empty
    if (newValue.text.isEmpty) {
      return newValue;
    }

    // Allow the new value if it contains only digits and is up to 9 characters long
    final regex = RegExp(r'^\d{0,9}$');
    if (regex.hasMatch(newValue.text)) {
      return newValue;
    }

    // Otherwise, revert to the old value
    return oldValue;
  }
}

// Usage in a TextField

/*
          TextField(
          inputFormatters: [EmailInputFormatter()],
           keyboardType: TextInputType.emailAddress,
          decoration: InputDecoration(
hintText: 'Enter your email',
        ),
      ),

    TextField(
        inputFormatters: [PhoneNumberInputFormatter()],
        keyboardType: TextInputType.phone,
        decoration: InputDecoration(
        hintText: 'Enter your phone number',
        ),
    ),
*/
