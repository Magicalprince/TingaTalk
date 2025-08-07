import 'package:flutter/material.dart';
import '../../design_system/colors.dart';

/// A widget that showcases the enhanced neon gradient effects
/// Used to demonstrate the purple screen inspired gradient system
class NeonGradientShowcase extends StatelessWidget {
  const NeonGradientShowcase({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color(0xFFE91E63), // Bright Pink
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
          // PRIMARY NEON RADIAL GLOW - Center
          Positioned.fill(
            child: Container(
              decoration: BoxDecoration(
                gradient: RadialGradient(
                  center: const Alignment(0.0, 0.0),
                  radius: 1.5,
                  colors: [
                    AppColors.accent.withValues(alpha: 0.8),
                    AppColors.primaryBackground.withValues(alpha: 0.6),
                    AppColors.secondaryBackground.withValues(alpha: 0.4),
                    AppColors.tertiaryBackground.withValues(alpha: 0.3),
                    Colors.transparent,
                  ],
                  stops: const [0.0, 0.2, 0.4, 0.6, 1.0],
                ),
              ),
            ),
          ),
          
          // SECONDARY NEON GLOW - Top Left
          Positioned.fill(
            child: Container(
              decoration: BoxDecoration(
                gradient: RadialGradient(
                  center: const Alignment(-0.8, -0.8),
                  radius: 1.2,
                  colors: [
                    AppColors.accent.withValues(alpha: 0.6),
                    AppColors.primaryBackground.withValues(alpha: 0.4),
                    Colors.transparent,
                  ],
                  stops: const [0.0, 0.5, 1.0],
                ),
              ),
            ),
          ),
          
          // TERTIARY NEON GLOW - Bottom Right
          Positioned.fill(
            child: Container(
              decoration: BoxDecoration(
                gradient: RadialGradient(
                  center: const Alignment(0.8, 0.8),
                  radius: 1.0,
                  colors: [
                    AppColors.secondaryBackground.withValues(alpha: 0.7),
                    AppColors.tertiaryBackground.withValues(alpha: 0.5),
                    Colors.transparent,
                  ],
                  stops: const [0.0, 0.6, 1.0],
                ),
              ),
            ),
          ),
          
          // DIAGONAL NEON SWEEP - Main
          Positioned.fill(
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: const Alignment(-1.0, -1.0),
                  end: const Alignment(1.0, 1.0),
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
          
          // CROSS DIAGONAL NEON SWEEP
          Positioned.fill(
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: const Alignment(-1.0, 1.0),
                  end: const Alignment(1.0, -1.0),
                  colors: [
                    Colors.transparent,
                    AppColors.primaryBackground.withValues(alpha: 0.25),
                    Colors.transparent,
                    AppColors.accent.withValues(alpha: 0.3),
                    Colors.transparent,
                    AppColors.secondaryBackground.withValues(alpha: 0.25),
                    Colors.transparent,
                  ],
                  stops: const [0.0, 0.16, 0.33, 0.5, 0.66, 0.83, 1.0],
                ),
              ),
            ),
          ),
          
          // PULSING NEON SPOTS - Additional depth
          Positioned.fill(
            child: Container(
              decoration: BoxDecoration(
                gradient: RadialGradient(
                  center: const Alignment(0.3, -0.6),
                  radius: 0.8,
                  colors: [
                    AppColors.accent.withValues(alpha: 0.5),
                    AppColors.primaryBackground.withValues(alpha: 0.3),
                    Colors.transparent,
                  ],
                  stops: const [0.0, 0.4, 1.0],
                ),
              ),
            ),
          ),
          
          Positioned.fill(
            child: Container(
              decoration: BoxDecoration(
                gradient: RadialGradient(
                  center: const Alignment(-0.4, 0.7),
                  radius: 0.6,
                  colors: [
                    AppColors.secondaryBackground.withValues(alpha: 0.6),
                    AppColors.tertiaryBackground.withValues(alpha: 0.4),
                    Colors.transparent,
                  ],
                  stops: const [0.0, 0.5, 1.0],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

/// A simpler version for subtle neon effects
class SubtleNeonGradient extends StatelessWidget {
  final Widget child;
  
  const SubtleNeonGradient({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Base gradient background
        Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color(0xFFE91E63),
                Color(0xFFAD1457),
                Color(0xFF8E24AA),
                Color(0xFF673AB7),
                Color(0xFF4A148C),
              ],
              stops: [0.0, 0.25, 0.5, 0.75, 1.0],
            ),
          ),
        ),
        
        // Subtle neon overlay
        Container(
          decoration: BoxDecoration(
            gradient: RadialGradient(
              center: const Alignment(0.0, -0.3),
              radius: 1.5,
              colors: [
                AppColors.accent.withValues(alpha: 0.4),
                AppColors.primaryBackground.withValues(alpha: 0.25),
                Colors.transparent,
              ],
              stops: const [0.0, 0.5, 1.0],
            ),
          ),
        ),
        
        // Content
        child,
      ],
    );
  }
}