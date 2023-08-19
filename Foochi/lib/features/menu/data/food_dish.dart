import 'package:foochi/core/utils/utils.dart';

import '../../home/data/categories.dart';
import 'cuisine.dart';
import 'ingredients.dart';

class FoodDish {
  String id;
  String image;
  String name;
  double price;
  DishCategory category;
  double totalRating;
  double averageRating;
  double? discount;
  List<Ingredient> ingredients;
  Cuisine cuisine;
  FoodDish({
    required this.id,
    required this.image,
    required this.name,
    required this.price,
    required this.category,
    required this.averageRating,
    required this.totalRating,
    required this.ingredients,
    required this.cuisine,
    this.discount,
  });
}

List<FoodDish> foodDishes = [
  FoodDish(
    id: '1',
    image: AppAssets.kFoodImage1,
    name: 'Specials Sushi Full set',
    price: 38.99,
    category: dishCategories[0],
    averageRating: 5.0,
    totalRating: 123,
    ingredients: dummyIngredients,
    cuisine: cuisines[0],
  ),
  FoodDish(
    id: '2',
    image: AppAssets.kFoodImage2,
    name: 'Fried Chicken & Vegetables',
    price: 34.00,
    category: dishCategories[1],
    averageRating: 5.0,
    totalRating: 13,
    ingredients: dummyIngredients,
    cuisine: cuisines[1],
  ),
  FoodDish(
    id: '3',
    image: AppAssets.kFoodImage3,
    name: 'Fried Chicken & Garlic',
    price: 28.00,
    category: dishCategories[1],
    averageRating: 4.7,
    totalRating: 3,
    ingredients: dummyIngredients,
    cuisine: cuisines[1],
  ),
  FoodDish(
    id: '4',
    image: AppAssets.kFoodImage4,
    name: 'Fried Egg & Salad',
    price: 28.00,
    category: dishCategories[5],
    averageRating: 4.9,
    totalRating: 83,
    ingredients: dummyIngredients,
    cuisine: cuisines[5],
  ),
  FoodDish(
    id: '5',
    image: AppAssets.kFoodImage5,
    name: 'Small Set Sushi',
    price: 28.00,
    category: dishCategories[0],
    averageRating: 4.5,
    totalRating: 113,
    ingredients: dummyIngredients,
    cuisine: cuisines[4],
  ),
  FoodDish(
    id: '6',
    image: AppAssets.kFoodImage6,
    name: 'Bread & Egg',
    price: 13.00,
    category: dishCategories[3],
    averageRating: 5.0,
    totalRating: 1,
    ingredients: dummyIngredients,
    cuisine: cuisines[6],
  ),
  FoodDish(
    id: '7',
    image: AppAssets.kFoodImage8,
    name: 'Barbecue & Pepper Full Set',
    price: 13.00,
    category: dishCategories[1],
    averageRating: 5.0,
    totalRating: 18,
    ingredients: dummyIngredients,
    cuisine: cuisines[6],
  ),
  FoodDish(
    id: '8',
    image: AppAssets.kFoodImage9,
    name: 'Spaghetti Full Set',
    price: 13.00,
    category: dishCategories[2],
    averageRating: 5.0,
    totalRating: 18,
    ingredients: dummyIngredients,
    cuisine: cuisines[6],
  ),
  FoodDish(
    id: '9',
    image: AppAssets.kFoodImage5,
    name: 'Fried Fish ',
    price: 28.00,
    category: dishCategories[4],
    averageRating: 4.5,
    totalRating: 113,
    ingredients: dummyIngredients,
    cuisine: cuisines[4],
  ),
];

List<FoodDish> discountDishes = [
  FoodDish(
    id: '2',
    image: AppAssets.kDiscountProduct1,
    name: 'Specials Sushi',
    price: 38.99,
    discount: 40,
    category: dishCategories[0],
    averageRating: 5.0,
    totalRating: 123,
    ingredients: dummyIngredients,
    cuisine: cuisines[3],
  ),
  FoodDish(
    id: '',
    image: AppAssets.kDiscountProduct2,
    name: 'All in Spaghetti',
    price: 38.99,
    discount: 35,
    category: dishCategories[0],
    averageRating: 4.8,
    totalRating: 13,
    ingredients: dummyIngredients,
    cuisine: cuisines[4],
  ),
];
