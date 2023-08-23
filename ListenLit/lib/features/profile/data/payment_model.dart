import 'package:listenlit/core/utils/utils.dart';

class PaymentModel {
  String id;
  String cardNumber;
  String cardHolderName;
  String cardCVVNumber;
  String cardDate;
  String cardImage;
  bool? isSelectCard;
  PaymentModel(
      {required this.id,
      required this.cardNumber,
      required this.cardHolderName,
      required this.cardCVVNumber,
      required this.cardDate,
      required this.cardImage,
      this.isSelectCard = false});
}

List<PaymentModel> paymentList = [
  PaymentModel(
      id: '1',
      cardNumber: '4332 1223 4321 4321',
      cardHolderName: 'Karala Us',
      cardCVVNumber: '0096',
      cardDate: '05/2022',
      cardImage: AppIcons.kVisa,
      isSelectCard: true),
  PaymentModel(
      id: '1',
      cardNumber: '4332 1223 4321 0320',
      cardHolderName: 'Karala Us',
      cardCVVNumber: '0390',
      cardDate: '07/2021',
      cardImage: AppIcons.kMasterCard),
  PaymentModel(
      id: '1',
      cardNumber: '4332 1223 4321 4223',
      cardHolderName: 'Karala Us',
      cardCVVNumber: '1090',
      cardDate: '06/2023',
      cardImage: AppIcons.kMasterCard),
  PaymentModel(
      id: '1',
      cardNumber: '4332 1223 4321 3214',
      cardHolderName: 'Karala Us',
      cardCVVNumber: '0296',
      cardDate: '03/2022',
      cardImage: AppIcons.kMasterCard)
];
