import 'package:get/get.dart';

import '../../menu/data/food_dish.dart';
import '../data/cart_model.dart';

class CartController extends GetxController {
  final cartItems = <CartModel>[].obs;

  void addToCart(FoodDish product, int quantity) {
    final existingItem =
        cartItems.firstWhereOrNull((item) => item.foodDish.id == product.id);

    if (existingItem != null) {
      existingItem.quantity += quantity;
    } else {
      cartItems.add(
        CartModel(
          foodDish: product,
          quantity: quantity,
        ),
      );
    }
  }

  void removeFromCart(FoodDish product) {
    cartItems.removeWhere((item) => item.foodDish.id == product.id);
  }

  double getSubtotal() {
    var subtotal = 0.0;
    for (final item in cartItems) {
      subtotal += item.foodDish.price * item.quantity;
    }
    return subtotal;
  }

  void clearCart() {
    cartItems.clear();
  }
}
