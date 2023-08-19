import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foochi/core/utils/utils.dart';

import '../../../features/menu/data/ingredients.dart';
import '../buttons/custom_icon_button.dart';

class ToppingIngredientCard extends StatelessWidget {
  final Ingredient ingredient;
  final VoidCallback addQuantity;
  final VoidCallback removeQuantity;

  const ToppingIngredientCard({
    super.key,
    required this.ingredient,
    required this.addQuantity,
    required this.removeQuantity,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: 183.w,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomIconButton(
                onTap: removeQuantity,
                size: 36.h,
                icon: AppAssets.kRemove,
              ),
              const Spacer(),
              Image.asset(ingredient.image),
              const Spacer(),
              CustomIconButton(
                onTap: addQuantity,
                size: 36.h,
                icon: AppAssets.kAdd,
              ),
            ],
          ),
        ),
        SizedBox(height: 5.h),
        RichText(
            text: TextSpan(
                text: ingredient.grams.toInt().toString(),
                style:
                    AppTypography.kBold14.copyWith(color: AppColors.kSecondary),
                children: [
              TextSpan(
                  text: 'gr ${ingredient.name}',
                  style: AppTypography.kLight14
                      .copyWith(color: AppColors.kSecondary))
            ])),
        Text(
          '\$${ingredient.price}/gr',
          style: AppTypography.kLight13.copyWith(color: AppColors.kLightBrown),
        )
      ],
    );
  }
}
