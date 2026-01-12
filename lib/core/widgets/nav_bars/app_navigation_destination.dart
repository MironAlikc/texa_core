import 'package:flutter/material.dart';
import 'package:texa_core/core/extensions/theme_ext.dart';

class AppNavigationDestination extends StatelessWidget {
  final IconData icon;
  final IconData activeIcon;
  final String label;
  final bool isSelected;

  const AppNavigationDestination({
    super.key,
    required this.icon,
    required this.activeIcon,
    required this.label,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    final colors = context.color;

    return NavigationDestination(
      icon: Icon(icon, color: colors.navInactiveItem),
      selectedIcon: Icon(activeIcon, color: colors.navActiveItem),
      label: label,
    );
  }
}
