import 'package:door_hub/core/common/common_widgets.dart';
import 'package:door_hub/features/bookings/screens/widgets/custom_expanded_tile.dart';
import 'package:door_hub/features/bookings/screens/widgets/service_provider_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/utils/app_assets.dart';
import '../../../core/utils/app_typography.dart';
import '../../address/data/address_model.dart';
import '../../address/screens/widgets/address_card.dart';
import '../../categories/screens/widgets/date_card.dart';
import '../../checkout/screens/widget/checkout_service_card.dart';
import '../../checkout/screens/widget/phone_number_card.dart';
import '../../checkout/screens/widget/promo_card.dart';
import '../data/booking_model.dart';

class HistoryBookingsDetail extends StatelessWidget {
  final BookingModel bookings;
  const HistoryBookingsDetail({Key? key, required this.bookings})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Column(
          children: [
            SizedBox(height: 20.h),
            PrimaryContainer(
              child: Row(
                children: [
                  CustomHeaderText(text: 'Reference Code:', fontSize: 18.sp),
                  SizedBox(width: 5.w),
                  Text(
                    bookings.referenceCode,
                    style: AppTypography.kBold16
                        .copyWith(color: const Color(0xFFFC944D)),
                  )
                ],
              ),
            ),
            SizedBox(height: 16.h),
            const CheckoutServiceCard(),
            SizedBox(height: 16.h),
            const ServiceProviderCard(),
            SizedBox(height: 16.h),
            CustomExpandedTile(
                title: 'Address',
                children: [AddressCard(address: dummyAddresses[0])]),
            SizedBox(height: 16.h),
            CustomExpandedTile(title: 'Date and Time', children: [
              DateCard(
                onTap: null,
                icon: AppAssets.kDate,
                color: null,
                title: 'Date',
                subtitle: 'November 7, 2021',
              ),
              SizedBox(height: 10.h),
              DateCard(
                onTap: null,
                icon: AppAssets.kTime,
                color: null,
                title: 'Time',
                subtitle: '12:00-01:00PM',
              )
            ]),
            SizedBox(height: 16.h),
            const CustomExpandedTile(
                title: 'Phone number', children: [PhoneNumberCard()]),
            SizedBox(height: 16.h),
            const CustomExpandedTile(title: 'Promo Code', children: [
              PromoCard(
                isSelected: true,
              ),
            ]),
          ],
        ),
      ),
    );
  }
}
