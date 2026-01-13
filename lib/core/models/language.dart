class Language {
  final String name;
  final String flag;
  final String code;
  final bool isSupported;

  const Language({
    required this.name,
    required this.flag,
    required this.code,
    this.isSupported = false,
  });
}

final List<Language> languages = [
  const Language(name: 'English', flag: '🇺🇸', code: 'en', isSupported: true),
  const Language(name: 'Русский', flag: '🇷🇺', code: 'ru', isSupported: true),
  const Language(name: 'العربية', flag: '🇸🇦', code: 'ar', isSupported: true),
  const Language(name: 'Українська', flag: '🇺🇦', code: 'uk'),
  const Language(name: 'Polski', flag: '🇵🇱', code: 'pl'),
  const Language(name: 'Română', flag: '🇷🇴', code: 'ro'),
  const Language(name: 'Türkçe', flag: '🇹🇷', code: 'tr'),
  const Language(name: 'Italiano', flag: '🇮🇹', code: 'it'),
];
