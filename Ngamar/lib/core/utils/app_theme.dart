import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'utils.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    primarySwatch: Colors.brown,
    brightness: Brightness.light,
    scaffoldBackgroundColor: AppColors.kWhite,
    appBarTheme: AppBarTheme(
      titleTextStyle: AppTypography.kSemiBold18,
      iconTheme: const IconThemeData(color: AppColors.kGrey100),
      backgroundColor: AppColors.kWhite,
      elevation: 0,
    ),
    inputDecorationTheme: InputDecorationTheme(
      fillColor: const Color(0xFFF6F6F6),
      contentPadding: EdgeInsets.symmetric(
        horizontal: AppSpacing.twentyHorizontal,
        vertical: 18.h,
      ),
      filled: true,
      focusedBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: AppColors.kPrimary),
        borderRadius: BorderRadius.circular(AppSpacing.radiusThirty),
      ),
      border: OutlineInputBorder(
        borderSide: BorderSide.none,
        borderRadius: BorderRadius.circular(AppSpacing.radiusThirty),
      ),
      hintStyle: AppTypography.kSemiBold14.copyWith(color: AppColors.kGrey60),
    ),
  );
}

// Default Overlay.
SystemUiOverlayStyle defaultOverlay = const SystemUiOverlayStyle(
  statusBarColor: Colors.transparent,
  statusBarBrightness: Brightness.light,
  statusBarIconBrightness: Brightness.dark,
  systemNavigationBarColor: Colors.black,
  systemNavigationBarDividerColor: Colors.transparent,
  systemNavigationBarIconBrightness: Brightness.light,
);
