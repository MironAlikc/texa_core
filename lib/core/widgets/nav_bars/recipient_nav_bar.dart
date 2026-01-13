import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:texa_core/core/extensions/theme_ext.dart';
import 'package:texa_core/core/l10n/gen/app_localizations.dart';
import 'package:texa_core/core/navigation/routes_provider.dart';
import 'package:texa_core/core/theme/app_sizes.dart';
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
            icon: LucideIcons.download,
            activeIcon: LucideIcons.archiveRestore,
            label: localizatons.receiving,
            isSelected: selectedIndex == 0,
          ),
          AppNavigationDestination(
            icon: LucideIcons.upload,
            activeIcon: LucideIcons.truck,
            label: localizatons.loading,
            isSelected: selectedIndex == 1,
          ),
          AppNavigationDestination(
            icon: LucideIcons.component,
            activeIcon: LucideIcons.layers,
            label: localizatons.materials,
            isSelected: selectedIndex == 2,
          ),
          AppNavigationDestination(
            icon: LucideIcons.clipboardList,
            activeIcon: LucideIcons.barChart4,
            label: localizatons.stock,
            isSelected: selectedIndex == 3,
          ),
          AppNavigationDestination(
            icon: LucideIcons.user,
            activeIcon: LucideIcons.userCircle2,
            label: localizatons.profile,
            isSelected: selectedIndex == 4,
          ),
        ],
      ),
    );
  }
}
