import 'package:helia/core/resources/images.dart';

class Hotel {
  String name;
  String image;
  String country;
  String price;
  String rate;
  String reviews;
  bool icon;

  Hotel(this.name, this.image, this.country, this.price, this.rate,
      this.reviews, this.icon);
}

List<Hotel> hotels = [
  Hotel("Emeralda De Hotel", AppImages.bed1, "Paris, France", "\$ 29", "4.7",
      "8082", true),
  Hotel("Martinez Cannes", AppImages.bed2, "London, United Kingdom", "\$ 32",
      "4.1", "4332", false),
  Hotel("De Paris Monte-Carlo Hotel", AppImages.bed3, "Istanbul, Turkey",
      "\$ 36", "3.9", "2133", false),
  Hotel("Palazzo Versace Pico", AppImages.bed4, "Roma, Italy", "\$ 21", "2.9",
      "6342", false),
  Hotel("President Mila De Hotel", AppImages.bed5, "Paris, France", "\$ 39",
      "4.9", "1212", true),
  Hotel("Faena Hotal Miami Beach", AppImages.bed6, "Manchester, United Kingdom",
      "\$ 19", "3.3", "5322", false),
  Hotel("Palms Casino", AppImages.bed7, "Amsterdam, Netherlands", "\$ 15",
      "3.1", "4221", true),
  Hotel("Grand Resort Hotel", AppImages.bed8, "Torino, Italy", "\$ 80", "3.5",
      "2000", false),
];
