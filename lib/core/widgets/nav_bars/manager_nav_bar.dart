import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:texa_core/core/extensions/theme_ext.dart';
import 'package:texa_core/core/l10n/gen/app_localizations.dart';
import 'package:texa_core/core/navigation/routes_provider.dart';
import 'package:texa_core/core/theme/app_sizes.dart';
import 'package:texa_core/core/theme/app_typography.dart';
import 'package:texa_core/core/widgets/nav_bars/app_navigation_destination.dart';

class ManagerNavBar extends StatelessWidget {
  const ManagerNavBar({super.key});

  int _calculateSelectedIndex(BuildContext context) {
    final String location = GoRouterState.of(context).uri.path;

    if (location.startsWith('/accounting')) return 0;
    if (location.startsWith('/warehouse')) return 1;
    if (location.startsWith('/sales')) return 2;
    if (location.startsWith('/aiAssistant')) return 3;
    if (location.startsWith('/managerSettings')) return 4;
    if (location.startsWith('/tracking')) return 5;

    return 0;
  }

  void _onItemTapped(BuildContext context, int index) {
    switch (index) {
      case 0:
        context.goToAccounting();
        break;
      case 1:
        context.goToWarehouse();
        break;
      case 2:
        context.goToSales();
        break;
      case 3:
        context.goToAIAssistant();
        break;
      case 4:
        context.goToManagerSettings();
        break;
      case 5:
        context.goToTracking();
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    final colors = context.color;

    final selectedIndex = _calculateSelectedIndex(context);
    final localizatons = AppLocalizations.of(context);

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
            icon: LucideIcons.calculator,
            activeIcon: LucideIcons.wallet,
            label: localizatons.accounting,
            isSelected: selectedIndex == 0,
          ),
          AppNavigationDestination(
            icon: LucideIcons.package,
            activeIcon: LucideIcons.boxes,
            label: localizatons.warehouse,
            isSelected: selectedIndex == 1,
          ),
          AppNavigationDestination(
            icon: LucideIcons.shoppingCart,
            activeIcon: LucideIcons.shoppingBag,
            label: localizatons.sales,
            isSelected: selectedIndex == 2,
          ),
          AppNavigationDestination(
            icon: LucideIcons.sparkles,
            activeIcon: LucideIcons.bot,
            label: localizatons.aiAssistant,
            isSelected: selectedIndex == 3,
          ),
          AppNavigationDestination(
            icon: LucideIcons.settings,
            activeIcon: LucideIcons.settings2,
            label: localizatons.settings,
            isSelected: selectedIndex == 4,
          ),
          AppNavigationDestination(
            icon: LucideIcons.truck,
            activeIcon: LucideIcons.mapPin,
            label: localizatons.tracking,
            isSelected: selectedIndex == 5,
          ),
        ],
      ),
    );
  }
}
