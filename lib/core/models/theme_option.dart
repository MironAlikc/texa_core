import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:texa_core/core/l10n/gen/app_localizations.dart';

enum AppThemeMode { light, dark, system }

class ThemeOption {
  final String label;
  final IconData icon;
  final AppThemeMode mode;

  const ThemeOption({
    required this.label,
    required this.icon,
    required this.mode,
  });
}

class ThemeOptions {
  static List<ThemeOption> getOptions(BuildContext context) {
    final l10n = AppLocalizations.of(context);

    return [
      ThemeOption(
        label: l10n.light,
        icon: LucideIcons.sun,
        mode: AppThemeMode.light,
      ),
      ThemeOption(
        label: l10n.dark,
        icon: LucideIcons.moon,
        mode: AppThemeMode.dark,
      ),
      ThemeOption(
        label: l10n.system,
        icon: LucideIcons.laptop,
        mode: AppThemeMode.system,
      ),
    ];
  }
}

AppThemeMode mapToAppThemeMode(ThemeMode mode) {
  switch (mode) {
    case ThemeMode.light:
      return AppThemeMode.light;
    case ThemeMode.dark:
      return AppThemeMode.dark;
    case ThemeMode.system:
      return AppThemeMode.system;
  }
}

ThemeMode mapToThemeMode(AppThemeMode mode) {
  switch (mode) {
    case AppThemeMode.light:
      return ThemeMode.light;
    case AppThemeMode.dark:
      return ThemeMode.dark;
    case AppThemeMode.system:
      return ThemeMode.system;
  }
}
