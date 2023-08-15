import 'package:door_hub/core/common/common_widgets.dart';
import 'package:door_hub/core/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../categories/screens/widgets/sub_category_grid_card.dart';
import '../../categories/screens/widgets/sub_category_list_card.dart';
import '../../home/data/services_model.dart';

class OffersView extends StatefulWidget {
  const OffersView({super.key});

  @override
  State<OffersView> createState() => _OffersViewState();
}

class _OffersViewState extends State<OffersView> {
  bool _isGridView = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20.h),
            Row(
              children: [
                CustomHeaderText(text: 'Offers For You', fontSize: 18.sp),
                const Spacer(),
                CustomIconButton(
                    onTap: () {
                      setState(() {
                        _isGridView = false;
                      });
                    },
                    isEnabled: _isGridView == false,
                    icon: AppAssets.kList),
                SizedBox(width: 8.w),
                CustomIconButton(
                    onTap: () {
                      setState(() {
                        _isGridView = true;
                      });
                    },
                    isEnabled: _isGridView == true,
                    icon: AppAssets.kGrid),
              ],
            ),
            SizedBox(height: 16.h),
            PrimaryContainer(
              child: AnimatedCrossFade(
                  firstChild: ListView.separated(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        return SubCategoryListCard(
                          service: allServices[index],
                        );
                      },
                      separatorBuilder: (context, index) => const Divider(),
                      itemCount: 5),
                  secondChild: GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 148.w / 237.h,
                        mainAxisSpacing: 10.w,
                        crossAxisSpacing: 10.w),
                    itemCount: 6,
                    itemBuilder: (context, index) {
                      return SubCategoryGridCard(
                        service: allServices[index],
                      );
                    },
                  ),
                  crossFadeState: _isGridView
                      ? CrossFadeState.showSecond
                      : CrossFadeState.showFirst,
                  duration: const Duration(milliseconds: 500)),
            )
          ],
        ),
      ),
    );
  }
}
