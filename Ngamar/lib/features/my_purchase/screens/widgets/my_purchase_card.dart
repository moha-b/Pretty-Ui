import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:ngamar/core/core.dart';

import '../../../home/data/product_model.dart';
import '../../../tracking/screens/tracking_order.dart';
import '../my_purchase_detail.dart';

class MyPurchaseCard extends StatelessWidget {
  final ProductModel product;
  final bool isDetailView;
  const MyPurchaseCard({
    required this.product,
    this.isDetailView = false,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(AppSpacing.radiusTen),
        border: Border.all(
          color: AppColors.kLine,
        ),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                height: 71.h,
                width: 71.w,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5.r),
                  image: DecorationImage(
                    image: AssetImage(product.image),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(width: AppSpacing.tenHorizontal),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      product.name,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: AppTypography.kMedium16,
                    ),
                    Text(
                      'By Leopar Zega',
                      style: AppTypography.kMedium14.copyWith(
                          color: AppColors.kGrey70, fontSize: 12.0.sp),
                    ),
                    Text(
                      'Qty: 1',
                      style: AppTypography.kMedium14
                          .copyWith(color: AppColors.kGrey70, fontSize: 12.sp),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5.0.r),
                        border: Border.all(color: AppColors.kBlue),
                      ),
                      child: Text(
                        'On Process',
                        style: AppTypography.kLight10
                            .copyWith(color: AppColors.kBlue),
                      ),
                    ),
                    SizedBox(height: AppSpacing.twentyVertical),
                    RichText(
                      text: TextSpan(
                        text: r'$ ',
                        style: AppTypography.kMedium14.copyWith(
                          color: AppColors.kGrey100,
                          fontSize: 12..sp,
                        ),
                        children: [
                          TextSpan(
                            text: product.currentPrice.toString(),
                            style: AppTypography.kSemiBold16,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: AppSpacing.twentyVertical),
          if (!isDetailView)
            Row(
              children: [
                Expanded(
                  child: CustomOutlinedButton(
                    onTap: () {
                      Get.to<Widget>(() => MyPurchaseDetail(
                            product: product,
                          ));
                    },
                    width: 115.0.w,
                    borderRadius: 30.0.r,
                    height: 40.0.h,
                    fontSize: 13.0.sp,
                    text: 'Detail',
                    color: AppColors.kPrimary,
                  ),
                ),
                Expanded(
                  child: PrimaryButton(
                    onTap: () {
                      Get.to<Widget>(() => const TrackingOrder());
                    },
                    width: 115.w,
                    borderRadius: 30.r,
                    height: 40.h,
                    fontSize: 13.sp,
                    text: 'Tracking',
                  ),
                ),
              ],
            )
          else
            const SizedBox(),
        ],
      ),
    );
  }
}
