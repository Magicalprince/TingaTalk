import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'colors.dart';

class AppTypography {
  // Romantic font families for dating app using Google Fonts
  static String get primaryFont => GoogleFonts.poppins().fontFamily!;
  static String get romanticFont => GoogleFonts.dancingScript().fontFamily!;
  
  // Headline styles
  static TextStyle get headline1 => GoogleFonts.poppins(
    fontSize: 24.60,
    fontWeight: FontWeight.w700,
    color: AppColors.primaryText,
    height: 1.02,
  );
  
  // Body text styles using Google Fonts
  static TextStyle get bodyLarge => GoogleFonts.poppins(
    fontSize: 17,
    fontWeight: FontWeight.w500,
    color: AppColors.whiteText,
  );
  
  static TextStyle get bodyMedium => GoogleFonts.poppins(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    color: AppColors.whiteText,
  );
  
  static TextStyle get bodySmall => GoogleFonts.poppins(
    fontSize: 14,
    fontWeight: FontWeight.w700,
    color: AppColors.primaryText,
  );
  
  // Subtitle styles
  static TextStyle get subtitle1 => GoogleFonts.poppins(
    fontSize: 13,
    fontWeight: FontWeight.w400,
    color: AppColors.secondaryText,
    height: 0.95,
  );
  
  static TextStyle get subtitle2 => GoogleFonts.poppins(
    fontSize: 14,
    fontWeight: FontWeight.w500,
    color: AppColors.primaryText,
  );
  
  // Button text styles
  static TextStyle get buttonText => GoogleFonts.poppins(
    fontSize: 10.30,
    fontWeight: FontWeight.w700,
    color: AppColors.buttonText,
  );
  
  static TextStyle get buttonTextLarge => GoogleFonts.poppins(
    fontSize: 13,
    fontWeight: FontWeight.w600,
    color: AppColors.buttonText,
    height: 0.95,
  );
  
  // Input text styles
  static TextStyle get inputText => GoogleFonts.poppins(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    color: AppColors.whiteText,
  );
  
  static TextStyle get inputPlaceholder => GoogleFonts.poppins(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    color: AppColors.placeholderText,
  );
  
  // Back button text
  static TextStyle get backButtonText => GoogleFonts.poppins(
    fontSize: 23,
    fontWeight: FontWeight.w400,
    color: AppColors.whiteText,
  );
  
  static TextStyle get backButtonLabel => GoogleFonts.poppins(
    fontSize: 17,
    fontWeight: FontWeight.w500,
    color: AppColors.whiteText,
  );
  
  // Romantic typography styles using Google Fonts
  static TextStyle get romanticHeading => GoogleFonts.dancingScript(
    fontSize: 32,
    fontWeight: FontWeight.w700,
    color: AppColors.whiteText,
    letterSpacing: 0.5,
    height: 1.2,
  );
  
  static TextStyle get romanticSubheading => GoogleFonts.dancingScript(
    fontSize: 24,
    fontWeight: FontWeight.w600,
    color: AppColors.whiteText,
    letterSpacing: 0.3,
    height: 1.3,
  );
  
  static TextStyle get professionalBody => GoogleFonts.poppins(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    color: AppColors.secondaryText,
    height: 1.4,
  );
}