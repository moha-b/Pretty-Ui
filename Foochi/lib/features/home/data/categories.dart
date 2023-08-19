import '../../../core/utils/app_assets.dart';

class DishCategory {
  String name;
  String image;
  DishCategory({
    required this.name,
    required this.image,
  });
}

List<DishCategory> dishCategories = [
  DishCategory(name: 'Sushi', image: AppAssets.kSushi),
  DishCategory(name: 'Chicken', image: AppAssets.kChicken),
  DishCategory(name: 'Spaghetti', image: AppAssets.kSpaGhetti),
  DishCategory(name: 'Sandwich', image: AppAssets.kSandwich),
  DishCategory(name: 'Fish', image: AppAssets.kFish),
  DishCategory(name: 'Salad', image: AppAssets.kSalad),
];
