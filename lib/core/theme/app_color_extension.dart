import 'package:flutter/material.dart';

class AppColorExtension extends ThemeExtension<AppColorExtension> {
  // --- Brand Colors ---
  final Color primary;
  final Color onPrimary;
  final Color accent;

  // --- Backgrounds ---
  final Color background;
  final Color surface;
  final Color surfaceVariant;

  // --- Text Content ---
  final Color textPrimary;
  final Color textSecondary;
  final Color textTertiary;
  final Color textInverted;
  final Color textDisabled;

  // --- Borders & Dividers ---
  final Color borderLight;
  final Color borderDefault;
  final Color borderFocus;

  // --- Status & Feedback ---
  final Color success;
  final Color onSuccess;
  final Color error;
  final Color onError;
  final Color warning;
  final Color onWarning;
  final Color info;
  final Color onInfo;

  // --- Specialized (Sidebar/Nav) ---
  final Color navBackground;
  final Color navActiveItem;
  final Color navInactiveItem;

  const AppColorExtension({
    required this.primary,
    required this.onPrimary,
    required this.accent,
    required this.background,
    required this.surface,
    required this.surfaceVariant,
    required this.textPrimary,
    required this.textSecondary,
    required this.textTertiary,
    required this.textInverted,
    required this.textDisabled,
    required this.borderLight,
    required this.borderDefault,
    required this.borderFocus,
    required this.success,
    required this.onSuccess,
    required this.error,
    required this.onError,
    required this.warning,
    required this.onWarning,
    required this.info,
    required this.onInfo,
    required this.navBackground,
    required this.navActiveItem,
    required this.navInactiveItem,
  });

  @override
  ThemeExtension<AppColorExtension> copyWith({
    Color? primary,
    Color? onPrimary,
    Color? accent,
    Color? background,
    Color? surface,
    Color? surfaceVariant,
    Color? textPrimary,
    Color? textSecondary,
    Color? textTertiary,
    Color? textInverted,
    Color? textDisabled,
    Color? borderLight,
    Color? borderDefault,
    Color? borderFocus,
    Color? success,
    Color? onSuccess,
    Color? error,
    Color? onError,
    Color? warning,
    Color? onWarning,
    Color? info,
    Color? onInfo,
    Color? navBackground,
    Color? navActiveItem,
    Color? navInactiveItem,
  }) {
    return AppColorExtension(
      primary: primary ?? this.primary,
      onPrimary: onPrimary ?? this.onPrimary,
      accent: accent ?? this.accent,
      background: background ?? this.background,
      surface: surface ?? this.surface,
      surfaceVariant: surfaceVariant ?? this.surfaceVariant,
      textPrimary: textPrimary ?? this.textPrimary,
      textSecondary: textSecondary ?? this.textSecondary,
      textTertiary: textTertiary ?? this.textTertiary,
      textInverted: textInverted ?? this.textInverted,
      textDisabled: textDisabled ?? this.textDisabled,
      borderLight: borderLight ?? this.borderLight,
      borderDefault: borderDefault ?? this.borderDefault,
      borderFocus: borderFocus ?? this.borderFocus,
      success: success ?? this.success,
      onSuccess: onSuccess ?? this.onSuccess,
      error: error ?? this.error,
      onError: onError ?? this.onError,
      warning: warning ?? this.warning,
      onWarning: onWarning ?? this.onWarning,
      info: info ?? this.info,
      onInfo: onInfo ?? this.onInfo,
      navBackground: navBackground ?? this.navBackground,
      navActiveItem: navActiveItem ?? this.navActiveItem,
      navInactiveItem: navInactiveItem ?? this.navInactiveItem,
    );
  }

  @override
  ThemeExtension<AppColorExtension> lerp(
    covariant ThemeExtension<AppColorExtension>? other,
    double t,
  ) {
    if (other is! AppColorExtension) return this;
    return AppColorExtension(
      primary: Color.lerp(primary, other.primary, t)!,
      onPrimary: Color.lerp(onPrimary, other.onPrimary, t)!,
      accent: Color.lerp(accent, other.accent, t)!,
      background: Color.lerp(background, other.background, t)!,
      surface: Color.lerp(surface, other.surface, t)!,
      surfaceVariant: Color.lerp(surfaceVariant, other.surfaceVariant, t)!,
      textPrimary: Color.lerp(textPrimary, other.textPrimary, t)!,
      textSecondary: Color.lerp(textSecondary, other.textSecondary, t)!,
      textTertiary: Color.lerp(textTertiary, other.textTertiary, t)!,
      textInverted: Color.lerp(textInverted, other.textInverted, t)!,
      textDisabled: Color.lerp(textDisabled, other.textDisabled, t)!,
      borderLight: Color.lerp(borderLight, other.borderLight, t)!,
      borderDefault: Color.lerp(borderDefault, other.borderDefault, t)!,
      borderFocus: Color.lerp(borderFocus, other.borderFocus, t)!,
      success: Color.lerp(success, other.success, t)!,
      onSuccess: Color.lerp(onSuccess, other.onSuccess, t)!,
      error: Color.lerp(error, other.error, t)!,
      onError: Color.lerp(onError, other.onError, t)!,
      warning: Color.lerp(warning, other.warning, t)!,
      onWarning: Color.lerp(onWarning, other.onWarning, t)!,
      info: Color.lerp(info, other.info, t)!,
      onInfo: Color.lerp(onInfo, other.onInfo, t)!,
      navBackground: Color.lerp(navBackground, other.navBackground, t)!,
      navActiveItem: Color.lerp(navActiveItem, other.navActiveItem, t)!,
      navInactiveItem: Color.lerp(navInactiveItem, other.navInactiveItem, t)!,
    );
  }
}
