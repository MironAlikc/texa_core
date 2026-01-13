import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:texa_core/core/extensions/theme_ext.dart';
import 'package:texa_core/core/l10n/gen/app_localizations.dart';
import 'package:texa_core/core/navigation/routes_provider.dart';
import 'package:texa_core/core/theme/app_sizes.dart';
import 'package:texa_core/core/theme/app_typography.dart';
import 'package:texa_core/core/widgets/nav_bars/app_navigation_destination.dart';

class DriverNavBar extends StatelessWidget {
  const DriverNavBar({super.key});

  int _calculateSelectedIndex(BuildContext context) {
    final String location = GoRouterState.of(context).uri.path;

    if (location.startsWith('/deliveryPoint')) return 1;
    if (location.startsWith('/delivery')) return 0;
    if (location.startsWith('/returns')) return 2;
    if (location.startsWith('/profile')) return 3;
    return 0;
  }

  void _onItemTapped(BuildContext context, int index) {
    switch (index) {
      case 0:
        context.goToDelivery();
        break;
      case 1:
        context.goToDeliveryPoint();
        break;
      case 2:
        context.goToReturns();
        break;
      case 3:
        context.goToProfile();
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    final colors = context.color;

    final selectedIndex = _calculateSelectedIndex(context);
    final localizations = AppLocalizations.of(context);

    return Container(
      color: colors.navBackground,
      padding: AppSizes.small.horizontalPadding,
      child: NavigationBar(
        backgroundColor: colors.navBackground,
        indicatorColor: colors.navActiveItem.withValues(alpha: 0.1),
        surfaceTintColor: Colors.transparent,
        labelTextStyle: WidgetStateProperty.resolveWith((states) {
          final isSelected = states.contains(WidgetState.selected);
          return AppTypography.label.copyWith(
            color: isSelected ? colors.navActiveItem : colors.navInactiveItem,
            overflow: TextOverflow.ellipsis,
          );
        }),
        selectedIndex: selectedIndex,
        onDestinationSelected: (index) => _onItemTapped(context, index),
        destinations: [
          AppNavigationDestination(
            icon: LucideIcons.truck,
            activeIcon: LucideIcons.gauge,
            label: localizations.delivery,
            isSelected: selectedIndex == 0,
          ),
          AppNavigationDestination(
            icon: LucideIcons.mapPin,
            activeIcon: LucideIcons.navigation,
            label: localizations.deliveryPoint,
            isSelected: selectedIndex == 1,
          ),
          AppNavigationDestination(
            icon: LucideIcons.undo2,
            activeIcon: LucideIcons.packageCheck,
            label: localizations.returns,
            isSelected: selectedIndex == 2,
          ),
          AppNavigationDestination(
            icon: LucideIcons.contact2,
            activeIcon: LucideIcons.badgeCheck,
            label: localizations.profile,
            isSelected: selectedIndex == 3,
          ),
        ],
      ),
    );
  }
}
