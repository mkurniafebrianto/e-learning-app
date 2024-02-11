import 'package:flutter/material.dart';

class Styles {
  static textStyle({
    Color? color,
    required double textFont,
    required FontWeight fontWeight,
  }) {
    return TextStyle(
      fontFamily: 'Poppins',
      color: color,
      fontSize: textFont,
      fontWeight: fontWeight,
    );
  }
}
