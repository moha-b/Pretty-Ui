import 'package:eden/core/common/common_widgets.dart';
import 'package:eden/core/utils/utils.dart';
import 'package:eden/features/activity/screens/widgets/activity_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

import '../data/activity_model.dart';

class ActivityView extends StatelessWidget {
  const ActivityView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Activity',
          style: AppTypography.kBold24,
        ),
        actions: [
          CustomIconButton(
            onTap: () {},
            color: AppColors.kPrimary.withOpacity(0.15),
            icon: AppAssets.kFilter,
          ),
          SizedBox(width: 20.w),
        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: AppSpacing.twentyHorizontal),
        child: AnimationLimiter(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: AnimationConfiguration.toStaggeredList(
              duration: const Duration(milliseconds: 375),
              childAnimationBuilder: (widget) => SlideAnimation(
                horizontalOffset: MediaQuery.of(context).size.width / 2,
                child: FadeInAnimation(child: widget),
              ),
              children: [
                Text('Today', style: AppTypography.kBold18),
                SizedBox(height: 20.h),
                MediaQuery.removePadding(
                  context: context,
                  removeBottom: true,
                  removeTop: true,
                  child: ListView.separated(
                    itemCount: todayActivities.length,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    separatorBuilder: (context, index) =>
                        SizedBox(height: 10.h),
                    itemBuilder: (context, index) {
                      return ActivityCard(
                        activity: todayActivities[index],
                      );
                    },
                  ),
                ),
                SizedBox(height: 40.h),
                Text('Recent Week', style: AppTypography.kBold18),
                SizedBox(height: AppSpacing.twentyVertical),
                ListView.separated(
                  itemCount: recentWeek.length,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  separatorBuilder: (context, index) => SizedBox(height: 10.h),
                  itemBuilder: (context, index) {
                    return ActivityCard(
                      activity: recentWeek[index],
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
