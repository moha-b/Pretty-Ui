import 'package:eden/core/helpers/dummy_list.dart';
import 'package:eden/core/utils/utils.dart';
import 'package:eden/features/course_detail/screens/widgets/review_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../auth/screens/widgets/auth_field.dart';
import '../../home/screens/widgets/custom_menu_card.dart';

class ReviewsView extends StatelessWidget {
  const ReviewsView({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(horizontal: AppSpacing.twentyHorizontal),
      physics: const NeverScrollableScrollPhysics(),
      child: Column(
        children: [
          SizedBox(height: AppSpacing.thirtyVertical),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: List.generate(
              5,
              (index) => CustomMenuCard(
                icon: reviews[index],
                isSelected: false,
                onTap: () {},
                title: index == 0
                    ? '1'
                    : index == 4
                        ? '12'
                        : index == 3
                            ? '2'
                            : '-',
              ),
            ),
          ),
          SizedBox(height: 30.h),
          AuthField(
            controller: TextEditingController(),
            hintText: 'Leave a Review',
          ),
          SizedBox(height: 30..h),
          ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              return const ReviewCard();
            },
            separatorBuilder: (context, index) => SizedBox(height: 15.h),
            itemCount: 3,
          ),
        ],
      ),
    );
  }
}
