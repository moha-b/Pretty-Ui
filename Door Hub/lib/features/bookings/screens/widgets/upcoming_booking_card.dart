import 'package:door_hub/core/common/animations/fade_animations.dart';
import 'package:door_hub/features/bookings/screens/widgets/status_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';

import '../../../../core/common/animations/button_animation.dart';
import '../../../../core/common/containers/primary_container.dart';
import '../../../../core/utils/utils.dart';
import '../../data/booking_model.dart';
import 'booking_service_card.dart';

class UpComingBookingCard extends StatelessWidget {
  final BookingModel bookings;
  const UpComingBookingCard({super.key, required this.bookings});

  @override
  Widget build(BuildContext context) {
    String formattedFromDate = DateFormat('h:mm').format(bookings.fromDate);
    String formattedToDate =
        DateFormat('h:mm a, dd MMM').format(bookings.toDate);
    return FadeInAnimation(
      curve: Curves.easeIn,
      duration: const Duration(milliseconds: 500),
      child: PrimaryContainer(
          child: Column(
        children: [
          BookingServiceCard(
            booking: bookings,
          ),
          Divider(height: 25.h),
          Row(
            children: [
              Text('Status', style: AppTypography.kLight14),
              const Spacer(),
              BookingStatusCard(
                status: bookings.status,
              )
            ],
          ),
          SizedBox(height: 10.h),
          Row(
            children: [
              Container(
                height: 45.h,
                width: 45.w,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: AppColors.kInput)),
                child: SvgPicture.asset(
                  AppAssets.kDate,
                  colorFilter:
                      const ColorFilter.mode(AppColors.kGrey, BlendMode.srcIn),
                ),
              ),
              SizedBox(width: 10.w),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('$formattedFromDate-$formattedToDate',
                      style: AppTypography.kMedium14),
                  Text('Schedule',
                      style: AppTypography.kLight12
                          .copyWith(color: AppColors.kNeutral04))
                ],
              )
            ],
          ),
          SizedBox(height: 10.h),
          Row(
            children: [
              Container(
                height: 45.h,
                width: 45.w,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: AppColors.kInput),
                ),
                child: Image.asset(bookings.serviceProvider.profilePic),
              ),
              SizedBox(width: 10.w),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(bookings.serviceProvider.name,
                        style: AppTypography.kMedium14),
                    Text('Service provider',
                        style: AppTypography.kLight12
                            .copyWith(color: AppColors.kNeutral04))
                  ],
                ),
              ),
              ButtonAnimation(
                  child: Container(
                    padding: EdgeInsets.all(12.h),
                    decoration: BoxDecoration(
                        color: AppColors.kPrimary,
                        borderRadius: BorderRadius.circular(12.r)),
                    child: Row(
                      children: [
                        SvgPicture.asset(AppAssets.kCall),
                        SizedBox(width: 5.w),
                        Text('Call',
                            style: AppTypography.kMedium15
                                .copyWith(color: AppColors.kWhite))
                      ],
                    ),
                  ),
                  onTap: () {})
            ],
          )
        ],
      )),
    );
  }
}
