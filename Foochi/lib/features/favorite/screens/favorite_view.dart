import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:foochi/core/utils/utils.dart';
import 'package:foochi/features/favorite/screens/widgets/favorite_card.dart';
import 'package:get/get.dart';

import '../../../core/common/texts/heading_rich_text.dart';
import '../controller/favorite_controller.dart';

class FavoriteView extends StatefulWidget {
  const FavoriteView({super.key});

  @override
  State<FavoriteView> createState() => _FavoriteViewState();
}

class _FavoriteViewState extends State<FavoriteView> {
  FavoriteController fc = Get.find<FavoriteController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20.h),
            const HeadingRichText(
              text1: 'Your\n',
              text2: 'Favorites',
            ),
            SizedBox(height: 28.h),
            Container(
              height: 155.h,
              width: double.maxFinite,
              padding: EdgeInsets.all(12.h),
              alignment: Alignment.centerRight,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25.r),
                  image: DecorationImage(
                      image: AssetImage(AppAssets.kFavoriteBanner),
                      fit: BoxFit.cover)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Discount Upto', style: AppTypography.kExtraLight14),
                  Text('40%',
                      style: AppTypography.kBold48
                          .copyWith(color: AppColors.kOrange)),
                ],
              ),
            ),
            SizedBox(height: 31.h),
            Text('All Dishes', style: AppTypography.kBold18),
            SizedBox(height: 20.h),
            Obx(() => fc.favorite != null && fc.favorite!.isNotEmpty
                ? AnimationLimiter(
                    child: ListView.separated(
                      itemCount: fc.favorite!.length,
                      separatorBuilder: (context, index) =>
                          SizedBox(height: 15.h),
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (BuildContext context, int index) {
                        return AnimationConfiguration.staggeredList(
                          position: index,
                          duration: const Duration(milliseconds: 375),
                          child: SlideAnimation(
                            verticalOffset: 50.0,
                            child: FadeInAnimation(
                              child: FavoriteCard(
                                dish: fc.favorite![index],
                                removeCallback: () {
                                  fc.removeFromFavorites(fc.favorite![index]);
                                },
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  )
                : const Center(child: Text('No Favorites'))),
          ],
        ),
      )),
    );
  }
}
