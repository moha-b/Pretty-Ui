import 'package:eden/core/common/buttons/buttons.dart';
import 'package:eden/core/utils/utils.dart';
import 'package:eden/features/statistics/screens/widgets/active_user_chart.dart';
import 'package:eden/features/statistics/screens/widgets/filter_date_card.dart';
import 'package:eden/features/statistics/screens/widgets/sale_category_card.dart';
import 'package:eden/features/statistics/screens/widgets/weekly_earning_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/common/containers/primary_container.dart';
import '../../../core/common/custom_painter/dotted_divider.dart';
import '../../auth/data/categaory.dart';

class StatisticsView extends StatefulWidget {
  const StatisticsView({super.key});

  @override
  State<StatisticsView> createState() => _StatisticsViewState();
}

class _StatisticsViewState extends State<StatisticsView> {
  int selectedTime = 1;
  final iconColor = AppColors.kPrimary.withOpacity(0.15);
  bool isDarkMode(BuildContext context) =>
      Theme.of(context).brightness == Brightness.dark;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Statistics',
        ),
        actions: [
          CustomIconButton(
            icon: AppAssets.kCalendar,
            onTap: () {},
            color: isDarkMode(context) ? Colors.black : iconColor,
          ),
          SizedBox(width: AppSpacing.twentyHorizontal),
        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          SizedBox(height: 20.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: List.generate(4, (index) {
              final filterDates = ['Days', 'Week', 'Month', 'Year'];
              return FilterDateCard(
                onTap: () {
                  setState(() {
                    selectedTime = index;
                  });
                },
                text: filterDates[index],
                isSelected: selectedTime == index,
              );
            }),
          ),
          SizedBox(height: 35.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomIconButton(
                onTap: () {},
                icon: AppAssets.kArrowBackIos,
                color: iconColor,
              ),
              Text('Oct 2- 9, 2020 ', style: AppTypography.kBold18),
              CustomIconButton(
                onTap: () {},
                icon: AppAssets.kArrowBackForward,
                color: iconColor,
              ),
            ],
          ),
          SizedBox(height: AppSpacing.twentyVertical),
          PrimaryContainer(
            padding: EdgeInsets.all(AppSpacing.twentyVertical),
            child: const WeeklyEarningChart(),
          ),
          SizedBox(height: AppSpacing.thirtyVertical),
          Container(
            padding: EdgeInsets.all(12.h),
            decoration: BoxDecoration(
              color: AppColors.kPrimary.withOpacity(0.08),
              borderRadius: BorderRadius.circular(10.r),
            ),
            child: Column(
              children: [
                Text(
                  'You’ve reached a new\nweekly sales record!',
                  style: AppTypography.kLight16,
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 10.h),
                Text(
                  '2048 Sales',
                  style: AppTypography.kBold18,
                ),
                SizedBox(height: 10.1.h),
                DottedDivider(
                  color: AppColors.kGrey.withOpacity(0.05),
                ),
                CustomTextButton(
                  onPressed: () {},
                  text: 'Read Details',
                ),
              ],
            ),
          ),
          SizedBox(height: AppSpacing.thirtyVertical),
          Text('Sales per category', style: AppTypography.kBold18),
          SizedBox(height: AppSpacing.twentyVertical),
          SizedBox(
            height: 150.h,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              clipBehavior: Clip.none,
              padding: EdgeInsets.zero,
              itemBuilder: (context, index) {
                return SaleCategoryCard(
                  category: categoriesList[index],
                );
              },
              separatorBuilder: (context, index) => SizedBox(width: 20.w),
              itemCount: categoriesList.length,
            ),
          ),
          SizedBox(height: AppSpacing.thirtyVertical),
          Text('Active Users', style: AppTypography.kBold18),
          SizedBox(height: AppSpacing.twentyVertical),
          PrimaryContainer(
            height: 270.h,
            width: double.maxFinite,
            child: ActiveUserChart(),
          ),
          SizedBox(height: AppSpacing.twentyVertical),
        ]),
      ),
    );
  }
}
