import 'package:flutter/material.dart';

class AppIconContainer extends StatelessWidget {
  final IconData icon;
  final Color iconColor;
  final Color backgroundColor;
  final double size;
  final double iconSize;
  final double borderRadius;

  const AppIconContainer({
    super.key,
    required this.icon,
    required this.iconColor,
    required this.backgroundColor,
    this.size = 40,
    this.iconSize = 20,
    this.borderRadius = 12,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(borderRadius),
      ),
      child: Center(
        child: Icon(icon, color: iconColor, size: iconSize),
      ),
    );
  }
}
