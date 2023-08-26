import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../home/data/product_model.dart';

class FavoriteController extends GetxController {
  List<ProductModel>? get favorite => _favorite.value;
  Rx<List<ProductModel>?> _favorite = Rx<List<ProductModel>?>([]);

  void addToFavorites(ProductModel product) {
    if (favorite != null) {
      if (!isProductInFavorites(product)) {
        _favorite.value!.add(product);
        _favorite.refresh();
      }
    } else {
      _favorite..value = [product]
      ..refresh();
    }
    debugPrint(favorite!.length.toString());
  }

  void removeFromFavorites(ProductModel product) {
    if (favorite != null) {
      if (isProductInFavorites(product)) {
        _favorite.value!.remove(product);
        _favorite.refresh();
      }
    }
  }

  bool isProductInFavorites(ProductModel product) {
    return favorite!.any((p) => p.id == product.id);
  }
}
