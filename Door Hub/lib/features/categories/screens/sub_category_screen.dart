import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/common/buttons/custom_icon_button.dart';
import '../../../core/common/containers/primary_container.dart';
import '../../../core/common/texts/custom_header_text.dart';
import '../../../core/utils/app_assets.dart';
import '../../home/data/category_model.dart';
import '../../home/data/services_model.dart';
import '../../home/screens/widgets/search_field.dart';
import '../screens/widgets/sub_category_grid_card.dart';
import '../screens/widgets/sub_category_list_card.dart';

class SubCategoryView extends StatefulWidget {
  final CategoryModel category;

  const SubCategoryView({required this.category, Key? key}) : super(key: key);

  @override
  State<SubCategoryView> createState() => _SubCategoryViewState();
}

class _SubCategoryViewState extends State<SubCategoryView> {
  final _searchController = TextEditingController();
  bool _isGridView = false;

  List<ServicesModel> subCategoriesList = [];

  @override
  void initState() {
    super.initState();
    filterServicesByCategory(widget.category);
  }

  void filterServicesByCategory(CategoryModel category) {
    setState(() {
      subCategoriesList =
          allServices.where((service) => service.category == category).toList();
    });
  }

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
            PrimaryContainer(
              child: SearchField(
                controller: _searchController,
                onSearchPress: () {},
              ),
            ),
            SizedBox(height: 16.h),
            Row(
              children: [
                CustomHeaderText(
                  text: widget.category.name,
                  fontSize: 18.sp,
                ),
                const Spacer(),
                CustomIconButton(
                  onTap: () {
                    setState(() {
                      _isGridView = false;
                    });
                  },
                  isEnabled: !_isGridView,
                  icon: AppAssets.kList,
                ),
                SizedBox(width: 8.w),
                CustomIconButton(
                  onTap: () {
                    setState(() {
                      _isGridView = true;
                    });
                  },
                  isEnabled: _isGridView,
                  icon: AppAssets.kGrid,
                ),
              ],
            ),
            SizedBox(height: 16.h),
            PrimaryContainer(
              child: AnimatedCrossFade(
                firstChild: ListView.separated(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    final service = subCategoriesList[index];
                    return SubCategoryListCard(
                      service: service,
                    );
                  },
                  separatorBuilder: (context, index) => const Divider(),
                  itemCount: subCategoriesList.length,
                ),
                secondChild: GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 148.w / 237.h,
                    mainAxisSpacing: 10.w,
                    crossAxisSpacing: 10.w,
                  ),
                  itemCount: subCategoriesList.length,
                  itemBuilder: (context, index) {
                    final service = subCategoriesList[index];
                    return SubCategoryGridCard(
                      service: service,
                    );
                  },
                ),
                crossFadeState: _isGridView
                    ? CrossFadeState.showSecond
                    : CrossFadeState.showFirst,
                duration: const Duration(milliseconds: 500),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
