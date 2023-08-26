import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:like_button/like_button.dart';
import 'package:ngamar/core/core.dart';

import '../../../favorite/controller/favorite_controller.dart';
import '../../data/product_model.dart';


class CustomLikeButton extends StatelessWidget {
  final ProductModel product;
  const CustomLikeButton({
    required this.product,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final favoriteController = Get.find<FavoriteController>();

    return Obx(() {
      final isProductLiked = favoriteController.isProductInFavorites(product);
      return LikeButton(
        size: 20,
        padding: EdgeInsets.zero,
        circleColor: const CircleColor(
          start: AppColors.kError,
          end: AppColors.kError,
        ),
        bubblesColor: const BubblesColor(
          dotPrimaryColor: AppColors.kPrimary,
          dotSecondaryColor: AppColors.kPrimary,
        ),
        isLiked: isProductLiked,
        likeBuilder: (isProductLiked) {
          return Icon(
            isProductLiked ? Icons.favorite : Icons.favorite_border_rounded,
            color: isProductLiked ? AppColors.kError : AppColors.kWhite,
            size: 20,
          );
        },
        onTap: (isProductLiked) {
          if (isProductLiked) {
            favoriteController.removeFromFavorites(product);
          } else {
            favoriteController.addToFavorites(product);
          }
          return Future.value(!isProductLiked);
        },
      );
    });
  }
}
