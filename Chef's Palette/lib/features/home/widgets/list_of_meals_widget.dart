import 'package:chef/core/resources/dimns.dart';
import 'package:chef/features/detail/detail_screen.dart';
import 'package:chef/features/home/models/meals_model.dart';
import 'package:flutter/material.dart';

import 'meal_card_widget.dart';

class ListOfMeals extends StatelessWidget {
  const ListOfMeals({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: mealList.length,
      padding: const EdgeInsets.only(left: AppDimns.small),
      scrollDirection: Axis.horizontal,
      shrinkWrap: true,
      itemBuilder: (context, index) => InkWell(
        onTap: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const DetailScreen(),
            )),
        child: MealCard(
          meal: mealList[index],
        ),
      ),
      separatorBuilder: (context, index) =>
          const SizedBox(width: AppDimns.medium),
    );
  }
}
