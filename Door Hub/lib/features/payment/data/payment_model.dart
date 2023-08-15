import '../../../core/utils/app_assets.dart';

class PaymentModel {
  String id;
  String image;
  String cardNumber;
  String expireDate;

  PaymentModel({
    required this.id,
    required this.image,
    required this.cardNumber,
    required this.expireDate,
  });
}

List<PaymentModel> paymentMethods = [
  PaymentModel(
    id: '1',
    image: AppAssets.kMasterCard,
    cardNumber: '*********5321',
    expireDate: 'Exp 04/2023',
  ),
  PaymentModel(
    id: '2',
    image: AppAssets.kVisa,
    cardNumber: '*********3426',
    expireDate: 'Exp 04/2023',
  ),
];
