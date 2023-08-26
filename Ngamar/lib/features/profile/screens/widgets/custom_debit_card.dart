import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ngamar/core/core.dart';

class CustomDebitCard extends StatelessWidget {
  final String currentBalance;
  final String cardNumber;
  final String expireDate;
  final String cardIcon;
  final Color cardColor;
  const CustomDebitCard({
    required this.currentBalance,
    required this.cardNumber,
    required this.expireDate,
    required this.cardIcon,
    required this.cardColor,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: cardColor,
        borderRadius: BorderRadius.circular(10.r),
      ),
      child: Stack(
        children: [
          Positioned(
            right: -80.0.w,
            top: -100.0.h,
            child: const CustomCircle(),
          ),
          Positioned(
            left: -60.w,
            bottom: -70.h,
            child: const CustomCircle(),
          ),
          Padding(
            padding: EdgeInsets.all(24.h),
            child: Column(
              children: [
                Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Current Balance',
                          style: AppTypography.kSemiBold14
                              .copyWith(color: AppColors.kWhite),
                        ),
                        Text(
                          '\$$currentBalance',
                          style: AppTypography.kBold24
                              .copyWith(color: AppColors.kWhite),
                        ),
                      ],
                    ),
                    const Spacer(),
                    SvgPicture.asset(cardIcon),
                  ],
                ),
                SizedBox(height: AppSpacing.fiftyVertical),
                Row(
                  children: [
                    Text(
                      cardNumber,
                      style: AppTypography.kMedium14
                          .copyWith(color: AppColors.kWhite),
                    ),
                    const Spacer(),
                    Text(
                      expireDate,
                      style: AppTypography.kMedium14.copyWith(
                        color: AppColors.kWhite,
                        fontSize: 12.sp,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class CustomCircle extends StatelessWidget {
  const CustomCircle({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200.0.h,
      width: 200.0.w,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: AppColors.kWhite.withOpacity(0.05),
      ),
    );
  }
}
