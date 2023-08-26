import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ngamar/core/core.dart';

import 'delivered_purchases.dart';

class MyPurchaseView extends StatelessWidget {
  const MyPurchaseView({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            'My Purchase',
            style:
                AppTypography.kSemiBold16.copyWith(color: AppColors.kGrey100),
          ),
          bottom: const PreferredSize(
            preferredSize: Size.fromHeight(kToolbarHeight),
            child: TabBar(
              indicatorColor: AppColors.kPrimary,
              indicatorSize: TabBarIndicatorSize.label,
              labelColor: AppColors.kGrey100,
              unselectedLabelColor: AppColors.kGrey70,
              tabs: [
                Tab(
                  child: Text('Delivered'),
                ),
                Tab(
                  child: Text('Processing'),
                ),
                Tab(
                  child: Text('Cancelled'),
                ),
              ],
            ),
          ),
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 24.w,
            vertical: AppSpacing.twentyVertical,
          ),
          child: const TabBarView(
            children: [
              DeliveredPurchases(),
              DeliveredPurchases(),
              DeliveredPurchases(),
            ],
          ),
        ),
      ),
    );
  }
}
