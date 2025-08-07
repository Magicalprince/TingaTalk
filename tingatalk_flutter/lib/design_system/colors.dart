import 'package:flutter/material.dart';

class AppColors {
  // Professional Pinkish Theme - Lighter colors matching reference images
  static const Color primaryBackground = Color(0xFFFF6B9D); // Lighter bright pink
  static const Color secondaryBackground = Color(0xFFE91E63); // Bright pink
  static const Color tertiaryBackground = Color(0xFF8E24AA); // Purple pink
  
  // Gradient colors for modern pinkish theme - lighter palette
  static const Color gradientStart = Color(0xFFFF6B9D); // Lighter bright pink
  static const Color gradientMiddle = Color(0xFFE91E63); // Bright pink
  static const Color gradientEnd = Color(0xFF673AB7); // Deep purple
  
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
  
  // Accent colors for highlights and interactions
  static const Color accent = Color(0xFFFF4081); // Bright Pink Accent
  static const Color accentLight = Color(0xFFFF80AB); // Light Pink
  static const Color accentDark = Color(0xFFC51162); // Dark Pink
  
  // Logo and branding colors
  static const Color logoGradientStart = Color(0xFFE91E63);
  static const Color logoGradientEnd = Color(0xFF8E24AA);
  
  // Status and feedback colors
  static const Color success = Color(0xFF4CAF50);
  static const Color warning = Color(0xFFFF9800);
  static const Color error = Color(0xFFF44336);
  
  // Modern gradient combinations for backgrounds - lighter palette
  static const List<Color> primaryGradient = [
    Color(0xFFFF6B9D), // Lighter bright pink
    Color(0xFFE91E63), // Bright pink
    Color(0xFFAD1457), // Medium pink
    Color(0xFF8E24AA), // Purple pink
    Color(0xFF673AB7), // Deep purple
  ];
  
  static const List<Color> secondaryGradient = [
    Color(0xFFFF6B9D), // Lighter bright pink
    Color(0xFFFF4081), // Pink accent
    Color(0xFFE91E63), // Bright pink
  ];
  
  static const List<Color> logoGradient = [
    Color(0xFFFF6B9D), // Lighter bright pink
    Color(0xFFE91E63), // Bright pink
    Color(0xFF8E24AA), // Purple pink
  ];
  
  // Overlay colors for depth and layering
  static const Color overlayLight = Color(0x0DFFFFFF);
  static const Color overlayMedium = Color(0x1AFFFFFF);
  static const Color overlayDark = Color(0x33000000);
}