import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:texa_core/core/l10n/gen/app_localizations.dart';
import 'package:texa_core/core/navigation/routes_provider.dart';

class ManagerNavBar extends StatelessWidget {
  const ManagerNavBar({super.key});

  int _calculateSelectedIndex(BuildContext context) {
    final String location = GoRouterState.of(context).uri.path;

    if (location.startsWith(AppRoutes.accounting)) return 0;
    if (location.startsWith(AppRoutes.warehouse)) return 1;
    if (location.startsWith(AppRoutes.sales)) return 2;
    if (location.startsWith(AppRoutes.aiAssistant)) return 3;
    if (location.startsWith(AppRoutes.managerSettings)) return 4;
    if (location.startsWith(AppRoutes.tracking)) return 5;

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
    final selectedIndex = _calculateSelectedIndex(context);
    final localizatons = AppLocalizations.of(context);

    return NavigationBar(
      selectedIndex: selectedIndex,
      onDestinationSelected: (index) => _onItemTapped(context, index),
      destinations: [
        NavigationDestination(
          icon: Icon(Icons.home_outlined),
          selectedIcon: Icon(Icons.home),
          label: localizatons.accounting,
        ),
        NavigationDestination(
          icon: Icon(Icons.search_outlined),
          selectedIcon: Icon(Icons.search),
          label: localizatons.warehouse,
        ),
        NavigationDestination(
          icon: Icon(Icons.favorite_outline),
          selectedIcon: Icon(Icons.favorite),
          label: localizatons.sales,
        ),
        NavigationDestination(
          icon: Icon(Icons.person_outline),
          selectedIcon: Icon(Icons.person),
          label: localizatons.aiAssistant,
        ),
        NavigationDestination(
          icon: Icon(Icons.person_outline),
          selectedIcon: Icon(Icons.person),
          label: localizatons.settings,
        ),
        NavigationDestination(
          icon: Icon(Icons.person_outline),
          selectedIcon: Icon(Icons.person),
          label: localizatons.tracking,
        ),
      ],
    );
  }
}
