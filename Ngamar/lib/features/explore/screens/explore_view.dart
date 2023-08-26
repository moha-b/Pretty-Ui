import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:ngamar/core/core.dart';
import 'package:ngamar/features/explore/screens/widgets/product_type_card.dart';

import '../../checkout/screens/cart_view.dart';
import '../../home/data/product_model.dart';
import '../../home/screens/widgets/product_card.dart';
import '../../search/screens/search_view.dart';

class ExploreView extends StatefulWidget {
  const ExploreView({Key? key}) : super(key: key);

  @override
  State<ExploreView> createState() => _ExploreViewState();
}

class _ExploreViewState extends State<ExploreView> {
  final TextEditingController _searchController = TextEditingController();
  int _selectedType = 0;
  ProductCategory _productCategory = ProductCategory.all;

  List<ProductModel> getFilteredProducts() {
    if (_productCategory == ProductCategory.all) {
      return dummyProductList;
    } else {
      return dummyProductList
          .where((product) => product.category == _productCategory)
          .toList();
    }
  }

  @override
  Widget build(BuildContext context) {
    final filteredProducts = getFilteredProducts();

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: Text(
          'Discover',
          style: AppTypography.kSemiBold18.copyWith(color: AppColors.kGrey100),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Get.to<Widget>(CartView.new);
            },
            icon: SvgPicture.asset(
              AppAssets.kBag,
              colorFilter:
                  const ColorFilter.mode(AppColors.kWhite, BlendMode.srcIn),
            ),
          ),
          SizedBox(width: AppSpacing.tenHorizontal),
        ],
      ),
      body: ListView(
        physics: const BouncingScrollPhysics(),
        children: [
          SizedBox(height: 20.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: GestureDetector(
              onTap: () {
                Get.to<Widget>(() => const SearchView());
              },
              child: SearchField(
                controller: _searchController,
                isEnabled: false,
                filterCallback: () {},
              ),
            ),
          ),
          SizedBox(height: 16.w),
          SizedBox(
            height: 36.h,
            child: ListView.separated(
              itemCount: ProductCategory.values.length,
              scrollDirection: Axis.horizontal,
              padding: EdgeInsets.only(left: 24.0.w),
              physics: const BouncingScrollPhysics(),
              separatorBuilder: (context, index) => SizedBox(
                width: 8.w,
              ),
              itemBuilder: (context, index) {
                final category = ProductCategory.values[index];
                final formattedCategory = AppExtensions.capitalize(
                  category.toString().split('.').last,
                );
                return ProductTypeCard(
                  type: formattedCategory,
                  isSelected: _selectedType == index,
                  onTap: () {
                    setState(() {
                      _selectedType = index;
                      _productCategory = ProductCategory.values[index];
                    });
                  },
                );
              },
            ),
          ),
          SizedBox(height: AppSpacing.twentyVertical),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.0..w),
            child: Text(
              'Latest Product',
              style: AppTypography.kSemiBold16,
            ),
          ),
          SizedBox(height: AppSpacing.twentyVertical),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: AnimationLimiter(
              child: GridView.count(
                shrinkWrap: true,
                childAspectRatio: 153.w / 221.h,
                physics: const NeverScrollableScrollPhysics(),
                padding: EdgeInsets.all(8.h),
                crossAxisCount: 2,
                crossAxisSpacing: AppSpacing.tenHorizontal,
                mainAxisSpacing: AppSpacing.twentyVertical,
                children: List.generate(
                  filteredProducts.length,
                  (index) {
                    return AnimationConfiguration.staggeredGrid(
                      columnCount: 2,
                      position: index,
                      duration: const Duration(milliseconds: 375),
                      child: FadeInAnimation(
                        duration: const Duration(seconds: 1),
                        child: FadeInAnimation(
                          child: ProductCard(
                            product: filteredProducts[index],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
