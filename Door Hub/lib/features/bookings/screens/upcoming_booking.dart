import 'package:door_hub/features/bookings/screens/widgets/upcoming_booking_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../data/booking_model.dart';

class UpComingBookings extends StatelessWidget {
  const UpComingBookings({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        itemCount: upcomingBookings.length,
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        separatorBuilder: (context, index) => SizedBox(height: 10.h),
        itemBuilder: (context, index) {
          return UpComingBookingCard(
            bookings: upcomingBookings[index],
          );
        });
  }
}
