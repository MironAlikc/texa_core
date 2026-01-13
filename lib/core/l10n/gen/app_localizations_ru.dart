// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Russian (`ru`).
class AppLocalizationsRu extends AppLocalizations {
  AppLocalizationsRu([String locale = 'ru']) : super(locale);

  @override
  String get appName => 'Текса Кор';

  @override
  String get delivery => 'Доставка';

  @override
  String get deliveryPoint => 'Пункт выдачи';

  @override
  String get returns => 'Возвраты';

  @override
  String get profile => 'Профиль';

  @override
  String get receiving => 'Приемка';

  @override
  String get loading => 'Погрузка';

  @override
  String get materials => 'Материалы';

  @override
  String get stock => 'Запасы';

  @override
  String get accounting => 'Учет';

  @override
  String get warehouse => 'Склад';

  @override
  String get sales => 'Продажи';

  @override
  String get aiAssistant => 'AI-помощник';

  @override
  String get tracking => 'Отслеживание';

  @override
  String get settings => 'Настройки';

  @override
  String get startShift => 'Начать смену';

  @override
  String get deliveryDriver => 'Водитель доставки';

  @override
  String get onDuty => 'На смене';

  @override
  String get offDuty => 'Вне смены';

  @override
  String get endShift => 'Завершить смену';

  @override
  String startedAt(Object shiftStartTime) {
    return 'Начало в $shiftStartTime';
  }

  @override
  String get deliveriesToday => 'Доставок сегодня';

  @override
  String get activityHours => 'Часы активности';

  @override
  String get delivered => 'Доставлено';

  @override
  String get failed => 'Не доставлено';

  @override
  String get gpsTracking => 'GPS-мониторинг';

  @override
  String get gpsIsOn => 'GPS включен';

  @override
  String get gpsIsOff => 'GPS выключен';

  @override
  String get appearance => 'Внешний вид';

  @override
  String get security => 'Безопасность';

  @override
  String get support => 'Поддержка';
}
