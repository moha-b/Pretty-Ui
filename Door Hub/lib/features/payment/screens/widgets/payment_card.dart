import 'package:door_hub/core/common/common_widgets.dart';
import 'package:door_hub/core/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../data/payment_model.dart';

class PaymentCard extends StatelessWidget {
  final PaymentModel payment;
  final VoidCallback onTap;
  final bool? selectedPayment;
  final Color? titleColor;
  const PaymentCard({
    super.key,
    required this.payment,
    required this.onTap,
    this.selectedPayment,
    this.titleColor,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Row(
        children: [
          Container(
            height: 55.h,
            width: 55.w,
            alignment: Alignment.center,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: AssetImage(payment.image),
                  fit: BoxFit.cover,
                )),
          ),
          SizedBox(width: 16.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(payment.cardNumber,
                    style: AppTypography.kMedium16.copyWith(color: titleColor)),
                SizedBox(height: 5.h),
                Text(
                  payment.expireDate,
                  style: AppTypography.kLight13
                      .copyWith(color: AppColors.kNeutral),
                ),
              ],
            ),
          ),
          selectedPayment != null
              ? Container(
                  height: 20.h,
                  width: 20.w,
                  padding: EdgeInsets.all(2.h),
                  decoration: BoxDecoration(
                    border: Border.all(color: AppColors.kPrimary, width: 2.w),
                    shape: BoxShape.circle,
                  ),
                  child: selectedPayment!
                      ? Container(
                          decoration: const BoxDecoration(
                              color: AppColors.kPrimary,
                              shape: BoxShape.circle),
                        )
                      : null,
                )
              : IgnorePointer(
                  ignoring: true,
                  child: CustomButton(
                    icon: AppAssets.kEdit,
                    onTap: () {},
                    text: 'Apply',
                    isBorder: true,
                  ),
                )
        ],
      ),
    );
  }
}
