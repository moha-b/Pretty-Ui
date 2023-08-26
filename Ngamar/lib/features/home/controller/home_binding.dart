import 'package:get/get.dart';

import '../../checkout/controller/cart_controller.dart';
import '../../favorite/controller/favorite_controller.dart';


class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get
      ..put<FavoriteController>(FavoriteController())
      ..put<CartController>(CartController());
  }
}
