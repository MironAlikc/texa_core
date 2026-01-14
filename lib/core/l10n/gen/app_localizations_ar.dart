// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Arabic (`ar`).
class AppLocalizationsAr extends AppLocalizations {
  AppLocalizationsAr([String locale = 'ar']) : super(locale);

  @override
  String get appName => 'تيكسا كور';

  @override
  String get delivery => 'التوصيل';

  @override
  String get deliveryPoint => 'نقطة الاستلام';

  @override
  String get returns => 'المرتجعات';

  @override
  String get profile => 'الملف الشخصي';

  @override
  String get receiving => 'الاستلام';

  @override
  String get loading => 'تحميل';

  @override
  String get materials => 'المواد';

  @override
  String get stock => 'المخزون';

  @override
  String get accounting => 'المحاسبة';

  @override
  String get warehouse => 'المستودع';

  @override
  String get sales => 'المبيعات';

  @override
  String get aiAssistant => 'مساعد الذكاء الاصطناعي';

  @override
  String get tracking => 'التتبع';

  @override
  String get settings => 'الإعدادات';

  @override
  String get startShift => 'بدء المناوبة';

  @override
  String get deliveryDriver => 'سائق توصيل';

  @override
  String get onDuty => 'في الخدمة';

  @override
  String get offDuty => 'خارج الخدمة';

  @override
  String get endShift => 'إنهاء المناوبة';

  @override
  String startedAt(Object shiftStartTime) {
    return 'بدأت في $shiftStartTime';
  }

  @override
  String get deliveriesToday => 'توصيلات اليوم';

  @override
  String get activityHours => 'ساعات النشاط';

  @override
  String get delivered => 'تم التوصيل';

  @override
  String get failed => 'فشلت';

  @override
  String get gpsTracking => 'تتبع نظام تحديد المواقع (GPS)';

  @override
  String get gpsIsOn => 'نظام تحديد المواقع مفعل';

  @override
  String get gpsIsOff => 'نظام تحديد المواقع متوقف';

  @override
  String get appearance => 'المظهر';

  @override
  String get security => 'الأمان';

  @override
  String get support => 'الدعم';

  @override
  String get language => 'اللغة';

  @override
  String get close => 'إغلاق';

  @override
  String get edit => 'تعديل';

  @override
  String get light => 'فاتح';

  @override
  String get dark => 'داكن';

  @override
  String get system => 'النظام';

  @override
  String get theme => 'المظهر';

  @override
  String get disabled => 'معطل';

  @override
  String get enabled => 'مفعل';

  @override
  String get notifications => 'الإشعارات';
}
