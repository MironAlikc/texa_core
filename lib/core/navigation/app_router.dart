import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:texa_core/core/navigation/routes_provider.dart';
import 'package:texa_core/core/navigation/scaffold_with_nav_bar.dart';
import 'package:texa_core/features/delivery/delivery_screen.dart';
import 'package:texa_core/features/delivery_point/delivery_point_screen.dart';
import 'package:texa_core/features/profile/presentation/screens/settings_screen.dart';
import 'package:texa_core/features/profile/profile_screen.dart';
import 'package:texa_core/features/returns/returns_screen.dart';

class AppRouter {
  static final GlobalKey<NavigatorState> _rootNavigatorKey =
      GlobalKey<NavigatorState>(debugLabel: 'root');
  static final GlobalKey<NavigatorState> _shellNavigatorKey =
      GlobalKey<NavigatorState>(debugLabel: 'shell');

  static GoRouter router = GoRouter(
    navigatorKey: _rootNavigatorKey,
    initialLocation: '/delivery',
    debugLogDiagnostics: true,
    routes: [
      ShellRoute(
        navigatorKey: _shellNavigatorKey,
        builder: (context, state, child) {
          return ScaffoldWithNavBar(child: child);
        },
        routes: [
          GoRoute(
            path: '/delivery',
            name: AppRoutes.delivery,
            pageBuilder: (context, state) => NoTransitionPage(
              key: state.pageKey,
              child: const DeliveryScreen(),
            ),
          ),
          GoRoute(
            path: '/deliveryPoint',
            name: AppRoutes.deliveryPoint,
            pageBuilder: (context, state) => NoTransitionPage(
              key: state.pageKey,
              child: const DeliveryPointScreen(),
            ),
          ),
          GoRoute(
            path: '/returns',
            name: AppRoutes.returns,
            pageBuilder: (context, state) => NoTransitionPage(
              key: state.pageKey,
              child: const ReturnsScreen(),
            ),
          ),
          GoRoute(
            path: '/profile',
            name: AppRoutes.profile,
            pageBuilder: (context, state) => NoTransitionPage(
              key: state.pageKey,
              child: const ProfileScreen(),
            ),
            routes: [
              GoRoute(
                path: 'settings',
                name: AppRoutes.settings,
                builder: (context, state) => const SettingsScreen(),
              ),
            ],
          ),
        ],
      ),
    ],
  );
}
