import 'package:flutter/cupertino.dart';

class SpacingDimens {
  static const double small = 12;
  static const double regular= 16;
  static const double medium= 24;
  static const double large = 32;
  static const double xlarge = 42;

  static const Widget smallSpacer = SizedBox(height: small,);
  static const Widget regularSpacer = SizedBox(height: regular,);
  static const Widget mediumSpacer = SizedBox(height: medium,);
  static const Widget largeSpacer = SizedBox(height: large,);
  static const Widget xlargeSpacer = SizedBox(height: xlarge,);
}
