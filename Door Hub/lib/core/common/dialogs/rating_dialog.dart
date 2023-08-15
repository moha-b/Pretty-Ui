import 'package:door_hub/core/common/dialogs/widget/rating_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../utils/utils.dart';
import '../buttons/primary_button.dart';

class RatingDialog extends StatelessWidget {
  final Animation<double> opacity;
  final Animation<double> scale;
  const RatingDialog({super.key, required this.opacity, required this.scale});

  @override
  Widget build(BuildContext context) {
    bool isDarkMode(BuildContext context) =>
        Theme.of(context).brightness == Brightness.dark;

    return Transform.scale(
      scale: scale.value,
      child: Opacity(
        opacity: opacity.value,
        child: AlertDialog(
          insetPadding: EdgeInsets.symmetric(horizontal: 10.w),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.r)),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(AppAssets.kLogo),
              SizedBox(height: 16.h),
              Text('Rate Door-Hub App', style: AppTypography.kBold20),
              SizedBox(height: 10.h),
              Text(
                'Your feedback will help us to make improvements',
                style: AppTypography.kLight14,
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 16.h),
              CustomRatingField(onChanged: (value) {}),
              SizedBox(height: 20.h),
              Row(
                children: [
                  Expanded(
                      flex: 4,
                      child: PrimaryButton(
                        onTap: () {},
                        text: 'No, Thanks',
                        width: 60.w,
                        color: isDarkMode(context)
                            ? AppColors.kContentColor
                            : AppColors.kWhite,
                        isBorder: true,
                      )),
                  SizedBox(width: 10.w),
                  Expanded(
                      flex: 6,
                      child: PrimaryButton(
                        onTap: () {},
                        text: 'Rate on Play Store',
                        width: 60.w,
                      )),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
