import 'package:flutter/material.dart';

import '../../../core/utils/app_assets.dart';

class CategoryModel {
  String id;
  String name;
  String image;
  Color color;
  CategoryModel({
    required this.id,
    required this.name,
    required this.image,
    required this.color,
  });
}

List<CategoryModel> categories = [
  CategoryModel(
      id: '1',
      name: 'AC Repair',
      image: AppAssets.kAcRepair,
      color: const Color(0xFFFFBC99)),
  CategoryModel(
      id: '2',
      name: 'Beauty',
      image: AppAssets.kBeauty,
      color: const Color(0xFFCABDFF)),
  CategoryModel(
      id: '3',
      name: 'Appliance',
      image: AppAssets.kAppliance,
      color: const Color(0xFFB1E5FC)),
  CategoryModel(
      id: '4',
      name: 'Painting',
      image: AppAssets.kPaint,
      color: const Color(0xFFB5EBCD)),
  CategoryModel(
      id: '5',
      name: 'Cleaning',
      image: AppAssets.kCleaning,
      color: const Color(0xFFFFD88D)),
  CategoryModel(
      id: '6',
      name: 'Plumbing',
      image: AppAssets.kPlumbing,
      color: const Color(0xFFCBEBA4)),
  CategoryModel(
      id: '7',
      name: 'Electronics',
      image: AppAssets.kElectronic,
      color: const Color(0xFFFB9B9B)),
  CategoryModel(
      id: '8',
      name: 'Shifting',
      image: AppAssets.kShifting,
      color: const Color(0xFFF8B0ED)),
  CategoryModel(
      id: '9',
      name: "Men's Salon",
      image: AppAssets.kFacial,
      color: const Color(0xFFAFC6FF)),
];
