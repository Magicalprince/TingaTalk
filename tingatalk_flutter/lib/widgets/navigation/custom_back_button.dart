import 'package:flutter/material.dart';
import '../../design_system/typography.dart';

class CustomBackButton extends StatelessWidget {
  final VoidCallback? onPressed;

  const CustomBackButton({
    Key? key,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed ?? () => Navigator.of(context).pop(),
      child: Container(
        height: 12,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              '􀆉', // SF Symbols back arrow
              style: AppTypography.backButtonText,
            ),
            const SizedBox(width: 4),
            const Text(
              'Back',
              style: AppTypography.backButtonLabel,
            ),
          ],
        ),
      ),
    );
  }
}