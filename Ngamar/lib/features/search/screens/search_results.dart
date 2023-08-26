import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:ngamar/core/core.dart';

import '../../explore/screens/widgets/product_type_card.dart';
import '../../home/data/product_model.dart';
import '../../home/screens/widgets/product_card.dart';


class SearchResults extends StatefulWidget {
  final List<ProductModel> searchResults;
  const SearchResults({required this.searchResults, Key? key})
      : super(key: key);

  @override
  State<SearchResults> createState() => _SearchResultsState();
}

class _SearchResultsState extends State<SearchResults> {
  int _selectedType = 0;
  ProductFilter _productFilter = ProductFilter.all;

  List<ProductModel> getFilteredProducts() {
    if (_productFilter == ProductFilter.all) {
      return widget.searchResults;
    } else {
      return widget.searchResults
          .where((product) => product.filter == _productFilter)
          .toList();
    }
  }

  @override
  Widget build(BuildContext context) {
    final filteredProducts = getFilteredProducts();
    return ListView(
      physics: const BouncingScrollPhysics(),
      children: [
        SizedBox(height: 20.h),
        SizedBox(
          height: 36.h,
          child: ListView.separated(
            itemCount: ProductFilter.values.length,
            scrollDirection: Axis.horizontal,
            padding: EdgeInsets.only(left: 24.0.w),
            physics: const BouncingScrollPhysics(),
            separatorBuilder: (context, index) => SizedBox(
              width: 8.w,
            ),
            itemBuilder: (context, index) {
              final category = ProductFilter.values[index];
              final formattedCategory = AppExtensions.capitalize(
                category.toString().split('.').last,
              );
              return ProductTypeCard(
                type: formattedCategory,
                isSelected: _selectedType == index,
                onTap: () {
                  setState(() {
                    _selectedType = index;
                    _productFilter = ProductFilter.values[index];
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
    );
  }
}
