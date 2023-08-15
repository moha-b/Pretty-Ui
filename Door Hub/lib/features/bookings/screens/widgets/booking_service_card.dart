import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_typography.dart';
import '../../data/booking_model.dart';

class BookingServiceCard extends StatelessWidget {
  final BookingModel booking;
  const BookingServiceCard({super.key, required this.booking});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: 55.h,
          width: 55.w,
          padding: EdgeInsets.all(17.h),
          decoration: BoxDecoration(
              shape: BoxShape.circle, color: booking.service.category.color),
          child: SvgPicture.asset(booking.service.category.image),
        ),
        SizedBox(width: 16.w),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(booking.service.name, style: AppTypography.kMedium16),
            SizedBox(height: 5.h),
            Text(
              'Reference Code: #${booking.referenceCode}',
              style: AppTypography.kLight14.copyWith(color: AppColors.kNeutral),
            ),
          ],
        ),
      ],
    );
  }
}
