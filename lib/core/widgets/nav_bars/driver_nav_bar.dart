import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:texa_core/core/l10n/gen/app_localizations.dart';
import 'package:texa_core/core/navigation/routes_provider.dart';

class DriverNavBar extends StatelessWidget {
  const DriverNavBar({super.key});

  int _calculateSelectedIndex(BuildContext context) {
    final String location = GoRouterState.of(context).uri.path;

    if (location.startsWith(AppRoutes.delivery)) return 0;
    if (location.startsWith(AppRoutes.deliveryPoint)) return 1;
    if (location.startsWith(AppRoutes.returns)) return 2;
    if (location.startsWith(AppRoutes.profile)) return 3;

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
    final selectedIndex = _calculateSelectedIndex(context);
    final localizatons = AppLocalizations.of(context);

    return NavigationBar(
      selectedIndex: selectedIndex,
      onDestinationSelected: (index) => _onItemTapped(context, index),
      destinations: [
        NavigationDestination(
          icon: Icon(Icons.home_outlined),
          selectedIcon: Icon(Icons.home),
          label: localizatons.delivery,
        ),
        NavigationDestination(
          icon: Icon(Icons.search_outlined),
          selectedIcon: Icon(Icons.search),
          label: localizatons.deliveryPoint,
        ),
        NavigationDestination(
          icon: Icon(Icons.favorite_outline),
          selectedIcon: Icon(Icons.favorite),
          label: localizatons.returns,
        ),
        NavigationDestination(
          icon: Icon(Icons.person_outline),
          selectedIcon: Icon(Icons.person),
          label: localizatons.profile,
        ),
      ],
    );
  }
}
