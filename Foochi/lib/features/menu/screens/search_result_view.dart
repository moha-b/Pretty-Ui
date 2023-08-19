import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foochi/features/menu/screens/widgets/search_result_card.dart';

import '../data/food_dish.dart';

class SearchResultView extends StatelessWidget {
  final List<FoodDish> dish;
  const SearchResultView({super.key, required this.dish});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        itemBuilder: (ctx, i) {
          return SearchResultCard(
            dish: dish[i],
          );
        },
        separatorBuilder: (ctx, i) => SizedBox(height: 10.h),
        itemCount: dish.length);
  }
}
