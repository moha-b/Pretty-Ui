import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:ngamar/core/core.dart';

import '../../data/product_model.dart';
import '../product_detail_view.dart';
import 'custom_like_button.dart';


class ProductCard extends StatelessWidget {
  final ProductModel product;
  const ProductCard({required this.product, super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to<Widget>(() => ProductDetailView(product: product));
      },
      child: Column(
        children: [
          Hero(
            tag: product.id,
            child: Container(
              height: 167.h,
              width: 153.w,
              alignment: Alignment.topLeft,
              padding: EdgeInsets.all(12.h),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.r),
                image: DecorationImage(
                  image: AssetImage(product.image),
                  fit: BoxFit.cover,
                ),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
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
                  const Spacer(),
                  SizedBox(
                    height: 20.h,
                    child: CustomLikeButton(
                      product: product,
                    ),
                  ),
                ],
              ),
            ),
          ),
          const Spacer(),
          Text(
            product.name,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: AppTypography.kSemiBold12,
          ),
          SizedBox(height: AppSpacing.fiveVertical),
          RichText(
            text: TextSpan(
              text: '\$${product.oldPrice.toInt()}  ',
              style: AppTypography.kLight10.copyWith(color: AppColors.kGrey60),
              children: [
                TextSpan(
                  text: '\$${product.currentPrice.toInt()}',
                  style: AppTypography.kSemiBold14
                      .copyWith(color: AppColors.kGrey100),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
