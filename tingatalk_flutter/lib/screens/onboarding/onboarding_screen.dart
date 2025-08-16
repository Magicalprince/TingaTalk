import 'package:flutter/material.dart';
import '../../design_system/colors.dart';
import '../../design_system/typography.dart';
import '../../design_system/spacing.dart';
import '../../widgets/common/flowing_background.dart';
import '../../widgets/common/tinga_logo.dart';
import '../auth/login_screen.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({Key? key}) : super(key: key);

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  late final List<OnboardingData> _onboardingData;

  Widget _buildVideoCallIcon() {
    return Container(
      width: 60,
      height: 60,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        gradient: LinearGradient(
          colors: [
            AppColors.accent.withValues(alpha: 0.9),
            AppColors.primaryBackground.withValues(alpha: 0.7),
          ],
        ),
        boxShadow: [
          BoxShadow(
            color: AppColors.accent.withValues(alpha: 0.3),
            blurRadius: 8,
            spreadRadius: 2,
          ),
        ],
      ),
      child: const Icon(
        Icons.videocam_outlined,
        size: 30,
        color: Colors.white,
      ),
    );
  }

  Widget _buildConnectionIcon() {
    return Container(
      width: 60,
      height: 60,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        gradient: LinearGradient(
          colors: [
            AppColors.secondaryBackground.withValues(alpha: 0.9),
            AppColors.accentLight.withValues(alpha: 0.7),
          ],
        ),
        boxShadow: [
          BoxShadow(
            color: AppColors.secondaryBackground.withValues(alpha: 0.3),
            blurRadius: 8,
            spreadRadius: 2,
          ),
        ],
      ),
      child: const Icon(
        Icons.people_outline,
        size: 30,
        color: Colors.white,
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    _onboardingData = [
      OnboardingData(
        title: "Safe Voice & Video Calls",
        subtitle: "Connect with strangers through secure voice and video calls. Meet new people in a safe, transparent environment.",
        customIcon: _buildVideoCallIcon(),
      ),
      OnboardingData(
        title: "Authentic Connections",
        subtitle: "Build genuine friendships and meaningful conversations. Share experiences and connect with people worldwide.",
        customIcon: _buildConnectionIcon(),
      ),
    ];
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _nextPage() {
    if (_currentPage < _onboardingData.length - 1) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    } else {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const LoginScreen()),
      );
    }
  }

  void _skipOnboarding() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const LoginScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: AppColors.primaryGradient,
            stops: [0.0, 0.3, 0.7, 1.0],
          ),
        ),
        child: Stack(
          children: [
            // Simplified purple overlay for consistency
            Positioned.fill(
              child: Container(
                decoration: BoxDecoration(
                  gradient: RadialGradient(
                    center: const Alignment(0.0, -0.3),
                    radius: 1.5,
                    colors: [
                      AppColors.accent.withValues(alpha: 0.3),
                      Colors.transparent,
                    ],
                    stops: const [0.0, 1.0],
                  ),
                ),
              ),
            ),
            
            SafeArea(
              child: Column(
                children: [
                  // Skip button
                  Padding(
                    padding: const EdgeInsets.all(24),
                    child: Align(
                      alignment: Alignment.topRight,
                      child: TextButton(
                        onPressed: _skipOnboarding,
                        child: Text(
                          'Skip',
                          style: TextStyle(
                            fontSize: 16,
                            color: AppColors.whiteText.withValues(alpha: 0.8),
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                  ),
                  
                  // PROFESSIONAL ONBOARDING LOGO - CLEAN & BUSINESS-READY
                  Container(
                    width: 110,
                    height: 110,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(28),
                      // PROFESSIONAL SHADOWS - Clean like "My Village"
                      boxShadow: [
                        // Main pink glow that matches background
                        BoxShadow(
                          color: AppColors.primaryBackground.withValues(alpha: 0.45),
                          blurRadius: 35,
                          spreadRadius: 10,
                          offset: const Offset(0, 0),
                        ),
                        // Depth shadow
                        BoxShadow(
                          color: AppColors.tertiaryBackground.withValues(alpha: 0.35),
                          blurRadius: 20,
                          spreadRadius: 5,
                          offset: const Offset(0, 5),
                        ),
                      ],
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(28),
                      child: Stack(
                        children: [
                          // Logo image
                          Image.asset(
                            'assets/images/logo3.png',
                            width: 110,
                            height: 110,
                            fit: BoxFit.cover,
                            errorBuilder: (context, error, stackTrace) {
                              return Container(
                                width: 110,
                                height: 110,
                                decoration: BoxDecoration(
                                  gradient: const LinearGradient(
                                    begin: Alignment.topLeft,
                                    end: Alignment.bottomRight,
                                    colors: AppColors.logoGradient,
                                  ),
                                  borderRadius: BorderRadius.circular(28),
                                ),
                                child: const Center(
                                  child: Text(
                                    'T',
                                    style: TextStyle(
                                      fontSize: 50,
                                      fontWeight: FontWeight.w900,
                                      color: Colors.white,
                                      letterSpacing: -2,
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                          // CLEAN BLEND OVERLAY - Matches background
                          Container(
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: [
                                  AppColors.accentLight.withValues(alpha: 0.15),
                                  Colors.transparent,
                                  AppColors.accentDark.withValues(alpha: 0.20),
                                ],
                                stops: const [0.0, 0.5, 1.0],
                              ),
                              borderRadius: BorderRadius.circular(28),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
              
              const SizedBox(height: AppSpacing.lg),
              
              // PageView
              Expanded(
                child: PageView.builder(
                  controller: _pageController,
                  onPageChanged: (index) {
                    setState(() {
                      _currentPage = index;
                    });
                  },
                  itemCount: _onboardingData.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: AppSpacing.xl),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          // Custom Icon
                          Container(
                            width: 100,
                            height: 100,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              gradient: LinearGradient(
                                colors: [
                                  AppColors.accent.withValues(alpha: 0.2),
                                  AppColors.primaryBackground.withValues(alpha: 0.2),
                                ],
                              ),
                            ),
                            child: Center(
                              child: _onboardingData[index].customIcon,
                            ),
                          ),
                          
                          const SizedBox(height: AppSpacing.xl),
                          
                          // Title
                          Text(
                            _onboardingData[index].title,
                            style: AppTypography.headline1.copyWith(
                              fontSize: 28,
                              fontWeight: FontWeight.w700,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          
                          const SizedBox(height: AppSpacing.md),
                          
                          // Subtitle
                          Text(
                            _onboardingData[index].subtitle,
                            style: AppTypography.subtitle1.copyWith(
                              fontSize: 16,
                              height: 1.5,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
              
              // Page indicators
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  _onboardingData.length,
                  (index) => Container(
                    margin: const EdgeInsets.symmetric(horizontal: 4),
                    width: _currentPage == index ? 24 : 8,
                    height: 8,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4),
                      color: _currentPage == index
                          ? AppColors.accent
                          : AppColors.whiteText.withValues(alpha: 0.3),
                    ),
                  ),
                ),
              ),
              
              const SizedBox(height: AppSpacing.xl),
              
              // Next/Get Started button - SAME STYLE AS LANDING PAGE
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: SizedBox(
                  width: double.infinity,
                  height: 56,
                  child: Container(
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
                      onPressed: _nextPage,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.buttonBackground,
                        foregroundColor: AppColors.buttonText,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(28),
                        ),
                        elevation: 0,
                        shadowColor: Colors.transparent,
                      ),
                      child: Text(
                        _currentPage == _onboardingData.length - 1
                            ? 'Get Started'
                            : 'Next',
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
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
}

class OnboardingData {
  final String title;
  final String subtitle;
  final Widget customIcon;

  OnboardingData({
    required this.title,
    required this.subtitle,
    required this.customIcon,
  });
}