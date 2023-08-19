import '../../menu/data/food_dish.dart';

class CartModel {
  FoodDish foodDish;
  int quantity;
  CartModel({
    required this.foodDish,
    required this.quantity,
  });
}
