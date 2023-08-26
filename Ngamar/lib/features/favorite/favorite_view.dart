import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:ngamar/core/core.dart';

import '../checkout/screens/cart_view.dart';
import '../checkout/screens/widgets/no_item_card.dart';
import '../home/screens/widgets/product_card.dart';
import 'controller/favorite_controller.dart';


class FavoriteView extends StatefulWidget {
  const FavoriteView({super.key});

  @override
  State<FavoriteView> createState() => _FavoriteViewState();
}

class _FavoriteViewState extends State<FavoriteView> {
  final TextEditingController _searchController = TextEditingController();
  FavoriteController fc = Get.find<FavoriteController>();
  @override
  Widget build(BuildContext context) {
    debugPrint(fc.favorite!.length.toString());
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Favorite',
          style: AppTypography.kSemiBold16.copyWith(color: AppColors.kGrey100),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Get.to<Widget>(CartView.new);
            },
            icon: SvgPicture.asset(AppAssets.kBag),
          ),
          SizedBox(width: 10.w),
        ],
      ),
      body: ListView(
        physics: const BouncingScrollPhysics(),
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        children: [
          SearchField(
            controller: _searchController,
            filterCallback: () {},
          ),
          SizedBox(height: AppSpacing.thirtyVertical),
          Obx(() => fc.favorite != null && fc.favorite!.isNotEmpty
              ? AnimationLimiter(
                  child: GridView.count(
                    shrinkWrap: true,
                    childAspectRatio: 153.w / 221.h,
                    physics: const NeverScrollableScrollPhysics(),
                    padding: const EdgeInsets.all(8.0),
                    crossAxisCount: 2,
                    crossAxisSpacing: AppSpacing.tenHorizontal,
                    mainAxisSpacing: AppSpacing.twentyVertical,
                    children: List.generate(
                      fc.favorite!.length,
                      (index) {
                        return AnimationConfiguration.staggeredGrid(
                          columnCount: 2,
                          position: index,
                          duration: const Duration(milliseconds: 375),
                          child: FadeInAnimation(
                            duration: const Duration(seconds: 1),
                            child: FadeInAnimation(
                              child: ProductCard(
                                product: fc.favorite![index],
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                )
              : const NoItemCard()),
        ],
      ),
    );
  }
}
