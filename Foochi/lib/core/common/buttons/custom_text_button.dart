import 'package:flutter/material.dart';
import 'package:foochi/core/utils/utils.dart';

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
    return TextButton(
      onPressed: onPressed,
      style: TextButton.styleFrom(padding: EdgeInsets.zero),
      child: Text(
        text,
        style: AppTypography.kLight14.copyWith(
          color: color ?? AppColors.kPrimary,
          fontSize: fontSize,
        ),
      ),
    );
  }
}
