import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ngamar/core/core.dart';

class CustomOTPTextField extends StatelessWidget {
  final Function(String) onOTPInput;
  const CustomOTPTextField({required this.onOTPInput, super.key});

  @override
  Widget build(BuildContext context) {
    return OtpTextField(
      handleControllers: (controllers) {},
      borderColor: AppColors.kPrimary,
      focusedBorderColor: AppColors.kPrimary,
      disabledBorderColor: Colors.transparent,
      enabledBorderColor: Colors.transparent,
      borderRadius: BorderRadius.circular(20.r),
      margin: EdgeInsets.symmetric(horizontal: 10.w),
      showFieldAsBox: true,
      borderWidth: 0.5.w,
      filled: true,
      fillColor: const Color(0xFFF6F6F6),
      fieldWidth: 56.w,
      styles: [
        AppTypography.kSemiBold24,
        AppTypography.kSemiBold24,
        AppTypography.kSemiBold24,
        AppTypography.kSemiBold24,
      ],
      onSubmit: onOTPInput,
    );
  }
}
