import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:ngamar/core/core.dart';
import 'package:ngamar/features/home/data/product_model.dart';

import '../../../home/screens/product_detail_view.dart';
import '../../../home/screens/widgets/quantity_card.dart';


class CartItemCard extends StatelessWidget {
  final ProductModel product;
  final VoidCallback removeCallback;
  const CartItemCard({
    required this.product,
    required this.removeCallback,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to<Widget>(() => ProductDetailView(product: product));
      },
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          SizedBox(
            height: 100.h,
            width: 100.w,
            child: Stack(
              alignment: Alignment.topCenter,
              children: [
                Positioned(
                  bottom: 0,
                  child: Container(
                    height: 92.h,
                    width: 92.w,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(AppSpacing.radiusTen),
                      image: DecorationImage(
                        image: AssetImage(product.image),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                Transform.rotate(
                  angle: -0.2,
                  child: Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 10.w,
                      vertical: 5.h,
                    ),
                    decoration: BoxDecoration(
                      color: AppColors.kPrimary,
                      borderRadius: BorderRadius.circular(20.r),
                    ),
                    child: Text(
                      product.offPercentage,
                      style: AppTypography.kSemiBold10,
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(width: AppSpacing.tenHorizontal),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        product.name,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: AppTypography.kSemiBold18,
                      ),
                    ),
                    SizedBox(width: 5.w),
                    IconButton(
                      onPressed: removeCallback,
                      padding: EdgeInsets.zero,
                      constraints: const BoxConstraints(),
                      icon: const Icon(
                        Icons.delete_outline_rounded,
                        color: AppColors.kError,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: AppSpacing.fiveVertical),
                Text(
                  'By Leopar Zega',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: AppTypography.kMedium14
                      .copyWith(color: AppColors.kGrey70, fontSize: 10.sp),
                ),
                SizedBox(height: AppSpacing.tenHorizontal),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    QuantityCard(
                      onChanged: (quantity) {},
                    ),
                    RichText(
                      text: TextSpan(
                        text: r'$ ',
                        style: AppTypography.kMedium14
                            .copyWith(color: AppColors.kGrey100),
                        children: [
                          TextSpan(
                            text: product.currentPrice.toString(),
                            style: AppTypography.kSemiBold24,
                          ),
                        ],
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
