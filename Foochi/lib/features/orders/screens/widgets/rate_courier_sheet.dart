import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foochi/core/common/common.dart';
import 'package:foochi/core/utils/utils.dart';

import '../../../home/screens/widgets/profile_image_card.dart';

class RateCourierSheet extends StatefulWidget {
  const RateCourierSheet({super.key});

  @override
  State<RateCourierSheet> createState() => _RateCourierSheetState();
}

class _RateCourierSheetState extends State<RateCourierSheet> {
  final TextEditingController _reviewController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20.h),
      decoration: BoxDecoration(
          color: AppColors.kLightPink2,
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(30.r),
          )),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          const CustomDivider(),
          SizedBox(height: 10.h),
          Center(child: Text('Rate Courier', style: AppTypography.kBold16)),
          SizedBox(height: 20.h),
          const Center(child: ProfileImageCard()),
          SizedBox(height: 10.h),
          Center(child: Text('David Johns', style: AppTypography.kMedium14)),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(AppAssets.kStarFilled, height: 20.h),
              SizedBox(width: 3.w),
              Text('5.0', style: AppTypography.kLight11),
            ],
          ),
          SizedBox(height: 20.h),
          Row(
            children: [
              Text('Tap to Rate:', style: AppTypography.kMedium16),
              SizedBox(width: 15.w),
              RatingBar.builder(
                initialRating: 3,
                minRating: 1,
                direction: Axis.horizontal,
                allowHalfRating: true,
                itemCount: 5,
                itemSize: 25.h,
                unratedColor: AppColors.kLightPink,
                itemPadding: EdgeInsets.symmetric(horizontal: 1.w),
                itemBuilder: (context, _) =>
                    const Icon(Icons.star, color: Colors.amber),
                onRatingUpdate: (rating) {},
              )
            ],
          ),
          SizedBox(height: 10.h),
          Text('Write a Review:', style: AppTypography.kMedium16),
          SizedBox(height: 10.h),
          RatingTextField(
              controller: _reviewController, maxLines: 5, hintText: 'Review'),
          SizedBox(height: 30.h),
          Center(
            child: PrimaryButton(
              onTap: () {},
              width: 110.w,
              borderRadius: 10.r,
              height: 45.h,
              text: 'Send',
            ),
          ),
        ],
      ),
    );
  }
}
