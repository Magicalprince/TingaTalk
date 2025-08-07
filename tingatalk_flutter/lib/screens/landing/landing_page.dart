import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../design_system/colors.dart';
import '../../design_system/typography.dart';
import '../../design_system/spacing.dart';
import '../../widgets/common/tinga_logo.dart';
import '../auth/phone_number_screen.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({Key? key}) : super(key: key);

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
            // ENHANCED NEON GRADIENT OVERLAY - More visible
            Positioned.fill(
              child: Container(
                decoration: BoxDecoration(
                  gradient: RadialGradient(
                    center: const Alignment(0.0, -0.4),
                    radius: 1.8,
                    colors: [
                      // Much more visible neon pink center
                      AppColors.accent.withValues(alpha: 0.7),
                      AppColors.primaryBackground.withValues(alpha: 0.55),
                      AppColors.secondaryBackground.withValues(alpha: 0.4),
                      AppColors.tertiaryBackground.withValues(alpha: 0.25),
                      Colors.transparent,
                    ],
                    stops: const [0.0, 0.25, 0.5, 0.75, 1.0],
                  ),
                ),
              ),
            ),
            
            // ENHANCED NEON GLOW PATTERN - More visible
            Positioned.fill(
              child: Container(
                decoration: BoxDecoration(
                  gradient: RadialGradient(
                    center: const Alignment(-0.5, 0.3),
                    radius: 1.2,
                    colors: [
                      AppColors.accent.withValues(alpha: 0.5),
                      AppColors.primaryBackground.withValues(alpha: 0.35),
                      AppColors.secondaryBackground.withValues(alpha: 0.2),
                      Colors.transparent,
                    ],
                    stops: const [0.0, 0.3, 0.6, 1.0],
                  ),
                ),
              ),
            ),
            
            // ENHANCED RIGHT SIDE NEON GLOW
            Positioned.fill(
              child: Container(
                decoration: BoxDecoration(
                  gradient: RadialGradient(
                    center: const Alignment(0.6, -0.2),
                    radius: 1.0,
                    colors: [
                      AppColors.secondaryBackground.withValues(alpha: 0.55),
                      AppColors.tertiaryBackground.withValues(alpha: 0.4),
                      AppColors.primaryBackground.withValues(alpha: 0.25),
                      Colors.transparent,
                    ],
                    stops: const [0.0, 0.4, 0.7, 1.0],
                  ),
                ),
              ),
            ),
            
            // ENHANCED DIAGONAL NEON SWEEP - Much more visible
            Positioned.fill(
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: const Alignment(-0.8, -0.8),
                    end: const Alignment(0.8, 0.8),
                    colors: [
                      AppColors.accent.withValues(alpha: 0.4),
                      Colors.transparent,
                      AppColors.primaryBackground.withValues(alpha: 0.35),
                      Colors.transparent,
                      AppColors.secondaryBackground.withValues(alpha: 0.4),
                      Colors.transparent,
                      AppColors.tertiaryBackground.withValues(alpha: 0.3),
                      Colors.transparent,
                      AppColors.accent.withValues(alpha: 0.25),
                    ],
                    stops: const [0.0, 0.12, 0.25, 0.37, 0.5, 0.62, 0.75, 0.87, 1.0],
                  ),
                ),
              ),
            ),
            
            SafeArea(
              child: Column(
                children: [
                  // NEON LOGO - INSPIRED BY PURPLE SCREEN GRADIENT
                  Padding(
                    padding: const EdgeInsets.all(24),
                    child: Center(
                      child: Container(
                        width: 100,
                        height: 100,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                          // NEON GLOW SHADOWS - Like purple screen
                          boxShadow: [
                            // Inner neon glow
                            BoxShadow(
                              color: AppColors.accent.withValues(alpha: 0.8),
                              blurRadius: 40,
                              spreadRadius: 0,
                              offset: const Offset(0, 0),
                            ),
                            // Mid neon glow
                            BoxShadow(
                              color: AppColors.primaryBackground.withValues(alpha: 0.6),
                              blurRadius: 60,
                              spreadRadius: 10,
                              offset: const Offset(0, 0),
                            ),
                            // Outer neon glow
                            BoxShadow(
                              color: AppColors.secondaryBackground.withValues(alpha: 0.4),
                              blurRadius: 80,
                              spreadRadius: 20,
                              offset: const Offset(0, 0),
                            ),
                            // Depth shadow
                            BoxShadow(
                              color: AppColors.tertiaryBackground.withValues(alpha: 0.3),
                              blurRadius: 25,
                              spreadRadius: 5,
                              offset: const Offset(0, 6),
                            ),
                          ],
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(25),
                          child: Stack(
                            children: [
                              // Logo image
                              Image.asset(
                                'assets/images/logo.jpeg',
                                width: 100,
                                height: 100,
                                fit: BoxFit.cover,
                                errorBuilder: (context, error, stackTrace) {
                                  return Container(
                                    width: 100,
                                    height: 100,
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
                                      borderRadius: BorderRadius.circular(25),
                                    ),
                                    child: const Center(
                                      child: Text(
                                        'T',
                                        style: TextStyle(
                                          fontSize: 45,
                                          fontWeight: FontWeight.w900,
                                          color: Colors.white,
                                          letterSpacing: -2,
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              ),
                              // NEON BLEND OVERLAY - Matches neon background
                              Container(
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter,
                                    colors: [
                                      // Neon pink tint at top
                                      AppColors.accent.withValues(alpha: 0.25),
                                      Colors.transparent,
                                      // Neon purple tint at bottom
                                      AppColors.tertiaryBackground.withValues(alpha: 0.3),
                                    ],
                                    stops: const [0.0, 0.5, 1.0],
                                  ),
                                  borderRadius: BorderRadius.circular(25),
                                ),
                              ),
                              // ADDITIONAL NEON GLOW OVERLAY
                              Container(
                                decoration: BoxDecoration(
                                  gradient: RadialGradient(
                                    center: const Alignment(0.0, 0.0),
                                    radius: 1.0,
                                    colors: [
                                      Colors.transparent,
                                      AppColors.primaryBackground.withValues(alpha: 0.15),
                                      AppColors.accent.withValues(alpha: 0.2),
                                    ],
                                    stops: const [0.0, 0.6, 1.0],
                                  ),
                                  borderRadius: BorderRadius.circular(25),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  
                  const Spacer(),
                  
                  // Main content - Professional and engaging
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Main headline - Powerful and clear
                        const Text(
                          'Let Your\nDepression Go Away',
                          style: TextStyle(
                            fontSize: 52,
                            fontWeight: FontWeight.w800,
                            color: AppColors.whiteText,
                            height: 1.0,
                            letterSpacing: -1.0,
                          ),
                        ),
                        
                        const SizedBox(height: 20),
                        
                        // Subtitle - Clear value proposition
                        Text(
                          'Join the safest talk app with transparency!',
                          style: TextStyle(
                            fontSize: 18,
                            color: AppColors.secondaryText,
                            height: 1.4,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                  ),
                  
                  const SizedBox(height: 80),
                  
                  // Call-to-action section
                  Padding(
                    padding: const EdgeInsets.all(24),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // Primary CTA button
                        Expanded(
                          child: Container(
                            height: 56,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(28),
                              boxShadow: [
                                BoxShadow(
                                  color: AppColors.buttonShadow,
                                  blurRadius: 20,
                                  spreadRadius: 2,
                                  offset: const Offset(0, 8),
                                ),
                              ],
                            ),
                            child: ElevatedButton(
                              onPressed: () {
                                HapticFeedback.lightImpact();
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const PhoneNumberScreen(),
                                  ),
                                );
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: AppColors.buttonBackground,
                                foregroundColor: AppColors.buttonText,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(28),
                                ),
                                elevation: 0,
                                shadowColor: Colors.transparent,
                              ),
                              child: const Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'Get started',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  SizedBox(width: 8),
                                  Icon(
                                    Icons.arrow_forward,
                                    size: 20,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        
                        const SizedBox(width: 20),
                        
                        // Social login options
                        Row(
                          children: [
                            _buildSocialButton(
                              child: Container(
                                width: 24,
                                height: 24,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(4),
                                ),
                                child: const Center(
                                  child: Text(
                                    'G',
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w700,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                              ),
                              onTap: () {
                                // Google sign-in logic
                              },
                            ),
                            const SizedBox(width: 12),
                            _buildSocialButton(
                              child: const Icon(
                                Icons.apple,
                                color: Colors.white,
                                size: 24,
                              ),
                              onTap: () {
                                // Apple sign-in logic
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  
                  const SizedBox(height: 40),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSocialButton({
    required Widget child,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 48,
        height: 48,
        decoration: BoxDecoration(
          color: AppColors.overlayMedium,
          borderRadius: BorderRadius.circular(24),
          border: Border.all(
            color: AppColors.whiteText.withValues(alpha: 0.2),
            width: 1,
          ),
        ),
        child: Center(child: child),
      ),
    );
  }
}