import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ngamar/core/core.dart';

import '../../../home/data/product_model.dart';
import '../../../home/screens/widgets/custom_like_button.dart';

class ScannedProduct extends StatelessWidget {
  final ProductModel product;
  const ScannedProduct({required this.product, super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100..h,
      child: Row(
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
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  product.name,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: AppTypography.kSemiBold18,
                ),
                Text(
                  product.ownerName,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: AppTypography.kMedium14
                      .copyWith(color: AppColors.kGrey70, fontSize: 10.sp),
                ),
                SizedBox(height: AppSpacing.tenVertical),
                RichText(
                  text: TextSpan(
                    text: r'$ ',
                    style: AppTypography.kMedium14
                        .copyWith(color: AppColors.kGrey100),
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
          Container(
            height: 40.h,
            width: 40.w,
            alignment: Alignment.center,
            decoration: const BoxDecoration(
              color: AppColors.kGrey50,
              shape: BoxShape.circle,
            ),
            child: CustomLikeButton(
              product: product,
            ),
          ),
        ],
      ),
    );
  }
}
