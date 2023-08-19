import 'package:foochi/core/utils/utils.dart';

class Ingredient {
  String name;
  String image;
  double grams;
  double quantity;
  double price;

  Ingredient({
    required this.grams,
    required this.name,
    required this.quantity,
    required this.image,
    required this.price,
  });

  Ingredient copyWith({
    double? grams,
    String? name,
    double? quantity,
    String? image,
    double? price,
  }) {
    return Ingredient(
      grams: grams ?? this.grams,
      name: name ?? this.name,
      quantity: quantity ?? this.quantity,
      image: image ?? this.image,
      price: price ?? this.price,
    );
  }
}

List<Ingredient> dummyIngredients = [
  Ingredient(
    grams: 110,
    name: 'Chicken',
    quantity: 1,
    image: AppAssets.kIngredientChicken,
    price: 2.00,
  ),
  Ingredient(
      grams: 110,
      name: 'Pumpkin',
      quantity: 1,
      price: 0.7,
      image: AppAssets.kIngredientPumpkin),
  Ingredient(
      grams: 110,
      name: 'Lettuce',
      quantity: 1,
      price: 2.00,
      image: AppAssets.kIngredientLettuce),
  Ingredient(
    grams: 10,
    name: 'Turnip',
    quantity: 1,
    image: AppAssets.kIngredientTurnip,
    price: 0.5,
  ),
];
