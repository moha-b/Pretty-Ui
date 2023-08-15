import 'package:flutter/services.dart';

class CardNumberInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    if (newValue.selection.baseOffset == 0) {
      return newValue;
    }

    String value = newValue.text.replaceAll(RegExp(r'\s'), '');
    String formattedValue = '';

    for (int i = 0; i < value.length; i++) {
      if (i >= 15) {
        break;
      }
      formattedValue += value[i];
      if ((i + 1) % 4 == 0 && i != value.length - 1) {
        formattedValue += ' ';
      }
    }

    return newValue.copyWith(
      text: formattedValue,
      selection: TextSelection.collapsed(
        offset: formattedValue.length,
      ),
    );
  }
}


class DateInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    if (newValue.selection.baseOffset == 0) {
      return newValue;
    }

    String value = newValue.text.replaceAll('/', '');
    String formattedValue = '';

    for (int i = 0; i < value.length; i++) {
      if (i >= 4) {
        break;
      }

      formattedValue += value[i];

      if (i == 1) {
        formattedValue += '/';
      }
    }

    return newValue.copyWith(
      text: formattedValue,
      selection: TextSelection.collapsed(
        offset: formattedValue.length,
      ),
    );
  }
}

