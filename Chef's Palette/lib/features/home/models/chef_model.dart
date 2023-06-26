import 'package:chef/core/resources/images.dart';

class Chef {
  final String image;
  final String name;

  Chef(this.image, this.name);
}

List<Chef> chefList = [
  Chef(AppImages.chef1, "Ali"),
  Chef(AppImages.chef2, "Roma"),
  Chef(AppImages.chef3, "Anna"),
  Chef(AppImages.chef4, "john"),
];
