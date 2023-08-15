import 'package:door_hub/features/bookings/screens/history_bookings_detail.dart';
import 'package:door_hub/features/bookings/screens/widgets/status_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../core/common/animations/fade_animations.dart';
import '../../../../core/common/containers/primary_container.dart';
import '../../../../core/utils/app_typography.dart';
import '../../data/booking_model.dart';
import 'booking_service_card.dart';

class HistoryBookingCard extends StatelessWidget {
  final BookingModel booking;
  const HistoryBookingCard({super.key, required this.booking});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(() => HistoryBookingsDetail(
              bookings: booking,
            ));
      },
      child: FadeInAnimation(
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeOut,
        child: PrimaryContainer(
            child: Column(
          children: [
            BookingServiceCard(booking: booking),
            Divider(height: 25.h),
            Row(
              children: [
                Text('Status', style: AppTypography.kLight14),
                const Spacer(),
                BookingStatusCard(status: booking.status)
              ],
            ),
            SizedBox(height: 15.h),
            Row(
              children: [
                Text('Service Provider', style: AppTypography.kLight14),
                const Spacer(),
                Text('Westinghouse', style: AppTypography.kLight14),
              ],
            ),
            SizedBox(height: 15.h),
            Row(
              children: [
                Text('Schedule', style: AppTypography.kLight14),
                const Spacer(),
                Text('8:00-9:00 AM, Dec 9', style: AppTypography.kLight14),
              ],
            ),
          ],
        )),
      ),
    );
  }
}
