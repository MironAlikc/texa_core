import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:texa_core/core/l10n/gen/app_localizations.dart';
import 'package:texa_core/core/navigation/routes_provider.dart';

class RecipientNavBar extends StatelessWidget {
  const RecipientNavBar({super.key});

  int _calculateSelectedIndex(BuildContext context) {
    final String location = GoRouterState.of(context).uri.path;

    if (location.startsWith(AppRoutes.receiving)) return 0;
    if (location.startsWith(AppRoutes.loading)) return 1;
    if (location.startsWith(AppRoutes.materials)) return 2;
    if (location.startsWith(AppRoutes.stock)) return 3;
    if (location.startsWith(AppRoutes.recipientProfile)) return 4;
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
    final selectedIndex = _calculateSelectedIndex(context);
    final localizatons = AppLocalizations.of(context);

    return NavigationBar(
      selectedIndex: selectedIndex,
      onDestinationSelected: (index) => _onItemTapped(context, index),
      destinations: [
        NavigationDestination(
          icon: Icon(Icons.home_outlined),
          selectedIcon: Icon(Icons.home),
          label: localizatons.receiving,
        ),
        NavigationDestination(
          icon: Icon(Icons.search_outlined),
          selectedIcon: Icon(Icons.search),
          label: localizatons.loading,
        ),
        NavigationDestination(
          icon: Icon(Icons.favorite_outline),
          selectedIcon: Icon(Icons.favorite),
          label: localizatons.materials,
        ),
        NavigationDestination(
          icon: Icon(Icons.person_outline),
          selectedIcon: Icon(Icons.person),
          label: localizatons.stock,
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
