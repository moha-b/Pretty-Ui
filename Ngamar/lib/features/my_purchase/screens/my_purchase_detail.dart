import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ngamar/core/core.dart';
import 'package:ngamar/features/my_purchase/screens/widgets/my_purchase_card.dart';

import '../../checkout/screens/widgets/address_card.dart';
import '../../checkout/screens/widgets/dotted_divider.dart';
import '../../checkout/screens/widgets/drag_sheet.dart';
import '../../home/data/product_model.dart';

class MyPurchaseDetail extends StatelessWidget {
  final ProductModel product;
  const MyPurchaseDetail({required this.product, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Detail',
          style: AppTypography.kSemiBold16.copyWith(color: AppColors.kGrey100),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 24.w,
          vertical: AppSpacing.twentyVertical,
        ),
        child: Column(
          children: [
            MyPurchaseCard(
              product: product,
              isDetailView: true,
            ),
            SizedBox(height: AppSpacing.twentyVertical),
            const AddressCard(
              isDetailView: true,
            ),
            SizedBox(height: AppSpacing.fiftyVertical),
            Container(
              padding: EdgeInsets.all(2.h),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30.r),
                border: Border.all(color: AppColors.kLine),
              ),
              child: Row(
                children: [
                  SizedBox(width: AppSpacing.twelveHorizontal),
                  Text(
                    'Shipping',
                    style: AppTypography.kSemiBold14,
                  ),
                  const Spacer(),
                  PrimaryButton(
                    onTap: () {},
                    text: 'Detail',
                    width: 97.w,
                    height: 36.h,
                    fontSize: 14.sp,
                  ),
                ],
              ),
            ),
            SizedBox(height: AppSpacing.twentyVertical),
            const CustomPaymentDetails(
              heading: 'Subtotal',
              amount: 24.00,
            ),
            SizedBox(height: AppSpacing.tenVertical),
            const CustomPaymentDetails(
              heading: 'Shipping',
              amount: 0.00,
            ),
            SizedBox(height: AppSpacing.tenVertical),
            const DottedDivider(),
            SizedBox(height: AppSpacing.tenVertical),
            const CustomPaymentDetails(
              heading: 'Total Amount',
              amount: 24.00,
            ),
            const Spacer(),
            Row(
              children: [
                Expanded(
                  child: CustomOutlinedButton(
                    onTap: () {},
                    width: 115.0.w,
                    text: 'Rate Now',
                    color: AppColors.kPrimary,
                  ),
                ),
                Expanded(
                  child: PrimaryButton(
                    onTap: () {},
                    width: 115.w,
                    text: 'Buy Now',
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
