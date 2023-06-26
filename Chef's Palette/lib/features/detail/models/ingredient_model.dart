import 'dart:ui';

import 'package:chef/core/resources/colors.dart';
import 'package:chef/core/resources/images.dart';
import 'package:flutter/material.dart';

class Ingredient {
  final String name;
  final String quantity;
  final String image;
  final Color color;

  Ingredient(this.name, this.quantity, this.image, this.color);
}

List<Ingredient> ingredientList = [
  Ingredient("Fish", "3 fish", AppImages.fish, AppColors.pink),
  Ingredient("Salad", "tomato, carrots", AppImages.salad, AppColors.green),
  Ingredient("Eggs", "2 eggs", AppImages.notification, AppColors.cyan),
  Ingredient("Milk", "200 ml", AppImages.soap, AppColors.orange),
  Ingredient("Butter", "50 g", AppImages.flame, AppColors.blue),
];
