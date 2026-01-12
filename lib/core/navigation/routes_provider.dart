import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

abstract class AppRoutes {
  static const delivery = 'delivery';
  static const deliveryPoint = 'deliveryPoint';
  static const returns = 'returns';
  static const profile = 'profile';
  static const settings = 'settings';
}

extension NavigationHelpers on BuildContext {
  void goToDelivery() => goNamed(AppRoutes.delivery);
  void goToDeliveryPoint() => goNamed(AppRoutes.deliveryPoint);
  void goToReturns() => goNamed(AppRoutes.returns);
  void goToProfile() => goNamed(AppRoutes.profile);
  void goToSettings() => pushNamed(AppRoutes.settings);

  void popPage() => pop();
}
