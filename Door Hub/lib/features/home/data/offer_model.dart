import 'dart:ui';

import 'package:door_hub/core/utils/app_colors.dart';

class Offer {
  final String offerOn;
  final String amount;
  final Color color;

  Offer(this.offerOn, this.amount, this.color);
}

List<Offer> offerList = [
  Offer("Offer AC Service", "Get 40%", AppColors.kAccent1),
  Offer("Offer Beauty Service", "Get 15%", AppColors.kAccent2),
  Offer("Offer Appliance Service", "Get 29%", AppColors.kNeutral),
  Offer("Offer Painting Service", "Get 31%", AppColors.kAccent7),
  Offer("Offer Cleaning Service", "Get 37%", AppColors.kLime),
];
