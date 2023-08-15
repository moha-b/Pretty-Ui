import 'package:flutter/material.dart';

import '../../utils/utils.dart';

class CustomTextButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;
  final Color? color;
  final double? fontSize;
  const CustomTextButton({
    required this.onPressed,
    required this.text,
    this.fontSize,
    this.color,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    bool isDarkMode(BuildContext context) =>
        Theme.of(context).brightness == Brightness.dark;

    return TextButton(
      onPressed: onPressed,
      child: Text(
        text,
        style: AppTypography.kBold12.copyWith(
          color: color ??
              (isDarkMode(context) ? AppColors.kWhite : AppColors.kPrimary),
          fontSize: fontSize,
        ),
      ),
    );
  }
}
