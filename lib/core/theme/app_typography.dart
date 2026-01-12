import 'package:flutter/material.dart';

abstract final class AppTypography {
  static const String _fontFamily = 'Inter';

  static TextStyle _style({
    required double fontSize,
    required FontWeight fontWeight,
    required double height,
    double? letterSpacing,
    TextDecoration? decoration,
  }) {
    return TextStyle(
      fontFamily: _fontFamily,
      fontSize: fontSize,
      fontWeight: fontWeight,
      height: height,
      letterSpacing: letterSpacing,
      decoration: decoration,
      leadingDistribution: TextLeadingDistribution.even,
    );
  }

  // --- Headings ---

  /// Large header for screen titles or hero sections.
  static final h1 = _style(
    fontSize: 32,
    fontWeight: FontWeight.w700,
    height: 1.2,
    letterSpacing: -0.5,
  );

  /// Medium header for major section titles.
  static final h2 = _style(
    fontSize: 24,
    fontWeight: FontWeight.w600,
    height: 1.3,
    letterSpacing: -0.3,
  );

  /// Small header for sub-sections within a page.
  static final h3 = _style(
    fontSize: 20,
    fontWeight: FontWeight.w600,
    height: 1.4,
  );

  /// Standard header for card titles or smaller groups.
  static final h4 = _style(
    fontSize: 18,
    fontWeight: FontWeight.w600,
    height: 1.4,
  );

  // --- Body Text ---

  /// Primary body text for long-form reading and large descriptions.
  static final bodyLarge = _style(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    height: 1.5,
  );

  /// Bold version of primary body text.
  static final bodyLargeBold = bodyLarge.copyWith(fontWeight: FontWeight.w600);

  /// Standard body text for most UI elements and labels.
  static final bodyMedium = _style(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    height: 1.5,
  );

  /// Bold version of standard body text (often used for emphasis).
  static final bodyMediumBold = bodyMedium.copyWith(
    fontWeight: FontWeight.w600,
  );

  /// Small body text for secondary information or dense data.
  static final bodySmall = _style(
    fontSize: 12,
    fontWeight: FontWeight.w400,
    height: 1.5,
  );

  /// Bold version of small body text.
  static final bodySmallBold = bodySmall.copyWith(fontWeight: FontWeight.w600);

  // --- Interactive Elements ---

  /// Style for primary and secondary buttons.
  static final button = _style(
    fontSize: 14,
    fontWeight: FontWeight.w600,
    height: 1.0,
    letterSpacing: 0.5,
  );

  /// Clickable link text with underline.
  static final link = bodyMedium.copyWith(
    fontWeight: FontWeight.w500,
    decoration: TextDecoration.underline,
  );

  // --- Information & Metadata ---

  /// Precise labels for form fields or tab bars.
  static final label = _style(
    fontSize: 12,
    fontWeight: FontWeight.w500,
    height: 1.3,
    letterSpacing: 0.4,
  );

  /// Captions for images, timestamps, or hints below inputs.
  static final caption = _style(
    fontSize: 11,
    fontWeight: FontWeight.w400,
    height: 1.3,
  );

  /// Microscopic text for badges, tiny indicators, or legal disclaimers.
  static final tiny = _style(
    fontSize: 9,
    fontWeight: FontWeight.w500,
    height: 1.2,
  );

  // --- UI Specifics ---

  /// Bold titles used specifically in data tables.
  static final tableHeader = _style(
    fontSize: 13,
    fontWeight: FontWeight.w600,
    height: 1.3,
    letterSpacing: 0.2,
  );

  /// Navigation item style (e.g., in a Sidebar or Drawer).
  static final sidebarItem = _style(
    fontSize: 14,
    fontWeight: FontWeight.w500,
    height: 1.4,
  );

  /// Selected or active navigation item style.
  static final sidebarItemActive = sidebarItem.copyWith(
    fontWeight: FontWeight.w600,
  );

  /// Prominent title for banners or marketing cards.
  static final bannerTitle = _style(
    fontSize: 40,
    fontWeight: FontWeight.w700,
    height: 1.1,
    letterSpacing: -0.8,
  );
}
