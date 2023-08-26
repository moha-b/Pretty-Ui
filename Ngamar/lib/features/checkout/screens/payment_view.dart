import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:ngamar/core/core.dart';
import 'package:ngamar/features/checkout/screens/widgets/widgets.dart';

import '../../home/data/product_model.dart';

class PaymentView extends StatelessWidget {
  const PaymentView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Payment',
          style: AppTypography.kSemiBold16.copyWith(color: AppColors.kGrey100),
        ),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        padding: EdgeInsets.symmetric(
          horizontal: 24.w,
          vertical: AppSpacing.twentyVertical,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Address', style: AppTypography.kSemiBold16),
            SizedBox(height: AppSpacing.tenVertical),
            const AddressCard(),
            SizedBox(height: AppSpacing.fifteenVertical),
            Text(
              'Products (${dummyProductList.length})',
              style: AppTypography.kSemiBold16,
            ),
            SizedBox(height: AppSpacing.fifteenVertical),
            ListView.separated(
              itemCount: dummyProductList.length,
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              separatorBuilder: (context, index) =>
                  SizedBox(height: AppSpacing.twentyVertical),
              itemBuilder: (context, index) {
                return PaymentProductCard(
                  product: dummyProductList[index],
                );
              },
            ),
            SizedBox(height: AppSpacing.fifteenVertical),
            Text(
              'Payment Method',
              style: AppTypography.kSemiBold16,
            ),
            SizedBox(height: AppSpacing.fifteenVertical),
            PaymentMethodCard(
              onTap: () {
                showModalBottomSheet<void>(
                  context: context,
                  isScrollControlled: true,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(AppSpacing.radiusThirty),
                    ),
                  ),
                  builder: (context) {
                    return const SelectPaymentMethod();
                  },
                );
              },
            ),
            SizedBox(height: AppSpacing.fifteenVertical),
            const CustomPaymentDetails(
              heading: 'Total Amount',
              amount: 97.00,
            ),
            SizedBox(height: AppSpacing.fifteenVertical),
            PrimaryButton(
              onTap: () {
                Get.dialog<void>(const PaymentSuccessDialog());
              },
              text: 'Pay Now',
            ),
          ],
        ),
      ),
    );
  }
}
