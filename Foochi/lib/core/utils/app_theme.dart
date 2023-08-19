import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foochi/core/utils/utils.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
      primarySwatch: Colors.teal,
      brightness: Brightness.light,
      scaffoldBackgroundColor: AppColors.kBackground,
      appBarTheme: const AppBarTheme(
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
        backgroundColor: AppColors.kBackground,
        elevation: 0,
      ),
      inputDecorationTheme: InputDecorationTheme(
        contentPadding: EdgeInsets.symmetric(
          horizontal: AppSpacing.twentyHorizontal,
          vertical: 16.h,
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: AppColors.kLine),
          borderRadius: BorderRadius.circular(AppSpacing.radiusTen),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: AppColors.kLine),
          borderRadius: BorderRadius.circular(AppSpacing.radiusTen),
        ),
        border: OutlineInputBorder(
          borderSide: const BorderSide(color: AppColors.kLine),
          borderRadius: BorderRadius.circular(AppSpacing.radiusTen),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: AppColors.kLine),
          borderRadius: BorderRadius.circular(AppSpacing.radiusTen),
        ),
        hintStyle: AppTypography.kLight14,
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: AppColors.kBackground,
        elevation: 0,
        showSelectedLabels: false,
        showUnselectedLabels: false,
      ));
}

// Default Overlay.
SystemUiOverlayStyle defaultOverlay = const SystemUiOverlayStyle(
  statusBarColor: Colors.transparent,
  statusBarBrightness: Brightness.dark,
  statusBarIconBrightness: Brightness.dark,
  systemNavigationBarColor: Colors.black,
  systemNavigationBarDividerColor: Colors.transparent,
  systemNavigationBarIconBrightness: Brightness.light,
);
