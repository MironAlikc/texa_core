import 'package:flutter/material.dart';
import 'package:texa_core/core/theme/app_color_extension.dart';

class AppTheme {
  static ThemeData light() {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.light,
      extensions: [_lightColors],
    );
  }

  static ThemeData dark() {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      extensions: [_darkColors],
    );
  }

  static final _lightColors = AppColorExtension(
    primary: const Color(0xFF0F172A),
    onPrimary: Colors.white,
    accent: const Color(0xFF3983F5),
    background: const Color(0xFFF1F5F9),
    surface: Colors.white,
    surfaceVariant: const Color(0xFFFAF9F6),
    textPrimary: const Color(0xFF020817),
    textSecondary: const Color(0xFF64748B),
    textTertiary: const Color(0xFF94A3B8),
    textInverted: Colors.white,
    textDisabled: const Color(0xFFCBD5E1),
    borderLight: const Color(0xFFF1F5F9),
    borderDefault: const Color(0xFFE2E8F0),
    borderFocus: const Color(0xFF0F172A),
    success: const Color(0xFF10B981),
    onSuccess: Colors.white,
    error: const Color(0xFFEF4444),
    onError: Colors.white,
    warning: const Color(0xFFF59E0B),
    onWarning: Colors.white,
    info: const Color(0xFF0A2540),
    onInfo: Colors.white,
    navBackground: const Color(0xFF0A2540),
    navActiveItem: const Color(0xFF00D4AA),
    navInactiveItem: const Color(0xFF64748B),
  );

  static final _darkColors = AppColorExtension(
    primary: const Color(0xFF38BDF8),
    onPrimary: const Color(0xFF0F172A),
    accent: const Color(0xFF60A5FA),
    background: const Color(0xFF020817),
    surface: const Color(0xFF0F172A),
    surfaceVariant: const Color(0xFF1E293B),
    textPrimary: const Color(0xFFF8FAFC),
    textSecondary: const Color(0xFF94A3B8),
    textTertiary: const Color(0xFF64748B),
    textInverted: const Color(0xFF020817),
    textDisabled: const Color(0xFF475467),
    borderLight: const Color(0xFF1E293B),
    borderDefault: const Color(0xFF334155),
    borderFocus: const Color(0xFF38BDF8),
    success: const Color(0xFF34D399),
    onSuccess: const Color(0xFF064E3B),
    error: const Color(0xFFF87171),
    onError: const Color(0xFF7F1D1D),
    warning: const Color(0xFFFBBF24),
    onWarning: const Color(0xFF78350F),
    info: const Color(0xFF38BDF8),
    onInfo: const Color(0xFF0C4A6E),
    navBackground: const Color(0xFF020817),
    navActiveItem: const Color(0xFF00D4AA),
    navInactiveItem: const Color(0xFF64748B),
  );
}
