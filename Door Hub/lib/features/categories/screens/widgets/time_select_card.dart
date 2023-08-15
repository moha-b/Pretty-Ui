import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/helper/date_time_format.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_typography.dart';

class TimeSelectCard extends StatefulWidget {
  final ValueChanged<DateTime>? onTimeSelected;

  const TimeSelectCard({Key? key, this.onTimeSelected}) : super(key: key);

  @override
  _TimeSelectCardState createState() => _TimeSelectCardState();
}

class _TimeSelectCardState extends State<TimeSelectCard> {
  int? _selectedTimeIndex;

  @override
  Widget build(BuildContext context) {
    bool isDarkMode(BuildContext context) =>
        Theme.of(context).brightness == Brightness.dark;

    const int businessHourStart = 9;
    const int businessHourEnd = 17;
    final List<DateTime> dateTimes = List.generate(
      (businessHourEnd - businessHourStart + 1) * 2,
      (index) {
        final hour = businessHourStart + (index ~/ 2);
        final minute = (index % 2) * 30;
        return DateTime(
          DateTime.now().year,
          DateTime.now().month,
          DateTime.now().day,
          hour,
          minute,
        );
      },
    );

    return Container(
      height: 370.h,
      color:
          isDarkMode(context) ? AppColors.kContentColor : AppColors.kNeutral01,
      child: ListView.separated(
        itemBuilder: (context, index) {
          final dateTime = dateTimes[index];
          final formattedDateTime = CustomDateTimeFormat.timeFormat(dateTime);
          final isSelected = index == _selectedTimeIndex;
          return GestureDetector(
            onTap: () {
              setState(() {
                _selectedTimeIndex = index;
              });
              if (widget.onTimeSelected != null) {
                widget.onTimeSelected!(dateTime);
              }
            },
            child: Container(
              padding: EdgeInsets.symmetric(
                horizontal: 12.w,
                vertical: 10.h,
              ),
              decoration: BoxDecoration(
                color: isSelected ? AppColors.kWhite : null,
                borderRadius: BorderRadius.circular(5.r),
              ),
              child: Text(
                formattedDateTime,
                style: isSelected
                    ? AppTypography.kMedium15.copyWith(
                        color: AppColors.kPrimary,
                      )
                    : AppTypography.kMedium15,
              ),
            ),
          );
        },
        separatorBuilder: (context, index) => SizedBox(height: 5.h),
        itemCount: dateTimes.length,
      ),
    );
  }
}
