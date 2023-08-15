import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_typography.dart';
import '../../data/events.dart';

class EventCard extends StatelessWidget {
  final Event event;
  const EventCard({required this.event, super.key});

  @override
  Widget build(BuildContext context) {
    final fromTimeFormatted = DateFormat('h:mm a').format(event.fromTime);
    final toTimeFormatted = DateFormat('h:mm a').format(event.toTime);

    return Row(
      children: [
        Container(
          height: 55.h,
          width: 55.w,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: event.category.color,
          ),
          child: SvgPicture.asset(event.category.image),
        ),
        SizedBox(width: 16.w),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(event.title, style: AppTypography.kMedium16),
            SizedBox(height: 5.h),
            Text(
              '$fromTimeFormatted - $toTimeFormatted',
              style: AppTypography.kLight14.copyWith(color: AppColors.kNeutral),
            ),
          ],
        ),
      ],
    );
  }
}
