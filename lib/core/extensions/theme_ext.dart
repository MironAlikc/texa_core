import 'package:flutter/material.dart';
import 'package:texa_core/core/theme/app_color_extension.dart';

extension AppThemeExtension on ThemeData {
  AppColorExtension get appColor => extension<AppColorExtension>()!;
}

extension ThemeGetter on BuildContext {
  ThemeData get theme => Theme.of(this);
  AppColorExtension get color => theme.appColor;
}
