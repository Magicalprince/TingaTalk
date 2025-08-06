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
            colors: AppColors.primaryGradient,
          ),
        ),
        child: Stack(
          children: [
            // Modern gradient overlay for depth
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
            
            // Subtle pattern overlay
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
            
            SafeArea(
              child: Column(
                children: [
                  // COMPLETELY CAMOUFLAGED LOGO - SWAPPED DUAL-TONE
                  Padding(
                    padding: const EdgeInsets.all(24),
                    child: Center(
                      child: Container(
                        width: 100,
                        height: 100,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                          // SWAPPED DUAL-TONE - Perfect camouflage
                          boxShadow: [
                            BoxShadow(
                              color: AppColors.accent.withValues(alpha: 0.9), // SWAPPED: Lighter pink at top
                              blurRadius: 50,
                              spreadRadius: 12,
                              offset: const Offset(0, -15), // Shadow upward
                            ),
                            BoxShadow(
                              color: AppColors.tertiaryBackground.withValues(alpha: 0.8), // SWAPPED: Darker pink at bottom
                              blurRadius: 40,
                              spreadRadius: 8,
                              offset: const Offset(0, 15), // Shadow downward
                            ),
                            // Additional camouflage layers
                            BoxShadow(
                              color: AppColors.primaryBackground.withValues(alpha: 0.6),
                              blurRadius: 60,
                              spreadRadius: 15,
                              offset: const Offset(0, 0), // All around glow
                            ),
                          ],
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(25),
                          child: Stack(
                            children: [
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
                                      gradient: const LinearGradient(
                                        begin: Alignment.topCenter,
                                        end: Alignment.bottomCenter,
                                        colors: AppColors.logoGradient,
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
                              // PERFECT CAMOUFLAGE - SWAPPED gradient overlay
                              Container(
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter,
                                    colors: [
                                      // SWAPPED: Lighter pink at top
                                      AppColors.accent.withValues(alpha: 0.4),
                                      Colors.transparent,
                                      // SWAPPED: Darker pink at bottom
                                      AppColors.tertiaryBackground.withValues(alpha: 0.5),
                                    ],
                                    stops: const [0.0, 0.4, 1.0],
                                  ),
                                  borderRadius: BorderRadius.circular(25),
                                ),
                              ),
                              // Additional blending layer for complete camouflage
                              Container(
                                decoration: BoxDecoration(
                                  gradient: RadialGradient(
                                    center: const Alignment(0.0, 0.0),
                                    radius: 0.8,
                                    colors: [
                                      Colors.transparent,
                                      AppColors.primaryBackground.withValues(alpha: 0.3),
                                      AppColors.secondaryBackground.withValues(alpha: 0.2),
                                    ],
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