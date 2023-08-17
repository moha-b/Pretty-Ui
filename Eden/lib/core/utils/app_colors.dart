import 'package:flutter/material.dart';

class AppColors {
  static const Color kPrimary = Color(0xFF329494);
  static const Color kAccent1 = Color(0xFFFCCBB9);
  static const Color kAccent2 = Color(0xFFB9C2FC);
  static const Color kAccent3 = Color(0xFFEEB8D8);
  static const Color kAccent4 = Color(0xFF6AC6C5);
  static const Color kSecondary = Color(0xFF1D2445);
  static const Color kSuccess = Color(0xFF329447);
  static const Color kGrey = Color(0xFF0000004D);
  static const Color kLine = Color(0xFF1D244533);
  //
  static const Color kWhite = Color(0xFFFFFFFF);
  static const Color kLightPink = Color(0xFFF5D3BB);
  static const Color kLightPink2 = Color(0xFFFFE2CD);
  static const Color kLightBrown = Color(0xFF73665C);

  static BoxShadow defaultShadow = BoxShadow(
    color: AppColors.kPrimary.withOpacity(0.2),
    blurRadius: 7,
    offset: const Offset(0, 5),
  );

  static BoxShadow darkShadow = BoxShadow(
    color: AppColors.kSecondary.withOpacity(0.2),
    blurRadius: 7,
    offset: const Offset(0, 5),
  );
}
