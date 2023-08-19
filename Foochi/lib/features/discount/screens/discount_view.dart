import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foochi/core/utils/utils.dart';
import 'package:foochi/features/discount/screens/widgets/discount_banner.dart';
import 'package:foochi/features/discount/screens/widgets/discount_card.dart';

import '../../../core/common/texts/heading_rich_text.dart';
import '../../menu/data/food_dish.dart';

class DiscountView extends StatelessWidget {
  const DiscountView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Column(
            children: [
              SizedBox(height: 20.h),
              const HeadingRichText(text1: 'Discount\n', text2: 'For You!'),
              SizedBox(height: 30.h),
              const DiscountBanner(),
              SizedBox(height: AppSpacing.twentyVertical),
              ListView.separated(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (ctx, i) {
                    return DiscountCard(
                      dish: discountDishes[i],
                    );
                  },
                  separatorBuilder: (ctx, i) => SizedBox(height: 20.h),
                  itemCount: discountDishes.length)
            ],
          ),
        ),
      ),
    );
  }
}
