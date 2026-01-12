import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:texa_core/core/extensions/theme_ext.dart';
import 'package:texa_core/core/theme/theme_cubit/theme_cubit.dart';

class ThemeTestPage extends StatelessWidget {
  const ThemeTestPage({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = context.color;
    final themeMode = context.watch<ThemeCubit>().state;

    return Scaffold(
      backgroundColor: colors.background,
      appBar: AppBar(
        title: const Text('Theme Settings'),
        backgroundColor: colors.navBackground,
        foregroundColor: colors.navActiveItem,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(_getThemeIcon(themeMode), size: 64, color: colors.primary),
            const SizedBox(height: 20),
            Text(
              'Current Mode: ${themeMode.name.toUpperCase()}',
              style: TextStyle(
                color: colors.textPrimary,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 32),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: colors.accent,
                foregroundColor: colors.textInverted,
                padding: const EdgeInsets.symmetric(
                  horizontal: 32,
                  vertical: 16,
                ),
              ),
              onPressed: () => context.read<ThemeCubit>().toggleTheme(),
              child: const Text('Toggle Theme Mode'),
            ),
          ],
        ),
      ),
    );
  }

  IconData _getThemeIcon(ThemeMode mode) {
    switch (mode) {
      case ThemeMode.system:
        return Icons.brightness_auto;
      case ThemeMode.light:
        return Icons.light_mode;
      case ThemeMode.dark:
        return Icons.dark_mode;
    }
  }
}
