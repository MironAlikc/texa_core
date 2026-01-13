import 'package:flutter/material.dart';

abstract class AppSizes {
  static const double micro = 2.0;
  static const double extraSmall = 4.0;
  static const double tiny = 6.0;
  static const double small = 8.0;
  static const double medium = 16.0;
  static const double large = 24.0;
  static const double extraLarge = 32.0;
  static const double huge = 48.0;
  static const double massive = 64.0;
}

extension AppSizesExtension on double {
  Widget get horizontalBox => SizedBox(width: this);
  Widget get verticalBox => SizedBox(height: this);

  EdgeInsets get allPadding => EdgeInsets.all(this);
  EdgeInsets get horizontalPadding => EdgeInsets.symmetric(horizontal: this);
  EdgeInsets get verticalPadding => EdgeInsets.symmetric(vertical: this);

  EdgeInsets get topPadding => EdgeInsets.only(top: this);
  EdgeInsets get bottomPadding => EdgeInsets.only(bottom: this);
  EdgeInsets get leftPadding => EdgeInsets.only(left: this);
  EdgeInsets get rightPadding => EdgeInsets.only(right: this);

  EdgeInsets combine(double vertical) =>
      EdgeInsets.symmetric(horizontal: this, vertical: vertical);
}
