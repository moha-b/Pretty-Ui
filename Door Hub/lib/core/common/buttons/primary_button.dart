import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../utils/utils.dart';
import '../animations/button_animation.dart';

class PrimaryButton extends StatelessWidget {
  final VoidCallback onTap;
  final String text;
  final double? width;
  final double? height;
  final double? borderRadius;
  final double? fontSize;
  final Color? color;
  final bool isBorder;
  const PrimaryButton({
    required this.onTap,
    required this.text,
    this.height,
    this.width,
    this.borderRadius,
    this.isBorder = false,
    this.fontSize,
    this.color,
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    bool isDarkMode(BuildContext context) =>
        Theme.of(context).brightness == Brightness.dark;

    return ButtonAnimation(
      onTap: onTap,
      child: Container(
        height: height ?? 55.h,
        alignment: Alignment.center,
        width: width ?? double.maxFinite,
        decoration: BoxDecoration(
            color: color ?? AppColors.kPrimary,
            borderRadius:
                BorderRadius.circular(borderRadius ?? AppSpacing.radiusTen),
            border: isBorder ? Border.all(color: AppColors.kHint) : null),
        child: Text(
          text,
          style: AppTypography.kBold15.copyWith(
            color: color == null
                ? Colors.white
                : isDarkMode(context)
                    ? AppColors.kWhite
                    : Colors.black,
            fontSize: fontSize,
          ),
        ),
      ),
    );
  }
}
