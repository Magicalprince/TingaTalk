import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../design_system/colors.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: AppColors.primaryGradient,
            stops: [0.0, 0.3, 0.7, 1.0],
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Column(
              children: [
                const Spacer(flex: 2),
                
                // App logo/icon - matching onboarding screen style
                Container(
                  width: 85,
                  height: 85,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    // Professional shadows matching onboarding screen
                    boxShadow: [
                      // Main glow that matches background
                      BoxShadow(
                        color: AppColors.accentLight.withValues(alpha: 0.45),
                        blurRadius: 30,
                        spreadRadius: 8,
                        offset: const Offset(0, 0),
                      ),
                      // Depth shadow
                      BoxShadow(
                        color: AppColors.accentDark.withValues(alpha: 0.35),
                        blurRadius: 15,
                        spreadRadius: 3,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Stack(
                      children: [
                        // Logo image
                        Image.asset(
                          'assets/images/logo3.png',
                          width: 85,
                          height: 85,
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) {
                            return Container(
                              width: 85,
                              height: 85,
                              decoration: BoxDecoration(
                                gradient: const LinearGradient(
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                  colors: AppColors.logoGradient,
                                ),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: const Center(
                                child: Text(
                                  'T',
                                  style: TextStyle(
                                    fontSize: 40,
                                    fontWeight: FontWeight.w900,
                                    color: Colors.white,
                                    letterSpacing: -2,
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                        // Clean blend overlay - matches background
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
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                
                const SizedBox(height: 40),
                
                // Main title with romantic font
                Text(
                  'Find Your Perfect Connection',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.dancingScript(
                    color: const Color(0xFFF8EAF3),
                    fontSize: 32,
                    fontWeight: FontWeight.w700,
                    height: 1.2,
                    letterSpacing: 0.5,
                  ),
                ),
                
                const SizedBox(height: 16),
                
                // Subtitle text
                Text(
                  'Where meaningful conversations bloom into beautiful relationships ✨',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.poppins(
                    color: const Color(0xD8F9CDD1),
                    fontSize: 18,
                    fontWeight: FontWeight.w400,
                    height: 1.3,
                    letterSpacing: 0.2,
                  ),
                ),
                
                const Spacer(flex: 1),
                
                // Privacy feature card
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(16),
                  decoration: ShapeDecoration(
                    color: Colors.white.withValues(alpha: 0.06),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.27),
                    ),
                    shadows: const [
                      BoxShadow(
                        color: Color(0x0C000000),
                        blurRadius: 15.27,
                        offset: Offset(0, 1.27),
                        spreadRadius: 0,
                      )
                    ],
                  ),
                  child: Row(
                    children: [
                      Container(
                        width: 32,
                        height: 32,
                        decoration: ShapeDecoration(
                          gradient: RadialGradient(
                            center: const Alignment(0.50, 0.50),
                            radius: 0.98,
                            colors: [
                              Colors.white.withValues(alpha: 0.80), 
                              Colors.white.withValues(alpha: 0.30)
                            ],
                          ),
                          shape: RoundedRectangleBorder(
                            side: BorderSide(
                              width: 0.64,
                              color: Colors.white.withValues(alpha: 0.08),
                            ),
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        child: const Center(
                          child: Icon(
                            Icons.lock_outline,
                            color: Colors.white,
                            size: 16,
                          ),
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Your heart deserves privacy',
                              style: GoogleFonts.poppins(
                                color: Colors.white,
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                                height: 1.40,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              'Safe, secure, and authentic connections only.',
                              style: GoogleFonts.poppins(
                                color: const Color(0xD8F9CDD1),
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                                height: 1.40,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                
                const SizedBox(height: 24),
                
                // Get started button with animation
                _AnimatedButton(
                  onTap: () {
                    Navigator.pushReplacementNamed(context, '/login');
                  },
                  child: Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(vertical: 18),
                    decoration: ShapeDecoration(
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                      shadows: const [
                        BoxShadow(
                          color: Color(0x40000000),
                          blurRadius: 20,
                          offset: Offset(0, 8),
                          spreadRadius: 0,
                        )
                      ],
                    ),
                    child: Text(
                      'Start Your Journey',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.poppins(
                        color: const Color(0xFF2F0939),
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        height: 1.40,
                      ),
                    ),
                  ),
                ),
                
                const SizedBox(height: 40),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _AnimatedButton extends StatefulWidget {
  final VoidCallback onTap;
  final Widget child;

  const _AnimatedButton({
    required this.onTap,
    required this.child,
  });

  @override
  State<_AnimatedButton> createState() => _AnimatedButtonState();
}

class _AnimatedButtonState extends State<_AnimatedButton>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 150),
      vsync: this,
    );
    _scaleAnimation = Tween<double>(
      begin: 1.0,
      end: 0.95,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    ));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (_) => _controller.forward(),
      onTapUp: (_) {
        _controller.reverse();
        widget.onTap();
      },
      onTapCancel: () => _controller.reverse(),
      child: AnimatedBuilder(
        animation: _scaleAnimation,
        builder: (context, child) {
          return Transform.scale(
            scale: _scaleAnimation.value,
            child: widget.child,
          );
        },
      ),
    );
  }
}