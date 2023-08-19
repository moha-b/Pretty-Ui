import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foochi/core/utils/utils.dart';
import 'package:foochi/features/menu/screens/recent_search.dart';
import 'package:foochi/features/menu/screens/search_result_view.dart';
import 'package:foochi/features/menu/screens/widgets/custom_indicator_shape.dart';
import 'package:foochi/features/menu/screens/widgets/filter_sheet.dart';
import 'package:foochi/features/menu/screens/widgets/search_field.dart';
import 'package:get/get.dart';

import '../../../core/common/buttons/custom_icon_button.dart';
import '../../../core/common/texts/heading_rich_text.dart';
import '../controller/search_controller.dart';
import 'main_dishes_view.dart';

class MenuView extends StatefulWidget {
  const MenuView({Key? key}) : super(key: key);

  @override
  State<MenuView> createState() => _MenuViewState();
}

class _MenuViewState extends State<MenuView> {
  final KSearchController sc = Get.put(KSearchController());
  final TextEditingController _searchController = TextEditingController();
  final FocusNode _searchFocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _searchFocusNode.addListener(_onFocusChange);
    _searchController.addListener(_onSearch);
  }

  @override
  void dispose() {
    _searchFocusNode.removeListener(_onFocusChange);
    _searchFocusNode.dispose();
    _searchController.dispose();
    super.dispose();
  }

  void _onFocusChange() {
    setState(() {});
  }

  void _onSearch() {
    String searchText = _searchController.text;
    if (_searchFocusNode.hasFocus && searchText.isNotEmpty) {
      sc.performSearch(searchText);
    }
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        body: SafeArea(
            child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Column(
            children: [
              SizedBox(height: 20.h),
              const HeadingRichText(
                text1: 'We have\n',
                text2: 'Great Menu',
              ),
              SizedBox(height: 28.h),
              Row(
                children: [
                  Expanded(
                    child: SearchField(
                      controller: _searchController,
                      focusNode: _searchFocusNode,
                      onChange: (v) => _onSearch(),
                    ),
                  ),
                  SizedBox(width: 10.w),
                  CustomIconButton(
                    onTap: () {
                      showModalBottomSheet(
                        context: context,
                        isScrollControlled: true,
                        barrierColor: Colors.transparent,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.vertical(
                            top: Radius.circular(30.r),
                          ),
                        ),
                        builder: (context) {
                          return const FilterSheet();
                        },
                      );
                    },
                    icon: AppAssets.kFilter,
                    borderCol: AppColors.kLine,
                  )
                ],
              ),
              SizedBox(height: 30.h),
              if (!_searchFocusNode.hasFocus && _searchController.text.isEmpty)
                TabBar(
                  indicator: BoxTabIndicator(
                    width: 25.w,
                    color: AppColors.kPrimary,
                  ),
                  isScrollable: true,
                  labelPadding: EdgeInsets.only(left: 0, right: 29.w),
                  indicatorSize: TabBarIndicatorSize.tab,
                  labelStyle: AppTypography.kMedium16,
                  labelColor: AppColors.kSecondary,
                  unselectedLabelColor: AppColors.kLightBrown,
                  tabs: const [
                    Tab(text: 'Main Dishes'),
                    Tab(text: 'Desserts'),
                    Tab(text: 'Drinks'),
                  ],
                ),
              SizedBox(height: 20.h),
              Expanded(child: _buildBody())
            ],
          ),
        )),
      ),
    );
  }

  Widget _buildBody() {
    final searchText = _searchController.text;
    final searchResults = sc.searchResults;
    if (_searchFocusNode.hasFocus && searchText.isEmpty) {
      return const RecentSearch();
    } else if (searchText.isNotEmpty) {
      return Obx(() => SearchResultView(dish: searchResults.value));
    } else {
      return _buildTabBarView();
    }
  }

  Widget _buildTabBarView() {
    return TabBarView(
      children: [
        const MainDishesView(),
        Container(),
        Container(),
      ],
    );
  }
}
