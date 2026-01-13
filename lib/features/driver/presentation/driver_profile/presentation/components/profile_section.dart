import 'package:flutter/material.dart';
import 'package:texa_core/core/theme/app_sizes.dart';

class ProfileSection extends StatelessWidget {
  final List<Widget> children;
  final dynamic colors;

  const ProfileSection({
    super.key,
    required this.children,
    required this.colors,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: colors.surface,
        borderRadius: BorderRadius.circular(AppSizes.medium),
        border: Border.all(color: colors.borderLight),
      ),
      child: Column(children: children),
    );
  }
}
