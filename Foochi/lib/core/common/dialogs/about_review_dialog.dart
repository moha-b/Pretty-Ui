import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foochi/core/common/dialogs/rating_and_review_dialog.dart';
import 'package:foochi/core/utils/utils.dart';
import 'package:get/get.dart';
import 'package:image_stack/image_stack.dart';

import '../../../features/home/screens/widgets/profile_image_card.dart';
import '../buttons/primary_button.dart';
import '../divider/custom_divider.dart';

class AboutAndReviewDialog extends StatelessWidget {
  const AboutAndReviewDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.r)),
      backgroundColor: AppColors.kLightPink2,
      insetPadding: EdgeInsets.zero,
      content: SizedBox(
        width: double.maxFinite,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CustomDivider(),
            SizedBox(height: 20.h),
            Center(child: Text('About & Review', style: AppTypography.kBold24)),
            Text('Description', style: AppTypography.kBold18),
            Text(
              'Lorem ipsum dolor sit amet, consectetur  urna adipiscing elit, sed do eiusmod tempor eget commodo viverra maecenas accumsan lacus vel facilisis posuere. ',
              style:
                  AppTypography.kLight14.copyWith(color: AppColors.kLightBrown),
            ),
            Text('Review', style: AppTypography.kBold18),
            SizedBox(height: 10.h),
            ListView.separated(
                separatorBuilder: (ctx, i) => SizedBox(height: 10.h),
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: 3,
                itemBuilder: (ctx, i) {
                  return Row(
                    children: [
                      ProfileImageCard(
                        image: i.isEven
                            ? AppAssets.kProfilePic
                            : AppAssets.kProfilePic2,
                      ),
                      SizedBox(width: 10.w),
                      Expanded(
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Text('Jont Herry',
                                    style: AppTypography.kMedium14),
                                SizedBox(width: 10.w),
                                Image.asset(AppAssets.kStarFilled, height: 16),
                                Text('5.0', style: AppTypography.kLight11),
                              ],
                            ),
                            Text(
                                'Consectetur  urna adipiscing elit, sed do eiusmod tempor eget.',
                                style: AppTypography.kLight13),
                          ],
                        ),
                      )
                    ],
                  );
                }),
            SizedBox(height: 30.h),
            Row(children: [
              ImageStack(
                imageList: [
                  AppAssets.kProfilePic,
                  AppAssets.kProfilePic2,
                  AppAssets.kProfilePic,
                  AppAssets.kProfilePic2,
                ],
                imageSource: ImageSource.Asset,
                totalCount: 4,
                imageRadius: 45,
                imageCount: 4,
                imageBorderWidth: 0,
                backgroundColor: AppColors.kPrimary,
              ),
              const Spacer(),
              PrimaryButton(
                onTap: () {
                  Get.back();
                  Get.dialog(const RatingAndReviewDialog());
                },
                width: 110.w,
                text: 'Review',
              )
            ])
          ],
        ),
      ),
    );
  }
}
