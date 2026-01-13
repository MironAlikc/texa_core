import 'package:flutter/material.dart';
import 'package:texa_core/core/extensions/theme_ext.dart';
import 'package:texa_core/core/theme/app_sizes.dart';
import 'package:texa_core/core/theme/app_typography.dart';

class AppTextButton extends StatelessWidget {
  final String title;
  final VoidCallback onPressed;
  final Color? backgroundColor;
  final Color? foregroundColor;
  final double? width;
  final double height;
  final EdgeInsetsGeometry? padding;

  const AppTextButton({
    super.key,
    required this.title,
    required this.onPressed,
    this.backgroundColor,
    this.foregroundColor,
    this.width,
    this.height = 32,
    this.padding = const EdgeInsets.symmetric(horizontal: 12),
  });

  @override
  Widget build(BuildContext context) {
    final colors = context.color;

    final finalBgColor =
        backgroundColor ?? colors.accent.withValues(alpha: 0.1);
    final finalFgColor = foregroundColor ?? colors.accent;

    return SizedBox(
      width: width,
      height: height,
      child: TextButton(
        onPressed: onPressed,
        style:
            TextButton.styleFrom(
              backgroundColor: finalBgColor,
              foregroundColor: finalFgColor,
              padding: padding,
              minimumSize: Size.zero,
              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(AppSizes.small),
              ),
            ).copyWith(
              overlayColor: WidgetStateProperty.resolveWith((states) {
                if (states.contains(WidgetState.pressed)) {
                  return finalFgColor.withValues(alpha: 0.2);
                }
                return null;
              }),
            ),
        child: Text(
          title,
          style: AppTypography.bodySmallBold.copyWith(
            color: finalFgColor,
            letterSpacing: 0.2,
          ),
        ),
      ),
    );
  }
}
