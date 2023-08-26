import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:ngamar/core/core.dart';

import '../../../search/screens/widgets/filter_sheet.dart';
import '../address_view.dart';
import 'dotted_divider.dart';


class DragSheet extends StatelessWidget {
  final double subtotal;
  final double shipping;
  final double totalAmount;
  const DragSheet({
    required this.shipping,
    required this.subtotal,
    required this.totalAmount,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      minChildSize: 0.1,
      maxChildSize: 0.46,
      initialChildSize: 0.45,
      builder: (context, scrollController) {
        return Container(
          padding: EdgeInsets.only(
            top: 10.h,
            left: 24.w,
            right: 24.0.w,
            bottom: 20.h,
          ),
          decoration: BoxDecoration(
            color: AppColors.kWhite,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 2,
                blurRadius: 5,
                offset: const Offset(0, 3),
              ),
            ],
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(AppSpacing.radiusTwenty),
            ),
          ),
          child: ListView(
            controller: scrollController,
            children: [
              const CustomDivider(),
              SizedBox(height: AppSpacing.twentyVertical),
              Container(
                height: 56.h,
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                decoration: BoxDecoration(
                  border: Border.all(color: AppColors.kLine),
                  borderRadius: BorderRadius.circular(20.r),
                  color: AppColors.kGrey30,
                ),
                child: Row(
                  children: [
                    SvgPicture.asset(AppAssets.kDiscountShape),
                    SizedBox(width: AppSpacing.tenHorizontal),
                    Text(
                      'Enter Promo Code',
                      style: AppTypography.kMedium14.copyWith(
                        color: AppColors.kGrey70,
                      ),
                    ),
                    const Spacer(),
                    const Icon(
                      Icons.keyboard_arrow_right_outlined,
                      color: AppColors.kGrey70,
                    ),
                  ],
                ),
              ),
              SizedBox(height: AppSpacing.twentyVertical),
              CustomPaymentDetails(amount: subtotal, heading: 'Subtotal'),
              SizedBox(height: AppSpacing.tenVertical),
              CustomPaymentDetails(amount: shipping, heading: 'Shipping'),
              SizedBox(height: AppSpacing.twentyVertical),
              const DottedDivider(),
              SizedBox(height: AppSpacing.twentyVertical),
              CustomPaymentDetails(
                amount: totalAmount,
                heading: 'Total Amount',
              ),
              SizedBox(height: AppSpacing.twentyVertical),
              PrimaryButton(
                onTap: () {
                  Get.to<Widget>(() => const AddressView());
                },
                text: 'Checkout',
              ),
            ],
          ),
        );
      },
    );
  }
}

class CustomPaymentDetails extends StatelessWidget {
  final String heading;
  final double amount;
  const CustomPaymentDetails({
    required this.amount,
    required this.heading,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          heading,
          style: AppTypography.kMedium14
              .copyWith(color: AppColors.kGrey70, fontSize: 14.sp),
        ),
        const Spacer(),
        RichText(
          text: TextSpan(
            text: r'$ ',
            style: AppTypography.kSemiBold12
                .copyWith(color: AppColors.kGrey100, fontSize: 12.sp),
            children: [
              TextSpan(
                text: amount.toString(),
                style: AppTypography.kSemiBold16,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
