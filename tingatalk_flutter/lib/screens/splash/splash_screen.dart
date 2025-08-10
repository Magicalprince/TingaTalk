import 'package:flutter/material.dart';
import '../../design_system/colors.dart';
import '../../design_system/typography.dart';
import '../../widgets/common/flowing_background.dart';
import '../../widgets/common/tinga_logo.dart';
import '../welcome/welcome_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    
    // Navigate to landing screen after 3 seconds
    Future.delayed(const Duration(seconds: 3), () {
      if (mounted) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const WelcomeScreen(),
          ),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFFE91E63), // Bright Pink - More visible
              Color(0xFFAD1457), // Dark Pink
              Color(0xFF8E24AA), // Purple Pink  
              Color(0xFF673AB7), // Deep Purple
              Color(0xFF4A148C), // Very Deep Purple
            ],
            stops: [0.0, 0.25, 0.5, 0.75, 1.0],
          ),
        ),
        child: Stack(
          children: [
            // ENHANCED NEON GRADIENT OVERLAY - SPLASH VERSION
            Positioned.fill(
              child: Container(
                decoration: BoxDecoration(
                  gradient: RadialGradient(
                    center: const Alignment(0.0, 0.0),
                    radius: 2.0,
                    colors: [
                      // Much stronger neon center for splash
                      AppColors.accent.withValues(alpha: 0.8),
                      AppColors.primaryBackground.withValues(alpha: 0.65),
                      AppColors.secondaryBackground.withValues(alpha: 0.5),
                      AppColors.tertiaryBackground.withValues(alpha: 0.35),
                      Colors.transparent,
                    ],
                    stops: const [0.0, 0.25, 0.5, 0.75, 1.0],
                  ),
                ),
              ),
            ),
            
            // ENHANCED NEON GLOW PATTERN - Multiple radial glows for splash
            Positioned.fill(
              child: Container(
                decoration: BoxDecoration(
                  gradient: RadialGradient(
                    center: const Alignment(-0.4, -0.6),
                    radius: 1.5,
                    colors: [
                      AppColors.accent.withValues(alpha: 0.6),
                      AppColors.primaryBackground.withValues(alpha: 0.45),
                      AppColors.secondaryBackground.withValues(alpha: 0.3),
                      Colors.transparent,
                    ],
                    stops: const [0.0, 0.3, 0.6, 1.0],
                  ),
                ),
              ),
            ),
            
            // ENHANCED ADDITIONAL NEON GLOW - Bottom right
            Positioned.fill(
              child: Container(
                decoration: BoxDecoration(
                  gradient: RadialGradient(
                    center: const Alignment(0.7, 0.5),
                    radius: 1.3,
                    colors: [
                      AppColors.secondaryBackground.withValues(alpha: 0.65),
                      AppColors.tertiaryBackground.withValues(alpha: 0.5),
                      AppColors.primaryBackground.withValues(alpha: 0.3),
                      Colors.transparent,
                    ],
                    stops: const [0.0, 0.4, 0.7, 1.0],
                  ),
                ),
              ),
            ),
            
            // DIAGONAL NEON SWEEP - Enhanced for splash
            Positioned.fill(
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: const Alignment(-1.0, -1.0),
                    end: const Alignment(1.0, 1.0),
                    colors: [
                      AppColors.accent.withValues(alpha: 0.25),
                      Colors.transparent,
                      AppColors.primaryBackground.withValues(alpha: 0.2),
                      Colors.transparent,
                      AppColors.secondaryBackground.withValues(alpha: 0.25),
                      Colors.transparent,
                      AppColors.tertiaryBackground.withValues(alpha: 0.2),
                    ],
                    stops: const [0.0, 0.16, 0.33, 0.5, 0.66, 0.83, 1.0],
                  ),
                ),
              ),
            ),
            
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // NEON SPLASH LOGO - ENHANCED GLOW
                  Container(
                    width: 140,
                    height: 140,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(35),
                      // ENHANCED NEON GLOW SHADOWS - Splash version
                      boxShadow: [
                        // Inner intense neon glow
                        BoxShadow(
                          color: AppColors.accent.withValues(alpha: 0.9),
                          blurRadius: 50,
                          spreadRadius: 0,
                          offset: const Offset(0, 0),
                        ),
                        // Mid neon glow
                        BoxShadow(
                          color: AppColors.primaryBackground.withValues(alpha: 0.7),
                          blurRadius: 70,
                          spreadRadius: 15,
                          offset: const Offset(0, 0),
                        ),
                        // Outer neon glow
                        BoxShadow(
                          color: AppColors.secondaryBackground.withValues(alpha: 0.5),
                          blurRadius: 90,
                          spreadRadius: 25,
                          offset: const Offset(0, 0),
                        ),
                        // Extended outer glow
                        BoxShadow(
                          color: AppColors.tertiaryBackground.withValues(alpha: 0.3),
                          blurRadius: 110,
                          spreadRadius: 35,
                          offset: const Offset(0, 0),
                        ),
                        // Depth shadow
                        BoxShadow(
                          color: AppColors.tertiaryBackground.withValues(alpha: 0.4),
                          blurRadius: 30,
                          spreadRadius: 8,
                          offset: const Offset(0, 8),
                        ),
                      ],
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(35),
                      child: Stack(
                        children: [
                          // Logo image
                          Image.asset(
                            'assets/images/logo.jpeg',
                            width: 140,
                            height: 140,
                            fit: BoxFit.cover,
                            errorBuilder: (context, error, stackTrace) {
                              return Container(
                                width: 140,
                                height: 140,
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                    begin: Alignment.topLeft,
                                    end: Alignment.bottomRight,
                                    colors: [
                                      AppColors.accent,
                                      AppColors.primaryBackground,
                                      AppColors.secondaryBackground,
                                    ],
                                  ),
                                  borderRadius: BorderRadius.circular(35),
                                ),
                                child: const Center(
                                  child: Text(
                                    'T',
                                    style: TextStyle(
                                      fontSize: 64,
                                      fontWeight: FontWeight.w900,
                                      color: Colors.white,
                                      letterSpacing: -3,
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                          // ENHANCED NEON BLEND OVERLAY
                          Container(
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: [
                                  // Enhanced neon pink tint at top
                                  AppColors.accent.withValues(alpha: 0.3),
                                  Colors.transparent,
                                  // Enhanced neon purple tint at bottom
                                  AppColors.tertiaryBackground.withValues(alpha: 0.35),
                                ],
                                stops: const [0.0, 0.5, 1.0],
                              ),
                              borderRadius: BorderRadius.circular(35),
                            ),
                          ),
                          // RADIAL NEON GLOW OVERLAY
                          Container(
                            decoration: BoxDecoration(
                              gradient: RadialGradient(
                                center: const Alignment(0.0, 0.0),
                                radius: 1.2,
                                colors: [
                                  Colors.transparent,
                                  AppColors.primaryBackground.withValues(alpha: 0.2),
                                  AppColors.accent.withValues(alpha: 0.25),
                                ],
                                stops: const [0.0, 0.5, 1.0],
                              ),
                              borderRadius: BorderRadius.circular(35),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  
                  const SizedBox(height: 60),
                  
                  // Tagline with modern styling - matching landing page style
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                    decoration: BoxDecoration(
                      color: AppColors.overlayMedium,
                      borderRadius: BorderRadius.circular(25),
                      border: Border.all(
                        color: AppColors.whiteText.withValues(alpha: 0.2),
                        width: 1,
                      ),
                    ),
                    child: const Text(
                      'Voice • Video • Connect',
                      style: TextStyle(
                        fontSize: 16,
                        color: AppColors.whiteText,
                        letterSpacing: 2,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  
                  const SizedBox(height: 80),
                  
                  // Professional loading indicator
                  Container(
                    width: 32,
                    height: 32,
                    child: CircularProgressIndicator(
                      strokeWidth: 3,
                      valueColor: const AlwaysStoppedAnimation<Color>(
                        AppColors.whiteText,
                      ),
                      backgroundColor: AppColors.whiteText.withValues(alpha: 0.3),
                    ),
                  ),
                  
                  const SizedBox(height: 20),
                  
                  Text(
                    'Loading...',
                    style: TextStyle(
                      fontSize: 14,
                      color: AppColors.secondaryText,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}