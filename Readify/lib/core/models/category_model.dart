import 'package:flutter/material.dart';
import 'package:readify/core/resources/images.dart';

class AppCategory {
  final String name;
  final String image;
  final Color color;

  AppCategory(this.name, this.image, this.color);
}

List<AppCategory> categories = [
  AppCategory("Romance", AppImages.romance, Colors.pink),
  AppCategory("History", AppImages.history, Colors.cyan),
  AppCategory("Crime", AppImages.detective, Colors.yellow),
  AppCategory("Spiritual", AppImages.spiritual, Colors.green),
  AppCategory("Fantasy", AppImages.fantasy, Colors.purple),
  AppCategory("Anime", AppImages.anime, Colors.orange),
];
