import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_typography.dart';

class CustomCalendarStyle {
  static HeaderStyle getStyle(context) {
    bool isDarkMode(BuildContext context) =>
        Theme.of(context).brightness == Brightness.dark;
    return HeaderStyle(
      formatButtonVisible: false,
      titleCentered: true,
      titleTextStyle: AppTypography.kMedium18,
      leftChevronIcon: Container(
        height: 36.h,
        width: 36.w,
        decoration: BoxDecoration(
            color: isDarkMode(context)
                ? AppColors.kContentColor
                : AppColors.kInput,
            shape: BoxShape.circle),
        child: Icon(Icons.arrow_back_ios_new_rounded, size: 16.h),
      ),
      rightChevronIcon: Container(
        height: 36.h,
        width: 36.w,
        decoration: BoxDecoration(
            color: isDarkMode(context)
                ? AppColors.kContentColor
                : AppColors.kInput,
            shape: BoxShape.circle),
        child: Icon(Icons.arrow_forward_ios_rounded, size: 16.h),
      ),
      headerMargin: EdgeInsets.only(bottom: 23.h),
      leftChevronMargin: EdgeInsets.zero,
      leftChevronPadding: EdgeInsets.zero,
      rightChevronMargin: EdgeInsets.zero,
      rightChevronPadding: EdgeInsets.zero,
    );
  }

  static CalendarStyle calendarStyle() {
    return CalendarStyle(
        outsideDaysVisible: false,
        defaultTextStyle: AppTypography.kMedium15,
        holidayTextStyle: AppTypography.kMedium15,
        isTodayHighlighted: false,
        weekendTextStyle: AppTypography.kMedium15,
        weekendDecoration: BoxDecoration(
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular(5.r)),
        defaultDecoration: BoxDecoration(
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular(5.r)),
        selectedDecoration: BoxDecoration(
            color: AppColors.kPrimary,
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular(5.r)));
  }
}
