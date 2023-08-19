class CreditCardModel {
  String accountNumber;
  String ownerName;
  String expireDate;
  String cvcNumber;
  CreditCardModel({
    required this.accountNumber,
    required this.ownerName,
    required this.expireDate,
    required this.cvcNumber,
  });
}

CreditCardModel masterCard = CreditCardModel(
    accountNumber: '1322  3344  3443  2678',
    ownerName: 'Tony Nguyen',
    expireDate: '04/05',
    cvcNumber: '5454');
