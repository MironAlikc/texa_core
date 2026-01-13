import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:texa_core/core/extensions/theme_ext.dart';
import 'package:texa_core/core/l10n/gen/app_localizations.dart';
import 'package:texa_core/core/theme/app_sizes.dart';
import 'package:texa_core/core/theme/app_typography.dart';
import 'package:texa_core/core/widgets/avatar/user_avatar.dart';
import 'package:texa_core/core/widgets/buttons/primary_button.dart';
import 'package:texa_core/features/driver/presentation/driver_profile/presentation/components/profile_section.dart';

class DriverStatusCard extends StatefulWidget {
  const DriverStatusCard({super.key});

  @override
  State<DriverStatusCard> createState() => _DriverStatusCardState();
}

class _DriverStatusCardState extends State<DriverStatusCard> {
  bool isShiftStarted = false;
  String? shiftStartTime;

  void toggleShift() {
    setState(() {
      isShiftStarted = !isShiftStarted;

      if (isShiftStarted) {
        final now = TimeOfDay.now();
        shiftStartTime = _formatTime(now);

        // HERE: Launching the tracker
        // _locationService.startTracking();
      } else {
        shiftStartTime = null;

        // HERE: Tracker stop
        // _locationService.stopTracking();
      }
    });
  }

  String _formatTime(TimeOfDay time) {
    final hour = time.hour.toString().padLeft(2, '0');
    final minute = time.minute.toString().padLeft(2, '0');
    return '$hour:$minute';
  }

  @override
  Widget build(BuildContext context) {
    final colors = context.color;
    final localizations = AppLocalizations.of(context);

    return ProfileSection(
      colors: colors,
      children: [
        Padding(
          padding: const EdgeInsets.all(AppSizes.medium),
          child: Column(
            children: [
              Row(
                children: [
                  UserAvatar(imageUrl: null, color: colors.borderLight),
                  AppSizes.mediumLarge.horizontalBox,
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        localizations.deliveryDriver,
                        style: AppTypography.h3.copyWith(
                          color: colors.textPrimary,
                        ),
                      ),
                      Row(
                        children: [
                          Container(
                            width: AppSizes.small,
                            height: AppSizes.small,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: isShiftStarted
                                  ? colors.success
                                  : colors.textDisabled,
                            ),
                          ),
                          AppSizes.tiny.horizontalBox,
                          Text(
                            isShiftStarted
                                ? localizations.onDuty
                                : localizations.offDuty,
                            style: AppTypography.bodySmall.copyWith(
                              color: isShiftStarted
                                  ? colors.success
                                  : colors.textSecondary,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
              AppSizes.medium.verticalBox,
              PrimaryButton(
                title: isShiftStarted
                    ? localizations.endShift
                    : localizations.startShift,
                backgroundColor: isShiftStarted ? colors.error : colors.primary,
                icon: isShiftStarted ? LucideIcons.logOut : LucideIcons.logIn,
                onPressed: toggleShift,
              ),
              if (isShiftStarted) ...[
                AppSizes.small.verticalBox,
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      LucideIcons.clock,
                      size: 14,
                      color: colors.textSecondary,
                    ),
                    const SizedBox(width: 4),
                    Text(
                      localizations.startedAt('$shiftStartTime'),
                      style: AppTypography.bodySmall.copyWith(
                        color: colors.textSecondary,
                      ),
                    ),
                  ],
                ),
              ],
            ],
          ),
        ),
      ],
    );
  }
}
