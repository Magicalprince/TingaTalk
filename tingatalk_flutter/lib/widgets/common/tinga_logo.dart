import 'package:flutter/material.dart';
import '../../design_system/colors.dart';

class TingaLogo extends StatelessWidget {
  final double size;
  final bool showGlow;
  
  const TingaLogo({
    Key? key,
    this.size = 120,
    this.showGlow = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size * 0.6,
      child: Image.asset(
        'assets/images/logo3.png',
        width: size,
        height: size * 0.6,
        fit: BoxFit.contain,
        errorBuilder: (context, error, stackTrace) {
          // Big, visible fallback with gradient matching the theme
          return Container(
            width: size,
            height: size * 0.6,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(size * 0.1),
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  AppColors.primaryBackground,
                  AppColors.accent,
                  AppColors.accentLight,
                  AppColors.secondaryBackground,
                ],
                stops: const [0.0, 0.3, 0.7, 1.0],
              ),
              boxShadow: showGlow ? [
                BoxShadow(
                  color: AppColors.accent.withValues(alpha: 0.6),
                  blurRadius: 30,
                  spreadRadius: 10,
                ),
                BoxShadow(
                  color: AppColors.accentLight.withValues(alpha: 0.4),
                  blurRadius: 20,
                  spreadRadius: 5,
                ),
              ] : null,
            ),
            child: Center(
              child: Text(
                'Tinga',
                style: TextStyle(
                  fontSize: size * 0.2,
                  fontWeight: FontWeight.w900,
                  color: Colors.white,
                  fontFamily: 'Inter',
                  shadows: [
                    Shadow(
                      color: Colors.black.withValues(alpha: 0.8),
                      blurRadius: 6,
                      offset: const Offset(2, 2),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class TingaLogoIcon extends StatelessWidget {
  final double size;
  final bool showGlow;
  
  const TingaLogoIcon({
    Key? key,
    this.size = 80,
    this.showGlow = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(size * 0.2),
        child: Image.asset(
          'assets/images/logo3.png',
          width: size,
          height: size,
          fit: BoxFit.contain,
          errorBuilder: (context, error, stackTrace) {
            // Big, visible fallback icon with gradient
            return Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(size * 0.2),
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    AppColors.primaryBackground,
                    AppColors.accent,
                    AppColors.accentLight,
                  ],
                ),
                boxShadow: showGlow ? [
                  BoxShadow(
                    color: AppColors.accent.withValues(alpha: 0.5),
                    blurRadius: 20,
                    spreadRadius: 5,
                  ),
                ] : null,
              ),
              child: Center(
                child: Text(
                  'T',
                  style: TextStyle(
                    fontSize: size * 0.4,
                    fontWeight: FontWeight.w900,
                    color: Colors.white,
                    fontFamily: 'Inter',
                    shadows: [
                      Shadow(
                        color: Colors.black.withValues(alpha: 0.8),
                        blurRadius: 4,
                        offset: const Offset(2, 2),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}