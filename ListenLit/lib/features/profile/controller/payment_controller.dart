import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:listenlit/features/profile/data/payment_model.dart';

class PaymentController extends GetxController {
  RxList<PaymentModel> paymentList = <PaymentModel>[].obs;

  final RxInt _selectCard = 0.obs;
  int get selectCard => _selectCard.value;
  setSelectCard(int value) => _selectCard.value = value;

  void addPaymentCard(PaymentModel paymentModel) {
    paymentList.add(paymentModel);
    if (kDebugMode) {
      print(paymentList.length.toString() + " length ");
    }
  }

  void removePaymentCard({required int currentIndex}) {
    paymentList.removeAt(currentIndex);
  }

  @override
  void onClose() {
    super.onClose();
  }
}
