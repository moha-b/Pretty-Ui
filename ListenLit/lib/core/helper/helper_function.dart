import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

String convertNonDigitsToAsterisks({required String digits}) {
  String convertedString = '';
  if (kDebugMode) {
    print('${digits}entering');
  }
  for (int i = 0; i < digits.length; i++) {
    if (digits[i] == '0' ||
        digits[i] == '1' ||
        digits[i] == '2' ||
        digits[i] == '3' ||
        digits[i] == '4' ||
        digits[i] == '5' ||
        digits[i] == '6' ||
        digits[i] == '7' ||
        digits[i] == '8' ||
        digits[i] == '9') {
      convertedString += '*';
    } else {
      convertedString += digits[i];
    }
  }
  if (kDebugMode) {
    print('$convertedString convert NonDigits To Asterisks ');
  }
  return convertedString;
}

String convertAsterisksToNumber({required String convertedString}) {
  String convertedString = "****";
  String numberString = '';

  for (int i = 0; i < convertedString.length; i++) {
    if (convertedString[i] == '*') {
      numberString += (i + 1).toString();
    } else {
      numberString += convertedString[i];
    }
  }
  if (kDebugMode) {
    print('${numberString}convert Asterisks To Number ');
  }
  return numberString;
}

class FourDigitFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    final strippedValue = newValue.text.replaceAll(' ', '');

    String formattedValue = '';
    for (var i = 0; i < strippedValue.length; i += 4) {
      final end = i + 4;
      if (end <= strippedValue.length) {
        formattedValue += '${strippedValue.substring(i, end)} ';
      } else {
        formattedValue += strippedValue.substring(i);
      }
    }

    return TextEditingValue(
      text: formattedValue,
      selection: TextSelection.collapsed(offset: formattedValue.length),
    );
  }
}

String descriptionText =
    "Far far away, behind the word mountains, far from the countries Vokalia and Consonantia, there live the blind texts. Separated they live in Bookmarksgrove right at the coast of the Semantics, a large language ocean. A small river named Duden flows by their place and supplies it with the necessary regelialia. It is a paradisematic country, in which roasted parts of sentences fly into your mouth.\n\nThe Big Oxmox advised her not to do so, because there were thousands of bad Commas, wild Question Marks and devious Semikoli, but the Little Blind Text didn’t listen.\n\nLittle Blind Text didn’t listen. She packed her seven versalia, put her initial into the belt and made herself on the way.\n\nBookmarksgrove, the headline of Alphabet Village and the subline of her own road, the Line Lane. Pityful a rethoric question ran over her cheek, then";
String shortDescriptionText = "Far far away, behind the word mountains, far from the countries Vokalia and Consonantia, there live the blind texts. Separated they live in Bookmarksgrove right at the coast of the Semantics, a large language ocean. A small river named Duden flows by their place and supplies it with the necessary regelialia. It is a paradisematic country, in which roasted parts of sentences fly into your mouth.";
  class CustomTrackShape extends RoundedRectSliderTrackShape {
  @override
  Rect getPreferredRect({
    required RenderBox parentBox,
    required SliderThemeData sliderTheme,
    Offset offset = Offset.zero,
    bool isEnabled = false,
    bool isDiscrete = false,
  }) {
    final trackHeight = sliderTheme.trackHeight;
    final trackLeft = offset.dx;
    final trackTop = offset.dy + (parentBox.size.height - trackHeight!) / 2;
    final trackWidth = parentBox.size.width;
    return Rect.fromLTWH(trackLeft, trackTop, trackWidth, trackHeight);
  }
}