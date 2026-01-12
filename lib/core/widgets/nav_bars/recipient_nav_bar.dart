import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:texa_core/core/extensions/theme_ext.dart';
import 'package:texa_core/core/l10n/gen/app_localizations.dart';
import 'package:texa_core/core/navigation/routes_provider.dart';
import 'package:texa_core/core/theme/app_typography.dart';
import 'package:texa_core/core/widgets/nav_bars/app_navigation_destination.dart';

class RecipientNavBar extends StatelessWidget {
  const RecipientNavBar({super.key});

  int _calculateSelectedIndex(BuildContext context) {
    final String location = GoRouterState.of(context).uri.path;

    if (location.startsWith('/receiving')) return 0;
    if (location.startsWith('/loading')) return 1;
    if (location.startsWith('/materials')) return 2;
    if (location.startsWith('/stock')) return 3;
    if (location.startsWith('/recipientProfile')) return 4;
    return 0;
  }

  void _onItemTapped(BuildContext context, int index) {
    switch (index) {
      case 0:
        context.goToReceiving();
        break;
      case 1:
        context.goToLoading();
        break;
      case 2:
        context.goToMaterials();
        break;
      case 3:
        context.goToStock();
        break;
      case 4:
        context.goToRecipientProfile();
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    final colors = context.color;

    final selectedIndex = _calculateSelectedIndex(context);
    final localizatons = AppLocalizations.of(context);

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
          label: localizatons.receiving,
          isSelected: selectedIndex == 0,
        ),
        AppNavigationDestination(
          icon: Icons.search_outlined,
          activeIcon: Icons.search,
          label: localizatons.loading,
          isSelected: selectedIndex == 1,
        ),
        AppNavigationDestination(
          icon: Icons.favorite_outline,
          activeIcon: Icons.favorite,
          label: localizatons.materials,
          isSelected: selectedIndex == 2,
        ),
        AppNavigationDestination(
          icon: Icons.person_outline,
          activeIcon: Icons.person,
          label: localizatons.stock,
          isSelected: selectedIndex == 3,
        ),
        AppNavigationDestination(
          icon: Icons.person_outline,
          activeIcon: Icons.person,
          label: localizatons.profile,
          isSelected: selectedIndex == 4,
        ),
      ],
    );
  }
}
