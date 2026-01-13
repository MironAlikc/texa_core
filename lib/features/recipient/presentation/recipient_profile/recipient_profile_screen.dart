import 'package:flutter/material.dart';
import 'package:texa_core/core/extensions/theme_ext.dart';
import 'package:texa_core/core/l10n/gen/app_localizations.dart';
import 'package:texa_core/core/theme/app_sizes.dart';
import 'package:texa_core/core/theme/app_typography.dart';

class RecipientProfileScreen extends StatelessWidget {
  const RecipientProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = context.color;
    final localizations = AppLocalizations.of(context);

    return Scaffold(
      backgroundColor: colors.background,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: colors.surface,
        elevation: 0,
        scrolledUnderElevation: 0,
        centerTitle: false,
        titleSpacing: AppSizes.medium,
        title: Text(
          localizations.profile,
          style: AppTypography.h2.copyWith(color: colors.textPrimary),
        ),

        // actions: [
        //   Padding(
        //     padding: AppSizes.medium.rightPadding,
        //     child: IconButton(
        //       onPressed: () {},
        //       icon: Icon(
        //         Icons.notifications_none_rounded,
        //         color: colors.textPrimary,
        //       ),
        //     ),
        //   ),
        // ],
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(1.0),
          child: Container(color: colors.borderLight, height: 1.0),
        ),
      ),

      body: Center(
        child: Text('Recipient Profile', style: AppTypography.bodyMediumBold),
      ),
    );
  }
}
