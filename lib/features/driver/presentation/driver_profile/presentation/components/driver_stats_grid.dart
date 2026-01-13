import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:texa_core/core/extensions/theme_ext.dart';
import 'package:texa_core/core/l10n/gen/app_localizations.dart';
import 'package:texa_core/core/theme/app_color_extension.dart';
import 'package:texa_core/core/theme/app_sizes.dart';
import 'package:texa_core/core/theme/app_typography.dart';
import 'package:texa_core/core/widgets/badges/icon_badge.dart';

class DriverStatsGrid extends StatelessWidget {
  const DriverStatsGrid({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = context.color;
    final localizations = AppLocalizations.of(context);

    return GridView.count(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      crossAxisCount: 2,
      crossAxisSpacing: AppSizes.small,
      mainAxisSpacing: AppSizes.small,
      childAspectRatio: 1.4,
      children: [
        _buildStatCard(
          '3',
          localizations.deliveriesToday,
          LucideIcons.package,
          colors.success,
          colors,
        ),
        _buildStatCard(
          '0 ч',
          localizations.activityHours,
          LucideIcons.clock,
          colors.warning,
          colors,
        ),
        _buildStatCard(
          '0',
          localizations.delivered,
          LucideIcons.checkCircle2,
          colors.success,
          colors,
        ),
        _buildStatCard(
          '0',
          localizations.failed,
          LucideIcons.alertCircle,
          colors.error,
          colors,
        ),
      ],
    );
  }

  Widget _buildStatCard(
    String value,
    String label,
    IconData icon,
    Color iconColor,
    AppColorExtension colors,
  ) {
    return Container(
      padding: const EdgeInsets.all(AppSizes.medium),
      decoration: BoxDecoration(
        color: colors.surface,
        borderRadius: BorderRadius.circular(AppSizes.medium),
        border: Border.all(color: colors.borderLight),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          IconBadge(icon: icon, color: iconColor),
          const SizedBox(height: 4),
          Text(
            value,
            style: AppTypography.h3.copyWith(color: colors.textPrimary),
          ),
          Text(
            label,
            textAlign: TextAlign.center,
            style: AppTypography.caption.copyWith(color: colors.textSecondary),
          ),
        ],
      ),
    );
  }
}
