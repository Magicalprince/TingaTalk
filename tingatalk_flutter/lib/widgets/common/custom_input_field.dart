import 'package:flutter/material.dart';
import '../../design_system/colors.dart';
import '../../design_system/typography.dart';
import '../../design_system/spacing.dart';

class CustomInputField extends StatelessWidget {
  final String placeholder;
  final TextEditingController? controller;
  final TextInputType inputType;
  final bool obscureText;
  final Function(String)? onChanged;
  final String? errorText;

  const CustomInputField({
    Key? key,
    required this.placeholder,
    this.controller,
    this.inputType = TextInputType.text,
    this.obscureText = false,
    this.onChanged,
    this.errorText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 179,
          height: 27,
          decoration: const BoxDecoration(color: AppColors.primaryBackground),
          child: Container(
            width: double.infinity,
            height: 27,
            padding: const EdgeInsets.symmetric(horizontal: AppSpacing.inputPadding),
            decoration: ShapeDecoration(
              color: AppColors.inputBackground,
              shape: RoundedRectangleBorder(
                side: const BorderSide(
                  width: 2,
                  color: AppColors.inputBorder,
                ),
                borderRadius: BorderRadius.circular(AppSpacing.radiusSmall),
              ),
              shadows: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.2),
                  blurRadius: 8,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: Center(
              child: TextField(
                controller: controller,
                keyboardType: inputType,
                obscureText: obscureText,
                onChanged: onChanged,
                style: AppTypography.inputText,
                textAlignVertical: TextAlignVertical.center,
                decoration: InputDecoration(
                  hintText: placeholder,
                  hintStyle: AppTypography.inputPlaceholder,
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.zero,
                  isDense: true,
                ),
              ),
            ),
          ),
        ),
        if (errorText != null)
          Padding(
            padding: const EdgeInsets.only(top: 4),
            child: Text(
              errorText!,
              style: const TextStyle(
                color: Colors.red,
                fontSize: 12,
              ),
            ),
          ),
      ],
    );
  }
}