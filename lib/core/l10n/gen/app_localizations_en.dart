// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appName => 'Texa Core';

  @override
  String get delivery => 'Delivery';

  @override
  String get deliveryPoint => 'Delivery Point';

  @override
  String get returns => 'Returns';

  @override
  String get profile => 'Profile';

  @override
  String get receiving => 'Receiving';

  @override
  String get loading => 'Loading';

  @override
  String get materials => 'Materials';

  @override
  String get stock => 'Stock';

  @override
  String get accounting => 'Accounting';

  @override
  String get warehouse => 'Warehouse';

  @override
  String get sales => 'Sales';

  @override
  String get aiAssistant => 'AI Assistant';

  @override
  String get tracking => 'Tracking';

  @override
  String get settings => 'Settings';

  @override
  String get startShift => 'Start shift';

  @override
  String get deliveryDriver => 'Delivery Driver';

  @override
  String get onDuty => 'On Duty';

  @override
  String get offDuty => 'Off Duty';

  @override
  String get endShift => 'End shift';

  @override
  String startedAt(Object shiftStartTime) {
    return 'Started at $shiftStartTime';
  }

  @override
  String get deliveriesToday => 'Deliveries today';

  @override
  String get activityHours => 'Activity hours';

  @override
  String get delivered => 'Delivered';

  @override
  String get failed => 'Failed';

  @override
  String get gpsTracking => 'GPS Tracking';

  @override
  String get gpsIsOn => 'GPS is on';

  @override
  String get gpsIsOff => 'GPS is turned off';

  @override
  String get appearance => 'Appearance';

  @override
  String get security => 'Security';

  @override
  String get support => 'Support';

  @override
  String get language => 'Language';

  @override
  String get close => 'Close';

  @override
  String get edit => 'Edit';

  @override
  String get light => 'Light';

  @override
  String get dark => 'Dark';

  @override
  String get system => 'System';

  @override
  String get theme => 'Theme';

  @override
  String get disabled => 'Disabled';

  @override
  String get enabled => 'Enabled';

  @override
  String get notifications => 'Notifications';

  @override
  String get biometricEntry => 'Biometric entry';

  @override
  String get twoFactorAuthentication => 'Two-factor authentication';

  @override
  String get biometricDescription => 'Fingerprint or facial recognition login';

  @override
  String get twoFactorDescription => 'Additional account protection';
}
