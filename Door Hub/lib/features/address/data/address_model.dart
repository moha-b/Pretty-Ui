import 'package:flutter/material.dart';

import '../../../core/utils/app_assets.dart';
import '../../../core/utils/app_colors.dart';

class AddressModel {
  String title;
  Color color;
  String description;
  String image;
  AddressModel({
    required this.title,
    required this.color,
    required this.description,
    required this.image,
  });
}

List<AddressModel> dummyAddresses = [
  AddressModel(
      title: 'Office',
      color: AppColors.kSecondary,
      description: '55 North Frontage Rd, Jackson,\nMS 39211, US',
      image: AppAssets.kOffice),
  AddressModel(
      title: 'Home',
      color: AppColors.kWarning,
      description: '55 North Frontage Rd, Jackson,\nMS 39211, US',
      image: AppAssets.kHome),
];
