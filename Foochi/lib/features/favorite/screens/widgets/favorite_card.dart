import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:foochi/core/utils/utils.dart';

import '../../../../core/common/buttons/custom_icon_button.dart';
import '../../../menu/data/food_dish.dart';
import '../../../menu/screens/widgets/search_result_card.dart';

class FavoriteCard extends StatelessWidget {
  final FoodDish dish;
  final VoidCallback removeCallback;
  const FavoriteCard(
      {super.key, required this.dish, required this.removeCallback});

  @override
  Widget build(BuildContext context) {
    return Slidable(
        endActionPane: ActionPane(
          extentRatio: 0.2,
          motion: const ScrollMotion(),
          children: [
            SizedBox(width: 20.w),
            CustomIconButton(
              icon: AppAssets.kDelete,
              onTap: removeCallback,
            ),
          ],
        ),
        child: SearchResultCard(
          dish: dish,
        ));
  }
}
