import 'package:chef/core/resources/colors.dart';
import 'package:chef/core/resources/dimns.dart';
import 'package:chef/core/resources/images.dart';
import 'package:chef/core/resources/sizes.dart';
import 'package:chef/features/home/models/meals_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class MealCard extends StatelessWidget {
  const MealCard({
    super.key,
    required this.meal,
  });
  final Meal meal;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: getScreenWidth(220),
      padding: const EdgeInsets.all(AppDimns.medium),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(AppDimns.big),
        border: Border.all(width: 1),
        color: Colors.white,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            height: getScreenHeight(280) / 2,
            clipBehavior: Clip.antiAlias,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(AppDimns.medium),
                border: Border.all(width: 1),
                image: DecorationImage(
                    image: AssetImage(meal.image), fit: BoxFit.cover)),
          ),
          Text(
            meal.name,
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
          ),
          Text(
            meal.chef,
            style: const TextStyle(
                color: Colors.grey, fontWeight: FontWeight.w500),
          ),
          Row(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(AppDimns.big),
                  border: Border.all(width: 1),
                  color: AppColors.pink,
                ),
                child: Row(
                  children: [
                    SvgPicture.asset(
                      AppImages.clock,
                      color: Colors.black,
                    ),
                    const SizedBox(width: AppDimns.small),
                    const Text("30m"),
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.only(left: AppDimns.small),
                padding: const EdgeInsets.all(7),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(AppDimns.big),
                  border: Border.all(width: 1),
                ),
                child: SvgPicture.asset(
                  AppImages.play,
                  width: 15,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
