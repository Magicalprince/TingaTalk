import 'package:flutter/material.dart';
import 'colors.dart';

class AppTypography {
  // Font families with system fallbacks
  static const String primaryFont = 'Inter';
  static const String secondaryFont = 'SF Pro Text';
  
  // Headline styles
  static const TextStyle headline1 = TextStyle(
    fontFamily: primaryFont,
    fontSize: 24.60,
    fontWeight: FontWeight.w700,
    color: AppColors.primaryText,
    height: 1.02,
  );
  
  // Body text styles
  static const TextStyle bodyLarge = TextStyle(
    fontFamily: primaryFont,
    fontSize: 17,
    fontWeight: FontWeight.w500,
    color: AppColors.whiteText,
  );
  
  static const TextStyle bodyMedium = TextStyle(
    fontFamily: primaryFont,
    fontSize: 16,
    fontWeight: FontWeight.w400,
    color: AppColors.whiteText,
  );
  
  static const TextStyle bodySmall = TextStyle(
    fontFamily: primaryFont,
    fontSize: 14,
    fontWeight: FontWeight.w700,
    color: AppColors.primaryText,
  );
  
  // Subtitle styles
  static const TextStyle subtitle1 = TextStyle(
    fontFamily: primaryFont,
    fontSize: 13,
    fontWeight: FontWeight.w400,
    color: AppColors.secondaryText,
    height: 0.95,
  );
  
  static const TextStyle subtitle2 = TextStyle(
    fontFamily: primaryFont,
    fontSize: 14,
    fontWeight: FontWeight.w500,
    color: AppColors.primaryText,
  );
  
  // Button text styles
  static const TextStyle buttonText = TextStyle(
    fontFamily: primaryFont,
    fontSize: 10.30,
    fontWeight: FontWeight.w700,
    color: AppColors.buttonText,
  );
  
  static const TextStyle buttonTextLarge = TextStyle(
    fontFamily: primaryFont,
    fontSize: 13,
    fontWeight: FontWeight.w600,
    color: AppColors.buttonText,
    height: 0.95,
  );
  
  // Input text styles
  static const TextStyle inputText = TextStyle(
    fontFamily: secondaryFont,
    fontSize: 16,
    fontWeight: FontWeight.w400,
    color: AppColors.whiteText,
  );
  
  static const TextStyle inputPlaceholder = TextStyle(
    fontFamily: secondaryFont,
    fontSize: 16,
    fontWeight: FontWeight.w400,
    color: AppColors.placeholderText,
  );
  
  // Back button text
  static const TextStyle backButtonText = TextStyle(
    fontFamily: secondaryFont,
    fontSize: 23,
    fontWeight: FontWeight.w400,
    color: AppColors.whiteText,
  );
  
  static const TextStyle backButtonLabel = TextStyle(
    fontFamily: primaryFont,
    fontSize: 17,
    fontWeight: FontWeight.w500,
    color: AppColors.whiteText,
  );
}