import 'package:flutter/material.dart';
import 'package:foochi/features/profile/screens/widgets/add_payment_details.dart';
import 'package:foochi/features/profile/screens/widgets/payment_details.dart';
import 'package:get/get.dart';

import '../../../core/helper/enum/payment_view.dart';
import '../controller/credit_card_controller.dart';

class ProfilePaymentView extends StatefulWidget {
  const ProfilePaymentView({super.key});

  @override
  State<ProfilePaymentView> createState() => _ProfilePaymentViewState();
}

class _ProfilePaymentViewState extends State<ProfilePaymentView> {
  CreditCardController cc = Get.put(CreditCardController());
  PaymentViewEnum paymentView = PaymentViewEnum.paymentDetails;
  @override
  Widget build(BuildContext context) {
    return paymentView == PaymentViewEnum.paymentDetails
        ? PaymentView(
            addPaymentCard: () {
              setState(() {
                paymentView = PaymentViewEnum.addPaymentCard;
              });
            },
            creditCard: cc.creditCards ?? [],
          )
        : AddPaymentDetails(
            addCardCallback: (
                {required String cardHolderName,
                required String cardNumber,
                required String cvc,
                required String expireDate}) {
              setState(() {
                paymentView = PaymentViewEnum.paymentDetails;
              });
              cc.addCreditCard(
                  accountNumber: cardNumber,
                  ownerName: cardHolderName,
                  expireDate: expireDate,
                  cvcNumber: cvc);
            },
          );
  }
}
