import 'package:door_hub/features/bookings/screens/widgets/history_booking_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../data/booking_model.dart';

class HistoryBookings extends StatelessWidget {
  const HistoryBookings({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        itemCount: historyBookings.length,
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        separatorBuilder: (context, index) => SizedBox(height: 10.h),
        itemBuilder: (context, index) {
          return HistoryBookingCard(
            booking: historyBookings[index],
          );
        });
  }
}
