import 'package:door_hub/features/home/screens/widgets/home_appbar.dart';
import 'package:door_hub/features/home/screens/widgets/home_services_card.dart';
import 'package:door_hub/features/home/screens/widgets/offers_list.dart';
import 'package:door_hub/features/home/screens/widgets/search_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:showcaseview/showcaseview.dart';

import '../../../core/common/buttons/custom_button.dart';
import '../../../core/common/containers/primary_container.dart';
import '../../../core/common/texts/custom_header_text.dart';
import '../../../core/utils/utils.dart';
import '../../categories/screens/all_categories_screen.dart';
import '../../categories/screens/widgets/category_card.dart';
import '../data/category_model.dart';
import '../data/services_model.dart';

class HomeScreen extends StatefulWidget {
  final GlobalKey<ScaffoldState> drawerKey;
  const HomeScreen({super.key, required this.drawerKey});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GlobalKey _one = GlobalKey();
  final GlobalKey _two = GlobalKey();
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    ambiguate(WidgetsBinding.instance)?.addPostFrameCallback(
      (_) => ShowCaseWidget.of(context).startShowCase([_one, _two]),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HomeAppBar(
        showCaseKey: _one,
        onLeadingPressed: () {
          widget.drawerKey.currentState?.openDrawer();
        },
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Column(
          children: [
            SizedBox(height: 20.h),
            PrimaryContainer(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Hello hab 👋',
                      style: AppTypography.kMedium14
                          .copyWith(color: AppColors.kGrey)),
                  SizedBox(height: 4.h),
                  Text('What you are looking for today',
                      style: AppTypography.kBold32),
                  SizedBox(height: 14.h),
                  SearchField(
                    controller: _searchController,
                    onSearchPress: () {},
                  ),
                ],
              ),
            ),
            SizedBox(height: 16.h),
            const OfferList(),
            SizedBox(height: 16.h),
            PrimaryContainer(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: List.generate(4, (index) {
                  if (index == 3) {
                    return CategorySeeAllButton(onTap: () {
                      Get.to(() => const AllCategories());
                    });
                  } else {
                    return CategoryCard(
                      category: categories[index],
                    );
                  }
                }),
              ),
            ),
            SizedBox(height: 16.h),
            PrimaryContainer(
                padding: EdgeInsets.zero,
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.all(16.h),
                      child: Row(
                        children: [
                          CustomHeaderText(
                            text: 'Cleaning Services',
                            fontSize: 18.sp,
                          ),
                          const Spacer(),
                          CustomButton(
                              text: 'See All',
                              icon: AppAssets.kArrowForward,
                              isBorder: true,
                              onTap: () {})
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 195.h,
                      child: ListView.separated(
                          scrollDirection: Axis.horizontal,
                          padding: EdgeInsets.only(left: 16.w),
                          itemBuilder: (context, index) {
                            return HomeServicesCard(
                              service: cleaningServices[index],
                            );
                          },
                          separatorBuilder: (context, index) =>
                              SizedBox(width: 16.w),
                          itemCount: cleaningServices.length),
                    ),
                    SizedBox(height: 16.h),
                  ],
                )),
          ],
        ),
      ),
    );
  }
}
