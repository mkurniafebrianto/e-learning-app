import 'package:flutter/material.dart';

class Styles {
  static textStyle({
    Color? color,
    String? fontfamiliy = 'Poppins',
    required double textFont,
    required FontWeight fontWeight,
  }) {
    return TextStyle(
      fontFamily: fontfamiliy,
      color: color,
      fontSize: textFont,
      fontWeight: fontWeight,
    );
  }
}
