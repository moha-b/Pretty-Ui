import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foochi/core/common/common.dart';
import 'package:foochi/core/utils/utils.dart';
import 'package:foochi/features/cart/screens/widgets/cart_card.dart';
import 'package:get/get.dart';

import '../controllers/cart_controller.dart';
import 'confirm_order.dart';

class CartView extends StatefulWidget {
  const CartView({super.key});

  @override
  State<CartView> createState() => _CartViewState();
}

class _CartViewState extends State<CartView> {
  CartController cc = Get.find<CartController>();
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
        child: Column(
          children: [
            const CustomDivider(),
            SizedBox(height: 10.h),
            Text('Your Cart', style: AppTypography.kBold24),
            SizedBox(height: 20.h),
            Obx(() => Expanded(
                  child: ListView.separated(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (ctx, i) {
                        return CartCard(
                          dish: cc.cartItems[i].foodDish,
                          deleteFromCart: () =>
                              cc.removeFromCart(cc.cartItems[i].foodDish),
                        );
                      },
                      separatorBuilder: (context, i) => SizedBox(height: 20.h),
                      itemCount: cc.cartItems.value.length),
                )),
            SizedBox(height: 20.h),
            const DottedDivider(color: AppColors.kLine2),
            SizedBox(height: 20.h),
            Row(
              children: [
                Text('Delivery Fee', style: AppTypography.kLight14),
                const Spacer(),
                Text('\$${1.00}', style: AppTypography.kMedium16),
              ],
            ),
            SizedBox(height: 10.h),
            Row(
              children: [
                Text('Total', style: AppTypography.kLight14),
                const Spacer(),
                Text('\$${cc.getSubtotal() + 8.00}',
                    style: AppTypography.kBold24
                        .copyWith(color: AppColors.kPrimary)),
              ],
            ),
            SizedBox(height: 20.h),
            PrimaryButton(
                onTap: () {
                  Get.to(() => const ConfirmOrderView());
                },
                text: 'Confirm Order')
          ],
        ),
      ),
    );
  }
}
