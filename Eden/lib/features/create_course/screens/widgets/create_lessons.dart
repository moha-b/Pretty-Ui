import 'package:eden/core/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../auth/data/categaory.dart';
import '../../../auth/screens/widgets/custom_chips.dart';

class CreateLessons extends StatelessWidget {
  const CreateLessons({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 185.h,
          color: AppColors.kPrimary.withOpacity(0.081),
          child: ListView.separated(
            itemCount: 5 + 1,
            padding: EdgeInsets.all(AppSpacing.twentyVertical),
            scrollDirection: Axis.horizontal,
            separatorBuilder: (context, index) {
              return SizedBox(width: AppSpacing.twentyHorizontal);
            },
            itemBuilder: (context, index) {
              if (index == 0) {
                return Column(
                  children: [
                    Container(
                      height: 50.h,
                      width: 50.w,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.r),
                        color: AppColors.kPrimary.withOpacity(0.15),
                      ),
                      child: const Icon(Icons.add, color: AppColors.kPrimary),
                    ),
                  ],
                );
              } else {
                return Column(
                  children: [
                    Container(
                      height: 90.h,
                      width: 130.w,
                      decoration: BoxDecoration(
                        color: AppColors.kAccent4,
                        borderRadius: BorderRadius.circular(10.r),
                        boxShadow: [AppColors.defaultShadow],
                      ),
                    ),
                    SizedBox(height: 5.h),
                    Text(
                      'Introduction to We...',
                      style: AppTypography.kLight14.copyWith(
                          color: AppColors.kSecondary.withOpacity(0.5)),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    ),
                  ],
                );
              }
            },
          ),
        ),
        SizedBox(height: AppSpacing.thirtyVertical),
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: AppSpacing.twentyHorizontal,
          ),
          child: Text(
            'Choose or type category',
            style: AppTypography.kLight16,
          ),
        ),
        SizedBox(height: AppSpacing.twentyVertical),
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: AppSpacing.twentyHorizontal,
          ),
          child: Wrap(
            spacing: 15.w,
            runSpacing: 20.h,
            alignment: WrapAlignment.spaceBetween,
            children: List.generate(
              4,
              (index) => CustomChips(
                onTap: () {},
                index: index,
                category: categoriesList[index],
                isSelected: false,
              ),
            ),
          ),
        ),
        SizedBox(height: 50.h),
      ],
    );
  }
}
