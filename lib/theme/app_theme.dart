import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  // Luxury Black, White, Gold & Yellow Color Palette
  static const Color primaryBlack = Color(0xFF000000); // Pure black
  static const Color deepBlack = Color(0xFF0A0A0A); // Deep black
  static const Color pureWhite = Color(0xFFFFFFFF); // Pure white
  static const Color softWhite = Color(0xFFFFFFFE); // Soft white
  static const Color luxuryGold = Color(0xFFFFD700); // Luxury gold
  static const Color richGold = Color(0xFFB8860B); // Rich gold
  static const Color elegantYellow = Color(0xFFFFF700); // Elegant yellow
  static const Color brightYellow = Color(0xFFFFEB3B); // Bright yellow
  static const Color charcoalGray = Color(
    0xFF333333,
  ); // Charcoal for subtle contrast
  static const Color lightGray = Color(0xFFF5F5F5); // Very light gray
  static const Color cardBackground = Color(0xFFFFFFFF); // Pure white cards
  static const Color overlayBlack = Color(0xCC000000); // Semi-transparent black
  static const Color overlayWhite = Color(0xCCFFFFFF); // Semi-transparent white

  // Luxury Black, White, Gold & Yellow Gradients
  static const LinearGradient heroGradient = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [Color(0xFF000000), Color(0xFF333333), Color(0xFF0A0A0A)],
    stops: [0.0, 0.7, 1.0],
  );

  static const LinearGradient goldGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [Color(0xFFFFD700), Color(0xFFB8860B), Color(0xFFFFF700)],
    stops: [0.0, 0.5, 1.0],
  );

  static const LinearGradient yellowGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [Color(0xFFFFF700), Color(0xFFFFEB3B), Color(0xFFFFD700)],
  );

  static const LinearGradient glassGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [Color(0x20FFFFFF), Color(0x10FFFFFF), Color(0x05FFFFFF)],
  );

  static const LinearGradient cardGradient = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [Color(0xFFFFFFFF), Color(0xFFF5F5F5)],
  );

  static const LinearGradient blackGoldGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [Color(0xFF000000), Color(0xFF333333), Color(0xFFFFD700)],
    stops: [0.0, 0.8, 1.0],
  );

  // Enhanced Modern Typography
  static TextStyle get heroTitle => GoogleFonts.playfairDisplay(
    fontSize: 88,
    fontWeight: FontWeight.w800,
    color: softWhite,
    letterSpacing: -1.5,
    height: 0.95,
  );

  static TextStyle get heroSubtitle => GoogleFonts.inter(
    fontSize: 22,
    fontWeight: FontWeight.w400,
    color: softWhite.withValues(alpha: 0.85),
    letterSpacing: 0.3,
    height: 1.5,
  );

  static TextStyle get sectionTitle => GoogleFonts.playfairDisplay(
    fontSize: 52,
    fontWeight: FontWeight.w700,
    color: primaryBlack,
    letterSpacing: -0.5,
    height: 1.1,
  );

  static TextStyle get modernTitle => GoogleFonts.inter(
    fontSize: 32,
    fontWeight: FontWeight.w700,
    color: primaryBlack,
    letterSpacing: -0.3,
    height: 1.2,
  );

  static TextStyle get cardTitle => GoogleFonts.inter(
    fontSize: 24,
    fontWeight: FontWeight.w600,
    color: primaryBlack,
  );

  static TextStyle get bodyText => GoogleFonts.inter(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    color: charcoalGray,
    height: 1.6,
  );

  static TextStyle get smallText => GoogleFonts.inter(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: charcoalGray,
  );

  static TextStyle get buttonText => GoogleFonts.inter(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    color: pureWhite,
    letterSpacing: 0.5,
  );

  // Enhanced Modern Shadows
  static List<BoxShadow> get softShadow => [
    BoxShadow(
      color: Colors.black.withValues(alpha: 0.04),
      offset: const Offset(0, 1),
      blurRadius: 3,
      spreadRadius: 0,
    ),
  ];

  static List<BoxShadow> get cardShadow => [
    BoxShadow(
      color: Colors.black.withValues(alpha: 0.08),
      offset: const Offset(0, 4),
      blurRadius: 24,
      spreadRadius: 0,
    ),
    BoxShadow(
      color: Colors.black.withValues(alpha: 0.04),
      offset: const Offset(0, 2),
      blurRadius: 8,
      spreadRadius: 0,
    ),
  ];

  static List<BoxShadow> get hoverShadow => [
    BoxShadow(
      color: Colors.black.withValues(alpha: 0.12),
      offset: const Offset(0, 8),
      blurRadius: 32,
      spreadRadius: 0,
    ),
    BoxShadow(
      color: Colors.black.withValues(alpha: 0.08),
      offset: const Offset(0, 4),
      blurRadius: 16,
      spreadRadius: 0,
    ),
  ];

  static List<BoxShadow> get buttonShadow => [
    BoxShadow(
      color: luxuryGold.withValues(alpha: 0.25),
      offset: const Offset(0, 8),
      blurRadius: 24,
      spreadRadius: 0,
    ),
    BoxShadow(
      color: Colors.black.withValues(alpha: 0.08),
      offset: const Offset(0, 4),
      blurRadius: 12,
      spreadRadius: 0,
    ),
  ];

  static List<BoxShadow> get glowShadow => [
    BoxShadow(
      color: luxuryGold.withValues(alpha: 0.3),
      offset: const Offset(0, 0),
      blurRadius: 20,
      spreadRadius: 2,
    ),
  ];

  // Border Radius
  static const BorderRadius smallRadius = BorderRadius.all(Radius.circular(8));
  static const BorderRadius mediumRadius = BorderRadius.all(
    Radius.circular(16),
  );
  static const BorderRadius largeRadius = BorderRadius.all(Radius.circular(24));
  static const BorderRadius circularRadius = BorderRadius.all(
    Radius.circular(100),
  );

  // Spacing
  static const double spacingXS = 4;
  static const double spacingS = 8;
  static const double spacingM = 16;
  static const double spacingL = 24;
  static const double spacingXL = 32;
  static const double spacingXXL = 48;
  static const double spacingHuge = 80;

  // Luxury Black, White, Gold & Yellow Button Styles
  static ButtonStyle get primaryButton =>
      ElevatedButton.styleFrom(
        backgroundColor: primaryBlack,
        foregroundColor: pureWhite,
        elevation: 0,
        padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
        shape: const RoundedRectangleBorder(borderRadius: mediumRadius),
        textStyle: buttonText,
        shadowColor: primaryBlack.withValues(alpha: 0.3),
      ).copyWith(
        overlayColor: WidgetStateProperty.all(
          charcoalGray.withValues(alpha: 0.1),
        ),
      );

  static ButtonStyle get secondaryButton =>
      OutlinedButton.styleFrom(
        foregroundColor: primaryBlack,
        side: BorderSide(color: primaryBlack, width: 2),
        padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
        shape: const RoundedRectangleBorder(borderRadius: mediumRadius),
        textStyle: buttonText.copyWith(color: primaryBlack),
        backgroundColor: Colors.transparent,
      ).copyWith(
        overlayColor: WidgetStateProperty.all(
          primaryBlack.withValues(alpha: 0.05),
        ),
      );

  static ButtonStyle get accentButton =>
      ElevatedButton.styleFrom(
        backgroundColor: luxuryGold,
        foregroundColor: primaryBlack,
        elevation: 0,
        padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
        shape: const RoundedRectangleBorder(borderRadius: mediumRadius),
        textStyle: buttonText.copyWith(color: primaryBlack),
      ).copyWith(
        overlayColor: WidgetStateProperty.all(pureWhite.withValues(alpha: 0.1)),
      );

  static ButtonStyle get glassButton =>
      ElevatedButton.styleFrom(
        backgroundColor: Colors.white.withValues(alpha: 0.1),
        foregroundColor: softWhite,
        elevation: 0,
        padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
        shape: const RoundedRectangleBorder(borderRadius: mediumRadius),
        textStyle: buttonText,
        side: BorderSide(color: Colors.white.withValues(alpha: 0.2)),
      ).copyWith(
        overlayColor: WidgetStateProperty.all(
          Colors.white.withValues(alpha: 0.1),
        ),
      );

  // Luxury Input Decoration
  static InputDecoration getInputDecoration(String hint) => InputDecoration(
    hintText: hint,
    hintStyle: bodyText.copyWith(color: charcoalGray.withValues(alpha: 0.6)),
    filled: true,
    fillColor: pureWhite,
    border: OutlineInputBorder(
      borderRadius: mediumRadius,
      borderSide: BorderSide(color: lightGray, width: 1.5),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: mediumRadius,
      borderSide: BorderSide(color: lightGray, width: 1.5),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: mediumRadius,
      borderSide: BorderSide(color: luxuryGold, width: 2.5),
    ),
    errorBorder: OutlineInputBorder(
      borderRadius: mediumRadius,
      borderSide: const BorderSide(color: Colors.red, width: 2),
    ),
    contentPadding: const EdgeInsets.all(24),
  );

  // Animation Durations
  static const Duration fastAnimation = Duration(milliseconds: 200);
  static const Duration normalAnimation = Duration(milliseconds: 300);
  static const Duration slowAnimation = Duration(milliseconds: 500);
  static const Duration heroAnimation = Duration(milliseconds: 800);
}
