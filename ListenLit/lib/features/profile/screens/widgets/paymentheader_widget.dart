import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:listenlit/core/utils/utils.dart';

import '../add_paymentmethod_screen.dart';

class PaymentHeaderWidget extends StatelessWidget {
  const PaymentHeaderWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Payment',
          style: TextStyle(
            fontSize: 24.sp,
            fontFamily: 'Inter',
            color: AppColor.kLightAccentColor,
            fontWeight: FontWeight.w500,
          ),
        ),
        GestureDetector(
          onTap: () {},
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 9.h, horizontal: 12.w),
            width: 127.w,
            height: 42.h,
            decoration: BoxDecoration(
              border: Border.all(
                color: AppColor.kGrey3Color,
              ),
              borderRadius: BorderRadius.circular(20.r),
            ),
            child: GestureDetector(
              onTap: () {
                Get.to(() => const AddPaymentMethodScreen());
              },
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Add a Card',
                      style: TextStyle(
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w400,
                        fontSize: 14.sp,
                        color: AppColor.kLightAccentColor,
                      ),
                    ),
                    Icon(
                      Icons.add_circle_outline_rounded,
                      color: AppColor.kLightAccentColor,
                      size: 24.sp,
                    )
                  ]),
            ),
          ),
        ),
      ],
    );
  }
}
