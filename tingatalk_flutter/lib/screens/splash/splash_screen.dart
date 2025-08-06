import 'package:flutter/material.dart';
import '../../design_system/colors.dart';
import '../../design_system/typography.dart';
import '../../widgets/common/flowing_background.dart';
import '../../widgets/common/tinga_logo.dart';
import '../onboarding/onboarding_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    
    // Navigate to onboarding after 3 seconds
    Future.delayed(const Duration(seconds: 3), () {
      if (mounted) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const OnboardingScreen(),
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
            colors: AppColors.primaryGradient,
          ),
        ),
        child: Stack(
          children: [
            // Modern gradient overlay for depth - SAME AS LANDING PAGE
            Positioned.fill(
              child: Container(
                decoration: BoxDecoration(
                  gradient: RadialGradient(
                    center: const Alignment(0.3, -0.4),
                    radius: 1.2,
                    colors: [
                      AppColors.accent.withValues(alpha: 0.3),
                      AppColors.primaryBackground.withValues(alpha: 0.2),
                      Colors.transparent,
                    ],
                  ),
                ),
              ),
            ),
            
            // Subtle pattern overlay - SAME AS LANDING PAGE
            Positioned.fill(
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      AppColors.overlayLight,
                      Colors.transparent,
                      AppColors.overlayLight,
                    ],
                  ),
                ),
              ),
            ),
            
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // COMPLETELY CAMOUFLAGED LOGO - SWAPPED DUAL-TONE
                  Container(
                    width: 140,
                    height: 140,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(35),
                      // SWAPPED DUAL-TONE - Perfect camouflage
                      boxShadow: [
                        BoxShadow(
                          color: AppColors.accent.withValues(alpha: 0.9), // SWAPPED: Lighter pink at top
                          blurRadius: 60,
                          spreadRadius: 15,
                          offset: const Offset(0, -20), // Shadow upward
                        ),
                        BoxShadow(
                          color: AppColors.tertiaryBackground.withValues(alpha: 0.8), // SWAPPED: Darker pink at bottom
                          blurRadius: 50,
                          spreadRadius: 12,
                          offset: const Offset(0, 20), // Shadow downward
                        ),
                        // Additional camouflage layers
                        BoxShadow(
                          color: AppColors.primaryBackground.withValues(alpha: 0.7),
                          blurRadius: 70,
                          spreadRadius: 18,
                          offset: const Offset(0, 0), // All around glow
                        ),
                      ],
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(35),
                      child: Stack(
                        children: [
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
                                  gradient: const LinearGradient(
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter,
                                    colors: AppColors.logoGradient,
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
                          // PERFECT CAMOUFLAGE - SWAPPED gradient overlay
                          Container(
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: [
                                  // SWAPPED: Lighter pink at top
                                  AppColors.accent.withValues(alpha: 0.5),
                                  Colors.transparent,
                                  // SWAPPED: Darker pink at bottom
                                  AppColors.tertiaryBackground.withValues(alpha: 0.6),
                                ],
                                stops: const [0.0, 0.4, 1.0],
                              ),
                              borderRadius: BorderRadius.circular(35),
                            ),
                          ),
                          // Additional blending layer for complete camouflage
                          Container(
                            decoration: BoxDecoration(
                              gradient: RadialGradient(
                                center: const Alignment(0.0, 0.0),
                                radius: 0.9,
                                colors: [
                                  Colors.transparent,
                                  AppColors.primaryBackground.withValues(alpha: 0.4),
                                  AppColors.secondaryBackground.withValues(alpha: 0.3),
                                ],
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