import 'package:flutter/material.dart';
import '../../design_system/colors.dart';

class FlowingBackground extends StatelessWidget {
  final Widget child;
  
  const FlowingBackground({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      color: AppColors.primaryBackground,
      child: Stack(
        children: [
          // Static flowing background curves - no animations
          Stack(
            children: [
              // First flowing curve - deep blue to purple gradient (matching screen images)
              Positioned(
                top: -100,
                left: -150,
                child: Container(
                  width: 600,
                  height: 800,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        Colors.transparent,
                        AppColors.primaryBackground.withValues(alpha: 0.6),
                        AppColors.accent.withValues(alpha: 0.5),
                        AppColors.accentLight.withValues(alpha: 0.4),
                        Colors.transparent,
                      ],
                      stops: const [0.0, 0.2, 0.5, 0.8, 1.0],
                    ),
                    borderRadius: BorderRadius.circular(300),
                  ),
                ),
              ),
              
              // Second flowing curve - purple to pink gradient (matching screen images)
              Positioned(
                top: 200,
                right: -200,
                child: Container(
                  width: 500,
                  height: 700,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topRight,
                      end: Alignment.bottomLeft,
                      colors: [
                        Colors.transparent,
                        AppColors.secondaryBackground.withValues(alpha: 0.5),
                        AppColors.accent.withValues(alpha: 0.4),
                        AppColors.accentLight.withValues(alpha: 0.3),
                        Colors.transparent,
                      ],
                      stops: const [0.0, 0.3, 0.6, 0.8, 1.0],
                    ),
                    borderRadius: BorderRadius.circular(250),
                  ),
                ),
              ),
              
              // Third flowing curve - pink to magenta gradient (matching screen images)
              Positioned(
                bottom: -150,
                left: -100,
                child: Container(
                  width: 700,
                  height: 500,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.bottomLeft,
                      end: Alignment.topRight,
                      colors: [
                        Colors.transparent,
                        AppColors.accentLight.withValues(alpha: 0.4),
                        AppColors.accent.withValues(alpha: 0.3),
                        AppColors.secondaryBackground.withValues(alpha: 0.25),
                        Colors.transparent,
                      ],
                      stops: const [0.0, 0.25, 0.5, 0.75, 1.0],
                    ),
                    borderRadius: BorderRadius.circular(250),
                  ),
                ),
              ),
              
              // Additional curved flow - center accent (matching screen theme)
              Positioned(
                top: 200,
                left: 50,
                child: Container(
                  width: 400,
                  height: 200,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Colors.transparent,
                        AppColors.primaryBackground.withValues(alpha: 0.2),
                        AppColors.accent.withValues(alpha: 0.15),
                        Colors.transparent,
                      ],
                      stops: const [0.0, 0.3, 0.7, 1.0],
                    ),
                    borderRadius: BorderRadius.circular(100),
                  ),
                ),
              ),
              
              // Accent flow - right side (matching screen theme)
              Positioned(
                top: 300,
                right: -100,
                child: Container(
                  width: 300,
                  height: 150,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                      colors: [
                        Colors.transparent,
                        AppColors.secondaryBackground.withValues(alpha: 0.25),
                        AppColors.accentLight.withValues(alpha: 0.15),
                        Colors.transparent,
                      ],
                      stops: const [0.0, 0.4, 0.8, 1.0],
                    ),
                    borderRadius: BorderRadius.circular(75),
                  ),
                ),
              ),
            ],
          ),
          
          // Content overlay
          child,
        ],
      ),
    );
  }
}