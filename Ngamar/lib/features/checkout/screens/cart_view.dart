import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:ngamar/core/core.dart';
import 'package:ngamar/features/checkout/screens/widgets/widgets.dart';

import '../controller/cart_controller.dart';


class CartView extends StatelessWidget {
  CartController cc = Get.find<CartController>();
  CartView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(),
        centerTitle: true,
        title: Text(
          'Cart',
          style: AppTypography.kSemiBold18.copyWith(color: AppColors.kGrey100),
        ),
      ),
      body: Obx(() {
        return cc.cartItems.isEmpty
            ? const NoItemCard()
            : Stack(
                children: [
                  ListView.separated(
                    itemCount: cc.cartItems.length,
                    physics: const BouncingScrollPhysics(),
                    padding: EdgeInsets.symmetric(
                      horizontal: 24.w,
                      vertical: AppSpacing.twentyVertical,
                    ),
                    separatorBuilder: (context, index) =>
                        SizedBox(height: AppSpacing.twentyVertical),
                    itemBuilder: (context, index) {
                      return CartItemCard(
                        product: cc.cartItems[index].product,
                        removeCallback: () {
                          cc.removeFromCart(cc.cartItems[index].product);
                        },
                      );
                    },
                  ),
                  DragSheet(
                    shipping: 8.00,
                    subtotal: cc.getSubtotal(),
                    totalAmount: cc.getSubtotal() + 8.00,
                  ),
                ],
              );
      }),
    );
  }
}
