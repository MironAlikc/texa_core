import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:injectable/injectable.dart';
import 'package:texa_core/core/navigation/routes_provider.dart';
import 'package:texa_core/core/navigation/scaffold_with_nav_bar.dart';
import 'package:texa_core/core/widgets/nav_bars/driver_nav_bar.dart';
import 'package:texa_core/core/widgets/nav_bars/manager_nav_bar.dart';
import 'package:texa_core/core/widgets/nav_bars/recipient_nav_bar.dart';
import 'package:texa_core/features/auth/fake_login/auth_cubit.dart';
import 'package:texa_core/features/auth/fake_login/go_router_refresh_stream.dart';
import 'package:texa_core/features/auth/fake_login/login_screen.dart';
import 'package:texa_core/features/driver/presentation/delivery/delivery_screen.dart';
import 'package:texa_core/features/driver/presentation/delivery_point/delivery_point_screen.dart';
import 'package:texa_core/features/driver/presentation/driver_profile/driver_profile_screen.dart';
import 'package:texa_core/features/driver/presentation/driver_profile/presentation/screens/settings_screen.dart';
import 'package:texa_core/features/driver/presentation/returns/returns_screen.dart';
import 'package:texa_core/features/manager/presentation/accounting/accounting_screen.dart';
import 'package:texa_core/features/manager/presentation/ai_assistant/ai_assistant_screen.dart';
import 'package:texa_core/features/manager/presentation/manager_settings/manager_settings_screen.dart';
import 'package:texa_core/features/manager/presentation/sales/sales_screen.dart';
import 'package:texa_core/features/manager/presentation/tracking/tracking_screen.dart';
import 'package:texa_core/features/manager/presentation/warehouse/warehouse_screen.dart';
import 'package:texa_core/features/recipient/presentation/loading/loading_screen.dart';
import 'package:texa_core/features/recipient/presentation/materials/materials_screen.dart';
import 'package:texa_core/features/recipient/presentation/receiving/receiving_screen.dart';
import 'package:texa_core/features/recipient/presentation/recipient_profile/recipient_profile_screen.dart';
import 'package:texa_core/features/recipient/presentation/stock/stock_screen.dart';

@lazySingleton
class AppRouter {
  final AuthCubit authCubit;

  AppRouter(this.authCubit);

  static final _rootKey = GlobalKey<NavigatorState>(debugLabel: 'root');

  static final _driverKey = GlobalKey<NavigatorState>(
    debugLabel: 'driverShell',
  );
  static final _recipientKey = GlobalKey<NavigatorState>(
    debugLabel: 'recipientShell',
  );
  static final _managerKey = GlobalKey<NavigatorState>(
    debugLabel: 'managerShell',
  );

  GoRouter get router => GoRouter(
    navigatorKey: _rootKey,
    refreshListenable: GoRouterRefreshStream(authCubit.stream),
    initialLocation: '/login',
    debugLogDiagnostics: true,

    redirect: (context, state) {
      final authState = authCubit.state;

      if (authState is AuthLoading) return null;

      final bool isLoggingIn = state.matchedLocation == '/login';

      if (authState is AuthUnauthenticated) {
        return isLoggingIn ? null : '/login';
      }

      if (authState is AuthAuthenticated) {
        if (isLoggingIn || state.matchedLocation == '/') {
          switch (authState.role) {
            case 'driver':
              return '/delivery';
            case 'recipient':
              return '/receiving';
            case 'manager':
              return '/accounting';
          }
        }
      }

      return null;
    },

    routes: [
      GoRoute(
        path: '/login',
        name: 'login',
        builder: (context, state) => const LoginScreen(),
      ),

      // Driver Shell Route
      ShellRoute(
        navigatorKey: _driverKey,
        builder: (context, state, child) {
          return ScaffoldWithNavBar(
            key: ValueKey(state.uri.path),
            navBar: DriverNavBar(),
            child: child,
          );
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
              child: const DriverProfileScreen(),
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

      // Recipient Shell Route
      ShellRoute(
        navigatorKey: _recipientKey,
        builder: (context, state, child) {
          return ScaffoldWithNavBar(
            key: ValueKey(state.uri.path),
            navBar: RecipientNavBar(),
            child: child,
          );
        },
        routes: [
          GoRoute(
            path: '/receiving',
            name: AppRoutes.receiving,
            pageBuilder: (context, state) => NoTransitionPage(
              key: state.pageKey,
              child: const ReceivingScreen(),
            ),
          ),
          GoRoute(
            path: '/loading',
            name: AppRoutes.loading,
            pageBuilder: (context, state) => NoTransitionPage(
              key: state.pageKey,
              child: const LoadingScreen(),
            ),
          ),
          GoRoute(
            path: '/materials',
            name: AppRoutes.materials,
            pageBuilder: (context, state) => NoTransitionPage(
              key: state.pageKey,
              child: const MaterialsScreen(),
            ),
          ),
          GoRoute(
            path: '/stock',
            name: AppRoutes.stock,
            pageBuilder: (context, state) => NoTransitionPage(
              key: state.pageKey,
              child: const StockScreen(),
            ),
          ),
          GoRoute(
            path: '/recipientProfile',
            name: AppRoutes.recipientProfile,
            pageBuilder: (context, state) => NoTransitionPage(
              key: state.pageKey,
              child: const RecipientProfileScreen(),
            ),
          ),
        ],
      ),

      // Manager Shell Route
      ShellRoute(
        navigatorKey: _managerKey,
        builder: (context, state, child) {
          return ScaffoldWithNavBar(
            key: ValueKey(state.uri.path),
            navBar: ManagerNavBar(),
            child: child,
          );
        },
        routes: [
          GoRoute(
            path: '/accounting',
            name: AppRoutes.accounting,
            pageBuilder: (context, state) => NoTransitionPage(
              key: state.pageKey,
              child: const AccountingScreen(),
            ),
          ),
          GoRoute(
            path: '/warehouse',
            name: AppRoutes.warehouse,
            pageBuilder: (context, state) => NoTransitionPage(
              key: state.pageKey,
              child: const WarehouseScreen(),
            ),
          ),
          GoRoute(
            path: '/sales',
            name: AppRoutes.sales,
            pageBuilder: (context, state) => NoTransitionPage(
              key: state.pageKey,
              child: const SalesScreen(),
            ),
          ),
          GoRoute(
            path: '/aiAssistant',
            name: AppRoutes.aiAssistant,
            pageBuilder: (context, state) => NoTransitionPage(
              key: state.pageKey,
              child: const AiAssistantScreen(),
            ),
          ),
          GoRoute(
            path: '/managerSettings',
            name: AppRoutes.managerSettings,
            pageBuilder: (context, state) => NoTransitionPage(
              key: state.pageKey,
              child: const ManagerSettingsScreen(),
            ),
          ),
          GoRoute(
            path: '/tracking',
            name: AppRoutes.tracking,
            pageBuilder: (context, state) => NoTransitionPage(
              key: state.pageKey,
              child: const TrackingScreen(),
            ),
          ),
        ],
      ),
    ],
  );
}
