import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ngamar/core/core.dart';
import 'package:ngamar/features/search/screens/popular_search.dart';
import 'package:ngamar/features/search/screens/search_results.dart';
import 'package:ngamar/features/search/screens/widgets/filter_sheet.dart';

import '../../home/data/product_model.dart';


class SearchView extends StatefulWidget {
  const SearchView({super.key});

  @override
  State<SearchView> createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  final TextEditingController _searchController = TextEditingController();
  ProductCategory filterCategory = ProductCategory.all;
  double filterPrice = 0.0;
  int filterRating = 1;
  List<ProductModel> searchResults = [];

  void _performSearch(
    String keyword,
    ProductCategory selectedCategory,
    double maxPrice,
    int selectedStarRating,
  ) {
    if (keyword.isEmpty) {
      setState(() {
        searchResults.clear();
      });
      return;
    }
    setState(() {
      searchResults = dummyProductList.where((product) {
        final containsKeyword =
            product.name.toLowerCase().contains(keyword.toLowerCase());
        final matchesCategory = selectedCategory == ProductCategory.all ||
            product.category == selectedCategory;
        final matchesPrice = product.currentPrice <= maxPrice;
        final matchesStarRating = selectedStarRating == 0 ||
            product.averageRatings >= selectedStarRating;
        return containsKeyword &&
            matchesCategory &&
            matchesPrice &&
            matchesStarRating;
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(),
        leadingWidth: 30,
        title: SearchField(
          controller: _searchController,
          onChanged: (value) {
            _performSearch(value, filterCategory, filterPrice, filterRating);
          },
          filterCallback: () {
            showModalBottomSheet<void>(
              context: context,
              isScrollControlled: true,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(30.r),
                ),
              ),
              builder: (context) {
                return FilterSheet(
                  onApplyFilters: (category, price, rating) {
                    setState(() {
                      filterCategory = category;
                      filterPrice = price;
                      filterRating = rating;
                      debugPrint(filterCategory.toString());
                      debugPrint(filterPrice.toString());
                      debugPrint(filterRating.toString());
                    });
                  },
                );
              },
            );
          },
        ),
      ),
      body: searchResults.isNotEmpty
          ? SearchResults(
              searchResults: searchResults,
            )
          : const PopularSearch(),
    );
  }
}
