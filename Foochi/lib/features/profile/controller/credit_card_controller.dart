import 'package:get/get.dart';

import '../data/credit_card.dart';

class CreditCardController extends GetxController {
  List<CreditCardModel>? get creditCards => _creditCards.value;
  Rx<List<CreditCardModel>?> _creditCards = Rx<List<CreditCardModel>?>([]);

  void addCreditCard({
    required String accountNumber,
    required String ownerName,
    required String expireDate,
    required String cvcNumber,
  }) {
    final creditCard = CreditCardModel(
      accountNumber: accountNumber,
      ownerName: ownerName,
      expireDate: expireDate,
      cvcNumber: cvcNumber,
    );
    _creditCards.value!.add(creditCard);
  }

  @override
  void onInit() {
    _creditCards.value!.add(masterCard);
    super.onInit();
  }
}
