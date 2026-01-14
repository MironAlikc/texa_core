import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:texa_core/core/theme/app_color_extension.dart';
import 'package:texa_core/core/theme/app_sizes.dart';
import 'package:texa_core/core/theme/app_typography.dart';
import 'package:texa_core/core/widgets/buttons/app_text_button.dart';
import 'package:texa_core/core/widgets/icons/icon_container.dart';

class ProfileTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final String? subtitle;
  final Widget? trailing;
  final VoidCallback? onTap;
  final Color? titleColor;
  final Color? iconColor;
  final bool hideChevron;
  final bool showDivider;
  final AppColorExtension colors;
  final bool isEdit;
  final String editText;

  const ProfileTile({
    super.key,
    required this.icon,
    required this.title,
    required this.colors,
    this.subtitle,
    this.trailing,
    this.onTap,
    this.titleColor,
    this.iconColor,
    this.hideChevron = false,
    this.showDivider = true,
    this.isEdit = false,
    this.editText = '',
  });

  @override
  Widget build(BuildContext context) {
    final effectiveIconColor = iconColor ?? colors.accent;
    final effectiveBgColor = effectiveIconColor.withValues(alpha: 0.1);

    return Column(
      children: [
        ListTile(
          onTap: onTap,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppSizes.medium),
          ),
          leading: AppIconContainer(
            icon: icon,
            iconColor: effectiveIconColor,
            backgroundColor: effectiveBgColor,
            borderRadius: 10,
          ),
          title: Text(
            title,
            style: AppTypography.bodyMedium.copyWith(
              color: titleColor ?? colors.textPrimary,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          subtitle: subtitle != null
              ? Text(
                  subtitle!,
                  style: AppTypography.bodySmall.copyWith(
                    color: iconColor ?? colors.textSecondary,
                    overflow: TextOverflow.ellipsis,
                  ),
                )
              : null,
          trailing: isEdit
              ? AppTextButton(
                  title: editText,
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  foregroundColor: colors.accent,
                  onPressed: onTap ?? () {},
                )
              : (trailing ??
                    (hideChevron
                        ? null
                        : Icon(
                            LucideIcons.chevronRight,
                            color: colors.textPrimary,
                            size: AppSizes.medium,
                          ))),
        ),
        if (showDivider)
          Divider(
            indent: 56,
            endIndent: 16,
            height: 1,
            color: colors.borderLight,
          ),
      ],
    );
  }
}
