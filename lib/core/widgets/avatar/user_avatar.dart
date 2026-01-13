import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:texa_core/core/extensions/theme_ext.dart';
import 'package:texa_core/core/theme/app_color_extension.dart';
import 'package:texa_core/core/theme/app_sizes.dart';

class UserAvatar extends StatelessWidget {
  final String? imageUrl;
  final double radius;
  final Color? color;

  const UserAvatar({super.key, this.imageUrl, this.radius = 30, this.color});

  @override
  Widget build(BuildContext context) {
    final colors = context.color;

    return Container(
      width: radius * 2,
      height: radius * 2,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: color ?? colors.surface,
        border: Border.all(color: colors.borderLight, width: 1),
      ),
      child: ClipOval(
        child: (imageUrl == null || imageUrl!.isEmpty)
            ? _buildPlaceholder(colors)
            : CachedNetworkImage(
                imageUrl: imageUrl!,
                fit: BoxFit.cover,
                placeholder: (context, url) => Center(
                  child: SizedBox(
                    width: AppSizes.mediumLarge,
                    height: AppSizes.mediumLarge,
                    child: CircularProgressIndicator(
                      strokeWidth: 2,
                      valueColor: AlwaysStoppedAnimation<Color>(colors.primary),
                    ),
                  ),
                ),
                errorWidget: (context, url, error) => _buildPlaceholder(colors),
              ),
      ),
    );
  }

  Widget _buildPlaceholder(AppColorExtension colors) {
    return Icon(
      LucideIcons.user,
      size: radius * 1.1,
      color: colors.textSecondary,
    );
  }
}
