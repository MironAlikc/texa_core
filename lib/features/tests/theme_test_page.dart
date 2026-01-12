// ! Class as a cheat sheet for topics and styles!
// class ThemeTestPage extends StatelessWidget {
//   const ThemeTestPage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final colors = context.color;
//     final themeMode = context.watch<ThemeCubit>().state;
//     final currentLocale = context.watch<LocaleCubit>().state;

//     return Scaffold(
//       backgroundColor: colors.background,
//       appBar: AppBar(
//         title: Text('Typography & Theme', style: AppTypography.h3),
//         backgroundColor: colors.navBackground,
//         foregroundColor: colors.navActiveItem,
//       ),
//       body: SingleChildScrollView(
//         padding: const EdgeInsets.all(24.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Center(
//               child: Column(
//                 children: [
//                   Icon(
//                     _getThemeIcon(themeMode),
//                     size: 48,
//                     color: colors.primary,
//                   ),
//                   const SizedBox(height: 12),
//                   Text(
//                     'Mode ${AppLocalizations.of(context).appName}: ${themeMode.name.toUpperCase()}',
//                     style: AppTypography.label.copyWith(
//                       color: colors.textSecondary,
//                     ),
//                   ),
//                   const SizedBox(height: 16),
//                   ElevatedButton(
//                     style: ElevatedButton.styleFrom(
//                       backgroundColor: colors.accent,
//                       foregroundColor: colors.textInverted,
//                       padding: const EdgeInsets.symmetric(
//                         horizontal: 24,
//                         vertical: 12,
//                       ),
//                     ),
//                     onPressed: () => context.read<ThemeCubit>().toggleTheme(),
//                     child: Text('Toggle Theme', style: AppTypography.button),
//                   ),
//                   const SizedBox(height: 8),
//                   TextButton.icon(
//                     onPressed: () =>
//                         context.read<LocaleCubit>().toggleLanguage(),
//                     icon: Icon(Icons.language, color: colors.primary),
//                     label: Text(
//                       'Language: ${currentLocale.languageCode.toUpperCase()}',
//                       style: AppTypography.button.copyWith(
//                         color: colors.primary,
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),

//             const Divider(height: 40),

//             _sectionTitle("Headings", colors),
//             Text(
//               'H1 Header',
//               style: AppTypography.h1.copyWith(color: colors.textPrimary),
//             ),
//             Text(
//               'H2 Header',
//               style: AppTypography.h2.copyWith(color: colors.textPrimary),
//             ),
//             Text(
//               'H3 Header',
//               style: AppTypography.h3.copyWith(color: colors.textPrimary),
//             ),
//             Text(
//               'H4 Header',
//               style: AppTypography.h4.copyWith(color: colors.textPrimary),
//             ),

//             const SizedBox(height: 24),

//             _sectionTitle("Body Text", colors),
//             Text(
//               'Body Large - Основной длинный текст.',
//               style: AppTypography.bodyLarge.copyWith(
//                 color: colors.textPrimary,
//               ),
//             ),
//             Text(
//               'Body Medium - Стандартный текст интерфейса.',
//               style: AppTypography.bodyMedium.copyWith(
//                 color: colors.textPrimary,
//               ),
//             ),
//             Text(
//               'Body Medium Bold - Жирный акцент.',
//               style: AppTypography.bodyMediumBold.copyWith(
//                 color: colors.textPrimary,
//               ),
//             ),
//             Text(
//               'Body Small - Вторичная информация.',
//               style: AppTypography.bodySmall.copyWith(
//                 color: colors.textPrimary,
//               ),
//             ),

//             const SizedBox(height: 24),

//             _sectionTitle("Special & Metadata", colors),
//             Text(
//               'Clickable Link',
//               style: AppTypography.link.copyWith(color: colors.primary),
//             ),
//             const SizedBox(height: 8),
//             Text(
//               'LABEL: FORM FIELD',
//               style: AppTypography.label.copyWith(color: colors.textSecondary),
//             ),
//             Text(
//               'Caption: hint or timestamp',
//               style: AppTypography.caption.copyWith(
//                 color: colors.textSecondary,
//               ),
//             ),
//             Text(
//               'TINY LEGAL DISCLAIMER',
//               style: AppTypography.tiny.copyWith(color: colors.textSecondary),
//             ),

//             const SizedBox(height: 24),

//             Container(
//               padding: const EdgeInsets.all(16),
//               decoration: BoxDecoration(
//                 color: colors.accent.withValues(alpha: 0.1),
//                 borderRadius: BorderRadius.circular(12),
//               ),
//               child: Text(
//                 'Banner Title',
//                 style: AppTypography.bannerTitle.copyWith(color: colors.accent),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _sectionTitle(String title, dynamic colors) {
//     return Padding(
//       padding: const EdgeInsets.only(bottom: 12),
//       child: Text(
//         title.toUpperCase(),
//         style: AppTypography.label.copyWith(
//           color: colors.primary,
//           letterSpacing: 1.2,
//         ),
//       ),
//     );
//   }

//   IconData _getThemeIcon(ThemeMode mode) {
//     switch (mode) {
//       case ThemeMode.system:
//         return Icons.brightness_auto;
//       case ThemeMode.light:
//         return Icons.light_mode;
//       case ThemeMode.dark:
//         return Icons.dark_mode;
//     }
//   }
// }
