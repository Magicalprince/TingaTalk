import 'package:flutter/material.dart';
import '../../design_system/colors.dart';
import '../welcome/welcome_screen.dart';

class ColorPaletteScreen extends StatefulWidget {
  const ColorPaletteScreen({super.key});

  @override
  State<ColorPaletteScreen> createState() => _ColorPaletteScreenState();
}

class _ColorPaletteScreenState extends State<ColorPaletteScreen> {
  @override
  void initState() {
    super.initState();
    // Navigate to welcome screen after 5 seconds
    Future.delayed(const Duration(seconds: 5), () {
      if (mounted) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const WelcomeScreen()),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            colors: AppColors.primaryGradient,
            stops: [0.0, 0.3, 0.7, 1.0],
          ),
        ),
        // Completely blank - no child widget
      ),
    );
  }


}