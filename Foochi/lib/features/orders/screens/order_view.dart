import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foochi/core/utils/utils.dart';
import 'package:foochi/features/orders/screens/refund_orders.dart';
import 'package:foochi/features/orders/screens/upcoming_order.dart';

import '../../../core/common/texts/heading_rich_text.dart';
import '../../menu/screens/widgets/custom_indicator_shape.dart';
import 'history_orders.dart';

class OrderView extends StatelessWidget {
  const OrderView({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: const HeadingRichText(
                  text1: 'Your\n',
                  text2: 'Orders',
                ),
              ),
              TabBar(
                indicator:
                    BoxTabIndicator(width: 25.w, color: AppColors.kPrimary),
                isScrollable: true,
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                labelPadding: EdgeInsets.only(left: 0, right: 29.w),
                indicatorSize: TabBarIndicatorSize.tab,
                labelStyle: AppTypography.kMedium16,
                labelColor: AppColors.kSecondary,
                unselectedLabelColor: AppColors.kLightBrown,
                tabs: const [
                  Tab(text: 'Upcoming'),
                  Tab(text: 'History'),
                  Tab(text: 'Refund'),
                ],
              ),
              SizedBox(height: 20.h),
              const Expanded(
                child: TabBarView(
                  clipBehavior: Clip.none,
                  children: [
                    UpcomingOrders(),
                    HistoryOrders(),
                    RefundOrders(),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
