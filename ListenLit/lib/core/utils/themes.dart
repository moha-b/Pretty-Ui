import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import 'app_colors.dart';

class AppTheme {
  //create a light theme with custom colors
  static ThemeData lightTheme = ThemeData(
      scaffoldBackgroundColor: AppColor.kBGColor,
      primarySwatch: Colors.grey,
      brightness: Brightness.dark,
      primaryColor: AppColor.kBGColor,
      bottomSheetTheme: BottomSheetThemeData(
        backgroundColor: Colors.black.withOpacity(0),
      ),
      textTheme: GoogleFonts.interTextTheme().copyWith(
        displayLarge: TextStyle(fontSize: 72.0.sp, fontWeight: FontWeight.bold),
        displayMedium:
            TextStyle(fontSize: 36.0.sp, fontStyle: FontStyle.italic),
        displaySmall: TextStyle(fontSize: 14.0.sp),
      ));
  //create a dark theme with custom colors
  static ThemeData darkTheme = ThemeData(
      primarySwatch: Colors.grey,
      scaffoldBackgroundColor: AppColor.kBGColor,
      brightness: Brightness.dark,
      primaryColor: AppColor.kBGColor,
      bottomSheetTheme: BottomSheetThemeData(
        backgroundColor: Colors.black.withOpacity(0),
      ),
      textTheme: GoogleFonts.interTextTheme().copyWith(
        displayLarge: TextStyle(fontSize: 72.0.sp, fontWeight: FontWeight.bold),
        displayMedium:
            TextStyle(fontSize: 36.0.sp, fontStyle: FontStyle.italic),
        displaySmall: TextStyle(fontSize: 14.0.sp),
      ));
}
