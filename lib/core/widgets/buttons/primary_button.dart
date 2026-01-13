import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:texa_core/core/extensions/theme_ext.dart';
import 'package:texa_core/core/theme/app_sizes.dart';
import 'package:texa_core/core/theme/app_typography.dart';

class PrimaryButton extends StatelessWidget {
  final String title;
  final VoidCallback? onPressed;
  final bool isLoading;
  final bool isEnabled;
  final IconData? icon;
  final Color? backgroundColor;
  final Color? foregroundColor;
  final double? width;
  final double height;

  const PrimaryButton({
    super.key,
    required this.title,
    this.onPressed,
    this.isLoading = false,
    this.isEnabled = true,
    this.icon,
    this.backgroundColor,
    this.foregroundColor,
    this.width = double.infinity,
    this.height = 54,
  });

  @override
  Widget build(BuildContext context) {
    final colors = context.color;

    final bool effectivelyDisabled = !isEnabled || isLoading;

    final finalBgColor = backgroundColor ?? colors.primary;
    final finalFgColor =
        foregroundColor ??
        (backgroundColor == null ? colors.onPrimary : Colors.white);

    return SizedBox(
      width: width,
      height: height,
      child: ElevatedButton(
        onPressed: effectivelyDisabled
            ? null
            : () {
                HapticFeedback.lightImpact();
                onPressed?.call();
              },
        style:
            ElevatedButton.styleFrom(
              backgroundColor: finalBgColor,
              foregroundColor: finalFgColor,
              disabledBackgroundColor: colors.textDisabled.withValues(
                alpha: 0.12,
              ),
              disabledForegroundColor: colors.textDisabled,
              elevation: 0,
              shadowColor: Colors.transparent,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(AppSizes.medium),
              ),
            ).copyWith(
              overlayColor: WidgetStateProperty.resolveWith((states) {
                if (states.contains(WidgetState.pressed)) {
                  return finalFgColor.withValues(alpha: 0.1);
                }
                return null;
              }),
            ),
        child: isLoading
            ? _buildLoadingIndicator(finalFgColor)
            : _buildContent(finalFgColor),
      ),
    );
  }

  Widget _buildContent(Color color) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        if (icon != null) ...[
          Icon(icon, size: AppSizes.mediumLarge, color: color),
          const SizedBox(width: AppSizes.small),
        ],
        Text(title, style: AppTypography.bodyMediumBold.copyWith(color: color)),
      ],
    );
  }

  Widget _buildLoadingIndicator(Color color) {
    return SizedBox(
      width: AppSizes.large,
      height: AppSizes.large,
      child: CircularProgressIndicator(
        strokeWidth: 2.5,
        valueColor: AlwaysStoppedAnimation<Color>(color),
      ),
    );
  }
}
