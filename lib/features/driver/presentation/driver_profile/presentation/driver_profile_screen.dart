import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:texa_core/core/extensions/theme_ext.dart';
import 'package:texa_core/core/l10n/gen/app_localizations.dart';
import 'package:texa_core/core/theme/app_sizes.dart';
import 'package:texa_core/core/theme/app_typography.dart';
import 'package:texa_core/core/widgets/buttons/app_switch.dart';
import 'package:texa_core/core/widgets/icons/icon_container.dart';
import 'package:texa_core/features/driver/presentation/driver_profile/presentation/components/driver_stats_grid.dart';
import 'package:texa_core/features/driver/presentation/driver_profile/presentation/components/driver_status_card.dart';
import 'package:texa_core/features/driver/presentation/driver_profile/presentation/components/profile_section.dart';

class DriverProfileScreen extends StatefulWidget {
  const DriverProfileScreen({super.key});

  @override
  State<DriverProfileScreen> createState() => _DriverProfileScreenState();
}

class _DriverProfileScreenState extends State<DriverProfileScreen> {
  bool isGpsEnabled = true;

  @override
  Widget build(BuildContext context) {
    final colors = context.color;
    final localizations = AppLocalizations.of(context);

    return Scaffold(
      backgroundColor: colors.background,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: colors.surface,
        elevation: 0,
        scrolledUnderElevation: 0,
        centerTitle: false,
        titleSpacing: AppSizes.medium,
        title: Text(
          localizations.profile,
          style: AppTypography.h2.copyWith(color: colors.textPrimary),
        ),

        // actions: [
        //   Padding(
        //     padding: AppSizes.medium.rightPadding,
        //     child: IconButton(
        //       onPressed: () {},
        //       icon: Icon(
        //         Icons.notifications_none_rounded,
        //         color: colors.textPrimary,
        //       ),
        //     ),
        //   ),
        // ],
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(1.0),
          child: Container(color: colors.borderLight, height: 1.0),
        ),
      ),

      body: ListView(
        padding: const EdgeInsets.all(AppSizes.medium),
        children: [
          AppSizes.small.verticalBox,
          _buildHeader('Profile', colors),

          DriverStatusCard(),

          AppSizes.large.verticalBox,

          DriverStatsGrid(),

          AppSizes.large.verticalBox,

          ProfileSection(
            colors: colors,
            children: [
              _ProfileTile(
                icon: LucideIcons.locateFixed,
                title: localizations.gpsTracking,
                subtitle: isGpsEnabled
                    ? localizations.gpsIsOn
                    : localizations.gpsIsOff,
                iconColor: isGpsEnabled ? colors.success : colors.textTertiary,
                trailing: AppSwitch(
                  value: isGpsEnabled,
                  onChanged: (bool value) {
                    setState(() {
                      isGpsEnabled = value;
                    });
                  },
                ),
                showDivider: false,
                colors: colors,
              ),
            ],
          ),

          AppSizes.large.verticalBox,

          _buildHeader(localizations.appearance, colors),
          ProfileSection(
            colors: colors,
            children: [
              _ProfileTile(
                icon: Icons.dark_mode_outlined,
                title: 'Dark Mode',
                trailing: Switch.adaptive(value: false, onChanged: (v) {}),
                colors: colors,
              ),
              _ProfileTile(
                icon: Icons.language_outlined,
                title: 'Language',
                subtitle: 'English',
                onTap: () {},
                colors: colors,
              ),
            ],
          ),

          const SizedBox(height: AppSizes.large),

          _buildHeader(localizations.security, colors),
          ProfileSection(
            colors: colors,
            children: [
              _ProfileTile(
                icon: Icons.lock_outline_rounded,
                title: 'Change Password',
                onTap: () {},
                colors: colors,
              ),
              _ProfileTile(
                icon: Icons.fingerprint_rounded,
                title: 'Biometrics',
                trailing: Switch.adaptive(value: true, onChanged: (v) {}),
                colors: colors,
                showDivider: false,
              ),
            ],
          ),

          const SizedBox(height: AppSizes.large),

          _buildHeader(localizations.support, colors),
          ProfileSection(
            colors: colors,
            children: [
              _ProfileTile(
                icon: Icons.help_outline_rounded,
                title: 'Help Center',
                onTap: () {},
                colors: colors,
              ),
              _ProfileTile(
                icon: Icons.info_outline_rounded,
                title: 'About App',
                onTap: () {},
                colors: colors,
              ),
              _ProfileTile(
                icon: Icons.logout_rounded,
                title: 'Logout',
                titleColor: Colors.redAccent,
                iconColor: Colors.redAccent,
                hideChevron: true,
                showDivider: false,
                onTap: () {},
                colors: colors,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildHeader(String title, dynamic colors) {
    return Padding(
      padding: const EdgeInsets.only(
        left: AppSizes.small,
        bottom: AppSizes.small,
      ),
      child: Text(
        title.toUpperCase(),
        style: AppTypography.bodySmallBold.copyWith(
          color: colors.textSecondary,
        ),
      ),
    );
  }
}

class _ProfileTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final String? subtitle;
  final Widget? trailing;
  final VoidCallback? onTap;
  final Color? titleColor;
  final Color? iconColor;
  final bool hideChevron;
  final bool showDivider;
  final dynamic colors;

  const _ProfileTile({
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
  });

  @override
  Widget build(BuildContext context) {
    final effectiveIconColor = iconColor ?? colors.accent;
    final effectiveBgColor = effectiveIconColor.withOpacity(0.1);

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
            ),
          ),
          subtitle: subtitle != null
              ? Text(
                  subtitle!,
                  style: AppTypography.bodySmall.copyWith(
                    color: iconColor ?? colors.textSecondary,
                  ),
                )
              : null,
          trailing:
              trailing ??
              (hideChevron ? null : const Icon(Icons.chevron_right_rounded)),
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
