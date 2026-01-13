import 'package:flutter/material.dart';
import 'package:texa_core/core/extensions/theme_ext.dart';

class AppSwitch extends StatelessWidget {
  final bool value;
  final ValueChanged<bool> onChanged;

  const AppSwitch({super.key, required this.value, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    final colors = context.color;

    return Switch.adaptive(
      value: value,
      onChanged: onChanged,
      activeThumbColor: colors.onPrimary,
      activeTrackColor: colors.primary,
      inactiveThumbColor: colors.textSecondary,
      inactiveTrackColor: colors.borderDefault,
      trackOutlineColor: WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.selected)) {
          return Colors.transparent;
        }
        return colors.borderDefault;
      }),
    );
  }
}
