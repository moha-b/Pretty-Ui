import 'package:chef/core/resources/colors.dart';
import 'package:chef/core/resources/dimns.dart';
import 'package:chef/core/resources/images.dart';
import 'package:chef/features/detail/models/ingredient_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class IngredientSection extends StatelessWidget {
  const IngredientSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: ingredientList.length,
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      itemBuilder: (context, index) =>
          IngredientCard(ingredient: ingredientList[index]),
      separatorBuilder: (context, index) =>
          const SizedBox(height: AppDimns.medium),
    );
  }
}

class IngredientCard extends StatelessWidget {
  const IngredientCard({
    super.key,
    required this.ingredient,
  });
  final Ingredient ingredient;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(width: 1),
        color: Colors.white,
        borderRadius: BorderRadius.circular(AppDimns.medium),
      ),
      margin: const EdgeInsets.symmetric(horizontal: AppDimns.medium),
      padding: const EdgeInsets.all(AppDimns.medium),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(AppDimns.big),
            decoration: BoxDecoration(
              color: ingredient.color,
              border: Border.all(width: 1),
              borderRadius: BorderRadius.circular(12),
            ),
            child: SvgPicture.asset(
              ingredient.image,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(width: AppDimns.medium),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                ingredient.name,
                style:
                    const TextStyle(fontWeight: FontWeight.w700, fontSize: 20),
              ),
              const SizedBox(height: AppDimns.small),
              Text(
                ingredient.quantity,
                style: const TextStyle(color: Colors.grey),
              ),
            ],
          ),
          const Spacer(),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 14),
            decoration: BoxDecoration(
              color: AppColors.background,
              border: Border.all(width: 1),
              borderRadius: BorderRadius.circular(12),
            ),
            child: SvgPicture.asset(
              AppImages.plus,
              fit: BoxFit.cover,
              width: 18,
            ),
          ),
        ],
      ),
    );
  }
}
