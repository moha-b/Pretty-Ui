import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../menu/data/food_dish.dart';

class FavoriteController extends GetxController {
  List<FoodDish>? get favorite => _favorite.value;
  Rx<List<FoodDish>?> _favorite = Rx<List<FoodDish>?>([]);

  void addToFavorites(FoodDish product) {
    if (favorite != null) {
      if (!isProductInFavorites(product)) {
        _favorite.value!.add(product);
        _favorite.refresh();
      }
    } else {
      _favorite
        ..value = [product]
        ..refresh();
    }
    debugPrint(favorite!.length.toString());
  }

  void removeFromFavorites(FoodDish product) {
    if (favorite != null) {
      if (isProductInFavorites(product)) {
        _favorite.value!.remove(product);
        _favorite.refresh();
      }
    }
  }

  bool isProductInFavorites(FoodDish product) {
    return favorite!.any((p) => p.id == product.id);
  }
}
