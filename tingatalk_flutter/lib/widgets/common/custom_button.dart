import 'package:flutter/material.dart';
import '../../design_system/colors.dart';
import '../../design_system/typography.dart';
import '../../design_system/spacing.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final bool isEnabled;
  final bool isLarge;
  final Widget? icon;

  const CustomButton({
    Key? key,
    required this.text,
    this.onPressed,
    this.isEnabled = true,
    this.isLarge = false,
    this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: isEnabled ? onPressed : null,
      child: Container(
        width: 122,
        height: AppSpacing.buttonHeight,
        child: Stack(
          children: [
            Positioned(
              left: 4,
              top: 5,
              child: Container(
                width: 115,
                height: 33,
                decoration: ShapeDecoration(
                  color: isEnabled ? AppColors.buttonBackground : AppColors.buttonBackground.withValues(alpha: 0.5),
                  shape: RoundedRectangleBorder(
                    side: BorderSide(
                      width: 1,
                      color: isEnabled ? AppColors.buttonBorder : AppColors.buttonBorder.withValues(alpha: 0.5),
                    ),
                    borderRadius: BorderRadius.circular(AppSpacing.radiusMedium),
                  ),
                  shadows: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.1),
                      blurRadius: 4,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
              ),
            ),
            if (icon != null)
              Positioned(
                right: 8,
                top: 16,
                child: SizedBox(
                  width: 9,
                  height: 9,
                  child: icon,
                ),
              ),
            Positioned(
              left: 20,
              top: isLarge ? 15 : 13,
              child: Text(
                text,
                style: isLarge ? AppTypography.buttonTextLarge : AppTypography.buttonText,
              ),
            ),
          ],
        ),
      ),
    );
  }
}