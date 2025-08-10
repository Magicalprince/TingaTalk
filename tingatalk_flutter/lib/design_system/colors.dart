import 'package:flutter/material.dart';

class AppColors {
  // Updated theme to match your exact Figma expectations
  static const Color primaryBackground = Color.fromARGB(255, 18, 32, 47); // Your specified background
  static const Color secondaryBackground = Color(0xFF53004C); // Your specific dark purple
  static const Color tertiaryBackground = Color(0xFFB111AA); // Main purple
  
  // Light-to-dark horizontal gradient colors
  static const Color gradientStart = Color(0xFFD946EF); // Bright purple (left side)
  static const Color gradientMiddle = Color(0xFFB111AA); // Main purple (center)
  static const Color gradientEnd = Color(0xFF53004C); // Dark purple (right side)
  
  // Text colors - Professional and readable
  static const Color primaryText = Color(0xFFFFFFFF);
  static const Color secondaryText = Color(0xFFE8E8E8);
  static const Color placeholderText = Color(0xFFBDBDBD);
  static const Color whiteText = Color(0xFFFFFFFF);
  static const Color darkText = Color(0xFF212121);
  
  // Button colors - Professional white buttons
  static const Color buttonBackground = Color(0xFFFFFFFF);
  static const Color buttonText = Color(0xFF212121);
  static const Color buttonShadow = Color(0x1A000000);
  
  // Input colors - iPhone-style with better contrast
  static const Color inputBackground = Color(0x26FFFFFF); // More visible
  static const Color inputBorder = Color(0x4DFFFFFF); // Better border visibility
  static const Color inputFocusBorder = Color(0xFFFFFFFF);
  
  // Horizontal gradient accent colors: light left, dark right
  static const Color accent = Color(0xFFB111AA); // Main Purple Accent (center)
  static const Color accentLight = Color(0xFFD946EF); // Bright Purple (left side)
  static const Color accentDark = Color(0xFF53004C); // Dark Purple (right side)
  
  // Logo and branding colors
  static const Color logoGradientStart = Color(0xFFE91E63);
  static const Color logoGradientEnd = Color(0xFF8E24AA);
  
  // Status and feedback colors
  static const Color success = Color(0xFF4CAF50);
  static const Color warning = Color(0xFFFF9800);
  static const Color error = Color(0xFFF44336);
  
  // Horizontal left-to-right gradient: light left, dark right
  static const List<Color> primaryGradient = [
    Color(0xFFD946EF), // Bright purple (left side)
    Color(0xFFB111AA), // Main purple (center)
    Color(0xFF7A0E8C), // Medium purple
    Color(0xFF53004C), // Dark purple (right side)
  ];
  
  static const List<Color> secondaryGradient = [
    Color(0xFFD946EF), // Bright purple (left)
    Color(0xFFB111AA), // Main purple
    Color(0xFF53004C), // Dark purple (right)
  ];
  
  static const List<Color> logoGradient = [
    Color(0xFFD946EF), // Bright purple (left)
    Color(0xFFB111AA), // Main purple
    Color(0xFF53004C), // Dark purple (right)
  ];
  
  // Overlay colors for depth and layering - matching your Figma code
  static const Color overlayLight = Color(0x0DFFFFFF);
  static const Color overlayMedium = Color(0x1AFFFFFF);
  static const Color overlayDark = Color(0x33000000);
  static const Color figmaOverlay = Color(0xCC222224); // From your code snippet
}