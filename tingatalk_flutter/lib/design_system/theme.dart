import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'colors.dart';
import 'typography.dart';

class AppTheme {
  static ThemeData get darkTheme {
    return ThemeData(
      brightness: Brightness.dark,
      primarySwatch: Colors.purple,
      scaffoldBackgroundColor: AppColors.primaryBackground,
      textTheme: GoogleFonts.poppinsTextTheme(), // Set romantic font as default
      
      // AppBar theme with gradient support
      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: IconThemeData(color: AppColors.whiteText),
        titleTextStyle: TextStyle(
          color: AppColors.whiteText,
          fontSize: 18,
          fontWeight: FontWeight.w600,
        ),
      ),
      
      // Button themes with B111AA accent
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.white,
          foregroundColor: const Color(0xFF2F0939),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          elevation: 8,
          shadowColor: Colors.black.withValues(alpha: 0.3),
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 18),
        ),
      ),
      
      // Input decoration theme - improved visibility
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: Colors.white.withValues(alpha: 0.15),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: Colors.white.withValues(alpha: 0.3), width: 1),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: Colors.white.withValues(alpha: 0.3), width: 1),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: Color(0xFFFFA5FE), width: 2),
        ),
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        hintStyle: TextStyle(color: Colors.white.withValues(alpha: 0.7)),
        labelStyle: const TextStyle(color: AppColors.whiteText),
      ),
      
      // Color scheme with B111AA focus
      colorScheme: const ColorScheme.dark(
        primary: Color(0xFFB111AA),
        secondary: Color(0xFFFFA5FE),
        surface: Color(0xFF2F0939),
        onPrimary: AppColors.whiteText,
        onSecondary: AppColors.whiteText,
        onSurface: AppColors.primaryText,
      ),
    );
  }
  
  // Helper method to create horizontal gradient background for any screen
  static Widget gradientBackground({required Widget child}) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: AppColors.primaryGradient,
          stops: [0.0, 0.3, 0.7, 1.0],
        ),
      ),
      child: child,
    );
  }
}