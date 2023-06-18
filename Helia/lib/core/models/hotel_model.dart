import 'package:helia/core/resources/images.dart';

class Hotel {
  String name;
  List<String> images;
  String country;
  String price;
  String rate;
  String reviews;
  bool icon;

  Hotel(this.name, this.images, this.country, this.price, this.rate,
      this.reviews, this.icon);
}

class Details {
  String icon;
  String text;

  Details(this.icon, this.text);
}

List<Hotel> hotels = [
  Hotel("Emeralda De Hotel", hotelImages, "Paris, France", "\$ 29", "4.7",
      "8082", true),
  Hotel("Martinez Cannes", hotelImages, "London, United Kingdom", "\$ 32",
      "4.1", "4332", false),
  Hotel("De Paris Monte-Carlo Hotel", hotelImages, "Istanbul, Turkey", "\$ 36",
      "3.9", "2133", false),
  Hotel("Palazzo Versace Pico", hotelImages, "Roma, Italy", "\$ 21", "2.9",
      "6342", false),
  Hotel("President Mila De Hotel", hotelImages, "Paris, France", "\$ 39", "4.9",
      "1212", true),
  Hotel("Faena Hotal Miami Beach", hotelImages, "Manchester, United Kingdom",
      "\$ 19", "3.3", "5322", false),
  Hotel("Palms Casino", hotelImages, "Amsterdam, Netherlands", "\$ 15", "3.1",
      "4221", true),
  Hotel("Grand Resort Hotel", hotelImages, "Torino, Italy", "\$ 80", "3.5",
      "2000", false),
];

List<String> hotelImages = [
  AppImages.bed1,
  AppImages.bed2,
  AppImages.bed3,
  AppImages.bed4,
  AppImages.bed5,
  AppImages.bed6,
  AppImages.bed7,
  AppImages.bed8,
];

List<String> hotelGallery = [
  AppImages.hotel1,
  AppImages.hotel2,
  AppImages.hotel3,
  AppImages.hotel4,
  AppImages.hotel5,
];

List<Details> details = [
  Details(AppImages.hotel, "Hotel"),
  Details(AppImages.bed, "4 Bedrooms"),
  Details(AppImages.bathroom, "2 Bathrooms"),
  Details(AppImages.width, "4000sqft"),
];

List<Details> facilities = [
  Details(AppImages.swimmingPool, "Swimming Pool"),
  Details(AppImages.wifi, "Wifi"),
  Details(AppImages.restaurant, "Restaurant"),
  Details(AppImages.parking, "Parking"),
  Details(AppImages.meetingRoom, "Meeting Room"),
  Details(AppImages.elevator, "Elevator"),
  Details(AppImages.fitness, "Fitness"),
  Details(AppImages.open24, "24-hours Open"),
];
