import 'package:flutter/material.dart';

abstract class YoJobColors {
  static const Color primaryColor = Color.fromRGBO(255, 136, 0, 1);
  static const Color secondaryColor = Color.fromRGBO(255, 208, 0, 1);

  static const Gradient yoJobThemeGradient = LinearGradient(
    colors: [
      primaryColor,
      secondaryColor,
    ],
  );
}
