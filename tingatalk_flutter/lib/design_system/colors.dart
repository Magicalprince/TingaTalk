import 'package:flutter/material.dart';

class AppColors {
  // Updated theme with your specific dark purple and minimal pink
  static const Color primaryBackground = Color(0xFF53004C); // Your specific dark purple
  static const Color secondaryBackground = Color(0xFF7A0E8C); // Medium purple
  static const Color tertiaryBackground = Color(0xFFB111AA); // Main purple
  
  // Purple-dominated gradient colors with your specific dark purple
  static const Color gradientStart = Color(0xFFC084FC); // Light purple (minimal pink)
  static const Color gradientMiddle = Color(0xFFB111AA); // Main purple (40%)
  static const Color gradientEnd = Color(0xFF53004C); // Your specific dark purple
  
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
  
  // Purple-focused accent colors with your specific dark purple
  static const Color accent = Color(0xFFB111AA); // Main Purple Accent
  static const Color accentLight = Color(0xFFC084FC); // Light Purple (minimal pink)
  static const Color accentDark = Color(0xFF53004C); // Your specific dark purple
  
  // Logo and branding colors
  static const Color logoGradientStart = Color(0xFFE91E63);
  static const Color logoGradientEnd = Color(0xFF8E24AA);
  
  // Status and feedback colors
  static const Color success = Color(0xFF4CAF50);
  static const Color warning = Color(0xFFFF9800);
  static const Color error = Color(0xFFF44336);
  
  // Purple-dominated gradient with minimal pink and your specific dark purple
  static const List<Color> primaryGradient = [
    Color(0xFFC084FC), // Light purple (much less pink)
    Color(0xFFB111AA), // Main purple center (40%)
    Color(0xFF7A0E8C), // Medium purple
    Color(0xFF53004C), // Your specific dark purple
  ];
  
  static const List<Color> secondaryGradient = [
    Color(0xFFC084FC), // Light purple (minimal pink)
    Color(0xFFB111AA), // Main purple
    Color(0xFF53004C), // Your specific dark purple
  ];
  
  static const List<Color> logoGradient = [
    Color(0xFFC084FC), // Light purple (minimal pink)
    Color(0xFFB111AA), // Main purple
    Color(0xFF53004C), // Your specific dark purple
  ];
  
  // Overlay colors for depth and layering
  static const Color overlayLight = Color(0x0DFFFFFF);
  static const Color overlayMedium = Color(0x1AFFFFFF);
  static const Color overlayDark = Color(0x33000000);
}