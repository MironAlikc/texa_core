import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:texa_core/core/extensions/theme_ext.dart';
import 'package:texa_core/core/l10n/gen/app_localizations.dart';
import 'package:texa_core/core/l10n/locale_cubit/locale_cubit.dart';
import 'package:texa_core/core/models/language.dart';
import 'package:texa_core/core/models/theme_option.dart';
import 'package:texa_core/core/theme/app_sizes.dart';
import 'package:texa_core/core/theme/app_typography.dart';
import 'package:texa_core/core/theme/theme_cubit/theme_cubit.dart';
import 'package:texa_core/core/widgets/buttons/app_switch.dart';
import 'package:texa_core/core/widgets/buttons/primary_button.dart';
import 'package:texa_core/features/driver/presentation/driver_profile/presentation/components/driver_stats_grid.dart';
import 'package:texa_core/features/driver/presentation/driver_profile/presentation/components/driver_status_card.dart';
import 'package:texa_core/features/driver/presentation/driver_profile/presentation/components/language_selection_panel.dart';
import 'package:texa_core/features/driver/presentation/driver_profile/presentation/components/profile_section.dart';
import 'package:texa_core/features/driver/presentation/driver_profile/presentation/components/profile_tile.dart';
import 'package:texa_core/features/driver/presentation/driver_profile/presentation/components/theme_selection_panel.dart';

class DriverProfileScreen extends StatefulWidget {
  const DriverProfileScreen({super.key});

  @override
  State<DriverProfileScreen> createState() => _DriverProfileScreenState();
}

class _DriverProfileScreenState extends State<DriverProfileScreen> {
  bool isGpsEnabled = true;
  bool isNotificationsEnabled = true;
  bool isBiometryEnabled = true;
  bool isTwoFactorAuthenticationEnabled = true;
  bool isLanguageEditing = false;
  String currentLanguageCode = 'ru';
  bool isThemeEditing = false;

  String _getLanguageName(String code) {
    final language = languages.firstWhere(
      (lang) => lang.code == code,
      orElse: () => languages.first,
    );

    return '${language.flag} ${language.name}';
  }

  ThemeOption _getThemeInfo(BuildContext context, AppThemeMode mode) {
    final options = ThemeOptions.getOptions(context);
    return options.firstWhere(
      (opt) => opt.mode == mode,
      orElse: () => options.first,
    );
  }

  @override
  Widget build(BuildContext context) {
    final colors = context.color;
    final localizations = AppLocalizations.of(context);

    final themeMode = context.watch<ThemeCubit>().state;
    final currentAppMode = mapToAppThemeMode(themeMode);
    final currentThemeInfo = _getThemeInfo(context, currentAppMode);

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

          _buildHeader(localizations.profile, colors),

          DriverStatusCard(),

          AppSizes.large.verticalBox,

          DriverStatsGrid(),

          AppSizes.large.verticalBox,

          ProfileSection(
            colors: colors,
            children: [
              ProfileTile(
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

          BlocBuilder<LocaleCubit, Locale>(
            builder: (context, localeState) {
              return ProfileSection(
                colors: colors,
                children: [
                  ProfileTile(
                    icon: LucideIcons.languages,
                    title: localizations.language,
                    subtitle: isLanguageEditing
                        ? null
                        : _getLanguageName(localeState.languageCode),
                    colors: colors,
                    showDivider: !isLanguageEditing,
                    isEdit: true,
                    editText: isLanguageEditing
                        ? localizations.close
                        : localizations.edit,
                    onTap: () {
                      setState(() {
                        isLanguageEditing = !isLanguageEditing;
                      });
                    },
                  ),
                  if (isLanguageEditing)
                    Padding(
                      padding: AppSizes.medium.allPadding,
                      child: LanguageSelectionPanel(
                        colors: colors,
                        selectedCode: currentLanguageCode,
                        onLanguageSelected: (lang) {
                          setState(() {
                            currentLanguageCode = lang.code;
                            isLanguageEditing = false;
                          });
                        },
                      ),
                    ),

                  ProfileTile(
                    icon: currentThemeInfo.icon,
                    title: localizations.theme,
                    subtitle: isThemeEditing ? null : currentThemeInfo.label,
                    colors: colors,
                    isEdit: true,
                    editText: isThemeEditing
                        ? localizations.close
                        : localizations.edit,
                    onTap: () =>
                        setState(() => isThemeEditing = !isThemeEditing),
                  ),
                  AnimatedSize(
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeInOut,
                    child: isThemeEditing
                        ? Padding(
                            padding: const EdgeInsets.fromLTRB(12, 0, 12, 16),
                            child: ThemeSelectionPanel(
                              colors: colors,
                              currentMode: currentAppMode,
                              onSelected: (AppThemeMode newMode) {
                                context.read<ThemeCubit>().setTheme(
                                  mapToThemeMode(newMode),
                                );
                                setState(() => isThemeEditing = false);
                              },
                            ),
                          )
                        : const SizedBox(width: double.infinity, height: 0),
                  ),

                  ProfileTile(
                    icon: LucideIcons.bell,
                    iconColor: isNotificationsEnabled
                        ? colors.accent
                        : colors.textTertiary,
                    title: localizations.notifications,
                    subtitle: isNotificationsEnabled
                        ? localizations.enabled
                        : localizations.disabled,
                    trailing: AppSwitch(
                      value: isNotificationsEnabled,
                      onChanged: (bool value) {
                        setState(() {
                          isNotificationsEnabled = value;
                        });
                      },
                    ),
                    onTap: () {},
                    colors: colors,
                  ),
                ],
              );
            },
          ),

          const SizedBox(height: AppSizes.large),

          _buildHeader(localizations.security, colors),

          ProfileSection(
            colors: colors,
            children: [
              ProfileTile(
                icon: LucideIcons.fingerprint,
                iconColor: isBiometryEnabled
                    ? colors.accent
                    : colors.textTertiary,
                title: localizations.biometricEntry,
                subtitle: localizations.biometricDescription,
                colors: colors,
                trailing: AppSwitch(
                  value: isBiometryEnabled,
                  onChanged: (bool value) {
                    setState(() {
                      isBiometryEnabled = value;
                    });
                  },
                ),
              ),
              ProfileTile(
                icon: LucideIcons.shieldCheck,
                iconColor: isTwoFactorAuthenticationEnabled
                    ? colors.accent
                    : colors.textTertiary,
                title: localizations.twoFactorAuthentication,
                subtitle: localizations.twoFactorDescription,
                onTap: () {},
                colors: colors,
                showDivider: false,
                trailing: AppSwitch(
                  value: isTwoFactorAuthenticationEnabled,
                  onChanged: (bool value) {
                    setState(() {
                      isTwoFactorAuthenticationEnabled = value;
                    });
                  },
                ),
              ),
            ],
          ),

          AppSizes.large.verticalBox,

          _buildHeader(localizations.support, colors),

          ProfileSection(
            colors: colors,
            children: [
              ProfileTile(
                icon: LucideIcons.helpCircle,
                title: localizations.helpCenter,
                onTap: () {},
                colors: colors,
              ),
              ProfileTile(
                icon: LucideIcons.info,
                title: localizations.aboutApp,
                onTap: () {},
                colors: colors,
                showDivider: false,
              ),
            ],
          ),

          AppSizes.large.verticalBox,

          PrimaryButton(
            title: localizations.exitDriverMode,
            icon: LucideIcons.logOut,
            foregroundColor: colors.error,
            backgroundColor: colors.error.withValues(alpha: 0.12),
          ),

          AppSizes.extraLarge.verticalBox,
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
