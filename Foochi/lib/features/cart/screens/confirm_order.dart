import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foochi/core/common/common.dart';
import 'package:foochi/core/utils/utils.dart';
import 'package:foochi/features/cart/screens/widgets/payment_method_select.dart';
import 'package:get/get.dart';

import '../../profile/data/credit_card.dart';
import '../../profile/screens/widgets/credit_card.dart';
import 'completed_order_view.dart';

class ConfirmOrderView extends StatelessWidget {
  const ConfirmOrderView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(),
      ),
      body: Container(
        padding: EdgeInsets.all(20.h),
        decoration: BoxDecoration(
            color: AppColors.kLightPink2,
            borderRadius: BorderRadius.vertical(top: Radius.circular(20.r))),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CustomDivider(),
              SizedBox(height: 10.h),
              Center(
                  child: Text('Confirm Order', style: AppTypography.kBold24)),
              SizedBox(height: 20.h),
              Row(
                children: [
                  Image.asset(AppAssets.kFoodImage1, height: 70.h),
                  const Spacer(),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text('Total', style: AppTypography.kLight14),
                      Text('\$${38.99 + 8.00}',
                          style: AppTypography.kBold24
                              .copyWith(color: AppColors.kPrimary)),
                    ],
                  )
                ],
              ),
              SizedBox(height: 20.h),
              Text('Payment Method', style: AppTypography.kBold18),
              Text('Click one of your method', style: AppTypography.kLight13),
              SizedBox(height: 20.h),
              const PaymentMethodSelector(),
              SizedBox(height: 20.h),
              CreditCard(
                creditCard: masterCard,
              ),
              SizedBox(height: 20.h),
              Row(
                children: [
                  Column(
                    children: [
                      Text('Payment Method', style: AppTypography.kBold18),
                      Text('Click one of your method',
                          style: AppTypography.kLight13),
                    ],
                  ),
                  const Spacer(),
                  CustomIconButton(onTap: () {}, icon: AppAssets.kLocation)
                ],
              ),
              SizedBox(height: 20.h),
              Row(
                children: [
                  Text('004 Riley Street, 2050 Sydney',
                      style: AppTypography.kExtraLight14),
                  const Spacer(),
                  CustomIconButton(onTap: () {}, icon: AppAssets.kEdit)
                ],
              ),
              SizedBox(height: 15.h),
              Row(
                children: [
                  CustomIconButton(
                    onTap: () {
                      Get.back();
                    },
                    icon: AppAssets.kArrowLeft,
                    size: 50.h,
                  ),
                  SizedBox(width: 12.w),
                  Expanded(
                    child: PrimaryButton(
                      onTap: () {
                        Get.to(() => const CompletedOrderView());
                      },
                      height: 50.h,
                      borderRadius: 10.r,
                      text: 'Confirmation',
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
