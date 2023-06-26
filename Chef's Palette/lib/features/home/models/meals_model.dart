import 'package:chef/core/resources/images.dart';

class Meal {
  final String image;
  final String name;
  final String chef;

  Meal(this.image, this.name, this.chef);
}

List<Meal> mealList = [
  Meal(AppImages.food1, "Pancakes with maple syrup", "Chef John"),
  Meal(AppImages.food2, "Veggie Stir-Fry", "Chef Ali"),
  Meal(AppImages.food3, "Greek Gyro Wrap", "Chef nina"),
  Meal(AppImages.food4, "Shrimp Scampi", "Chef Andria"),
];
