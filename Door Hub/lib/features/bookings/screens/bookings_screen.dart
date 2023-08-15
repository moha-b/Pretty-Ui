import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/common/containers/primary_container.dart';
import '../../../core/common/texts/custom_header_text.dart';
import '../../../core/utils/app_colors.dart';
import 'draft_bookings.dart';
import 'history_booking.dart';
import 'upcoming_booking.dart';

class BookingsView extends StatelessWidget {
  const BookingsView({super.key});

  @override
  Widget build(BuildContext context) {
    bool isDarkMode(BuildContext context) =>
        Theme.of(context).brightness == Brightness.dark;

    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: CustomHeaderText(
              text: 'Bookings',
              fontColor: isDarkMode(context) ? AppColors.kWhite : Colors.black),
        ),
        body: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(20.h),
              child: PrimaryContainer(
                padding: EdgeInsets.all(10.h),
                child: const TabBar(
                  tabs: [
                    Tab(
                      text: 'Upcoming',
                    ),
                    Tab(
                      text: 'History',
                    ),
                    Tab(
                      text: 'Draft',
                    )
                  ],
                ),
              ),
            ),
            const Expanded(
              child: TabBarView(
                physics: NeverScrollableScrollPhysics(),
                children: [
                  UpComingBookings(),
                  HistoryBookings(),
                  DraftBookings(),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
