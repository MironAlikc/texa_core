import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:texa_core/core/l10n/locale_cubit/locale_cubit.dart';
import 'package:texa_core/core/models/language.dart';
import 'package:texa_core/core/theme/app_color_extension.dart';
import 'package:texa_core/core/theme/app_sizes.dart';
import 'package:texa_core/core/theme/app_typography.dart';

class LanguageSelectionPanel extends StatelessWidget {
  final AppColorExtension colors;
  final String selectedCode;
  final Function(Language) onLanguageSelected;

  const LanguageSelectionPanel({
    super.key,
    required this.colors,
    required this.selectedCode,
    required this.onLanguageSelected,
  });

  @override
  Widget build(BuildContext context) {
    final currentLocale = context.watch<LocaleCubit>().state;

    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 8,
        crossAxisSpacing: 8,
        childAspectRatio: 3.5,
      ),
      itemCount: languages.length,
      itemBuilder: (context, index) {
        final lang = languages[index];
        final isSelected = lang.code == currentLocale.languageCode;

        return InkWell(
          onTap: lang.isSupported
              ? () => context.read<LocaleCubit>().changeLanguage(lang.code)
              : null,
          borderRadius: BorderRadius.circular(AppSizes.small),
          child: Opacity(
            opacity: lang.isSupported ? 1.0 : 0.5,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              decoration: BoxDecoration(
                color: isSelected ? colors.accent : colors.surfaceVariant,
                borderRadius: BorderRadius.circular(AppSizes.small),
              ),
              child: Row(
                children: [
                  Text(lang.flag, style: const TextStyle(fontSize: 18)),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Text(
                      lang.name,
                      style: AppTypography.bodyMedium.copyWith(
                        color: isSelected ? Colors.white : colors.textPrimary,
                      ),
                    ),
                  ),
                  if (isSelected)
                    const Icon(
                      LucideIcons.check,
                      color: Colors.white,
                      size: 16,
                    ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
