import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

abstract class AppRoutes {
  // Driver routes
  static const delivery = 'delivery';
  static const deliveryPoint = 'deliveryPoint';
  static const returns = 'returns';
  static const profile = 'profile';
  static const settings = 'settings';

  // Recipient routes
  static const receiving = 'receiving';
  static const loading = 'loading';
  static const materials = 'materials';
  static const stock = 'stock';
  static const recipientProfile = 'recipientProfile';

  // Manager routes
  static const accounting = 'accounting';
  static const warehouse = 'warehouse';
  static const sales = 'sales';
  static const aiAssistant = 'aiAssistant';
  static const managerSettings = 'managerSettings';
  static const tracking = 'tracking';
}

extension NavigationHelpers on BuildContext {
  // Driver navigation
  void goToDelivery() => goNamed(AppRoutes.delivery);
  void goToDeliveryPoint() => goNamed(AppRoutes.deliveryPoint);
  void goToReturns() => goNamed(AppRoutes.returns);
  void goToProfile() => goNamed(AppRoutes.profile);
  void goToSettings() => pushNamed(AppRoutes.settings);

  // Recipient navigation
  void goToReceiving() => goNamed(AppRoutes.receiving);
  void goToLoading() => goNamed(AppRoutes.loading);
  void goToMaterials() => goNamed(AppRoutes.materials);
  void goToStock() => goNamed(AppRoutes.stock);
  void goToRecipientProfile() => goNamed(AppRoutes.recipientProfile);

  // Manager navigation
  void goToAccounting() => goNamed(AppRoutes.accounting);
  void goToWarehouse() => goNamed(AppRoutes.warehouse);
  void goToSales() => goNamed(AppRoutes.sales);
  void goToAIAssistant() => goNamed(AppRoutes.aiAssistant);
  void goToManagerSettings() => goNamed(AppRoutes.managerSettings);
  void goToTracking() => goNamed(AppRoutes.tracking);

  void popPage() => pop();
}
