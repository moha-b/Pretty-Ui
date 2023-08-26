import 'package:another_stepper/another_stepper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ngamar/core/core.dart';

import 'custom_tracking_stepper_card.dart';

class CustomStepper extends StatelessWidget {
  const CustomStepper({super.key});

  @override
  Widget build(BuildContext context) {
    return AnotherStepper(
      stepperList: [
        StepperData(
          title: StepperText(
            'Package delivered',
            textStyle: AppTypography.kSemiBold14,
          ),
          subtitle: StepperText(
            'St Jackson, San Francisco',
            textStyle: AppTypography.kLight10
                .copyWith(color: AppColors.kGrey60, fontSize: 12.sp),
          ),
          iconWidget: CustomTrackingStepperCard(icon: AppAssets.kBoxTick),
        ),
        StepperData(
          title: StepperText(
            'Package is being sent',
            textStyle: AppTypography.kSemiBold14,
          ),
          subtitle: StepperText(
            'With cargo',
            textStyle: AppTypography.kLight10
                .copyWith(color: AppColors.kGrey60, fontSize: 12.0.sp),
          ),
          iconWidget: CustomTrackingStepperCard(
            icon: AppAssets.kTruckDelivery,
            color: AppColors.kPrimary,
          ),
        ),
        StepperData(
          title: StepperText(
            'Package is processed',
            textStyle: AppTypography.kSemiBold14,
          ),
          subtitle: StepperText(
            'St Petersburg, Russia',
            textStyle: AppTypography.kLight10
                .copyWith(color: AppColors.kGrey60, fontSize: 12..sp),
          ),
          iconWidget: CustomTrackingStepperCard(icon: AppAssets.kBox),
        ),
        StepperData(
          title: StepperText(
            'Payment verified',
            textStyle: AppTypography.kSemiBold14,
          ),
          subtitle: StepperText(
            'Credit Card',
            textStyle: AppTypography.kLight10
                .copyWith(color: AppColors.kGrey60, fontSize: 12),
          ),
          iconWidget: CustomTrackingStepperCard(icon: AppAssets.kFileText),
        ),
      ],
      stepperDirection: Axis.vertical,
      iconWidth: 40,
      iconHeight: 40,
      activeBarColor: AppColors.kLine,
      inActiveBarColor: AppColors.kLine,
      verticalGap: 30,
      activeIndex: 1,
      barThickness: 1,
    );
  }
}
