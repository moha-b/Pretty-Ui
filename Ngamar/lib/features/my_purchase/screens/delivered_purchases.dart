import 'package:flutter/material.dart';
import 'package:ngamar/core/core.dart';
import 'package:ngamar/features/my_purchase/screens/widgets/my_purchase_card.dart';

import '../../home/data/product_model.dart';

class DeliveredPurchases extends StatelessWidget {
  const DeliveredPurchases({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemBuilder: (ctx, i) {
        return MyPurchaseCard(
          product: dummyProductList[i],
        );
      },
      separatorBuilder: (ctx, i) => SizedBox(height: AppSpacing.twentyVertical),
      itemCount: dummyProductList.length - 2,
    );
  }
}
