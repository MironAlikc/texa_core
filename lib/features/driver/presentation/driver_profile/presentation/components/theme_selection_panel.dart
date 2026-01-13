import 'package:flutter/material.dart';
import 'package:texa_core/core/models/theme_option.dart';
import 'package:texa_core/core/theme/app_color_extension.dart';
import 'package:texa_core/core/theme/app_sizes.dart';
import 'package:texa_core/core/theme/app_typography.dart';

class ThemeSelectionPanel extends StatelessWidget {
  final AppColorExtension colors;
  final AppThemeMode currentMode;
  final Function(AppThemeMode) onSelected;

  const ThemeSelectionPanel({
    super.key,
    required this.colors,
    required this.currentMode,
    required this.onSelected,
  });

  @override
  Widget build(BuildContext context) {
    final options = ThemeOptions.getOptions(context);

    return Row(
      children: options.map((option) {
        final isSelected = option.mode == currentMode;

        return Expanded(
          child: Padding(
            padding: AppSizes.extraSmall.horizontalPadding,
            child: InkWell(
              onTap: () => onSelected(option.mode),
              borderRadius: BorderRadius.circular(12),
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                height: 44,
                decoration: BoxDecoration(
                  color: isSelected ? colors.accent : colors.surfaceVariant,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      option.icon,
                      size: 18,
                      color: isSelected ? Colors.white : colors.textPrimary,
                    ),
                    AppSizes.small.horizontalBox,
                    Text(
                      option.label,
                      style: AppTypography.bodySmallBold.copyWith(
                        color: isSelected ? Colors.white : colors.textPrimary,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      }).toList(),
    );
  }
}
