import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:texa_core/core/extensions/theme_ext.dart';
import 'package:texa_core/core/l10n/gen/app_localizations.dart';
import 'package:texa_core/core/navigation/routes_provider.dart';
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

    return NavigationBar(
      backgroundColor: colors.navBackground,
      indicatorColor: colors.navActiveItem.withValues(alpha: 0.1),
      surfaceTintColor: Colors.transparent,
      labelTextStyle: WidgetStateProperty.resolveWith((states) {
        final isSelected = states.contains(WidgetState.selected);
        return AppTypography.label.copyWith(
          color: isSelected ? colors.navActiveItem : colors.navInactiveItem,
        );
      }),
      selectedIndex: selectedIndex,
      onDestinationSelected: (index) => _onItemTapped(context, index),
      destinations: [
        AppNavigationDestination(
          icon: Icons.home_outlined,
          activeIcon: Icons.home,
          label: localizations.delivery,
          isSelected: selectedIndex == 0,
        ),
        AppNavigationDestination(
          icon: Icons.search_outlined,
          activeIcon: Icons.search,
          label: localizations.deliveryPoint,
          isSelected: selectedIndex == 1,
        ),
        AppNavigationDestination(
          icon: Icons.favorite_outline,
          activeIcon: Icons.favorite,
          label: localizations.returns,
          isSelected: selectedIndex == 2,
        ),
        AppNavigationDestination(
          icon: Icons.person_outline,
          activeIcon: Icons.person,
          label: localizations.profile,
          isSelected: selectedIndex == 3,
        ),
      ],
    );
  }
}
