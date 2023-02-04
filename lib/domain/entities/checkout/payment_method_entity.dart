import 'package:openflutterecommerce/domain/entities/entity.dart';

class PaymentMethodEntity extends Entity<int> {
  final String nameOnCard;
  final String cardNumber;
  final int expiryDateMonth;
  final int expiryDateYear;
  final int cvv;
  final bool isDefault;

  PaymentMethodEntity(
    {required int id,
    required this.nameOnCard,
    required this.cardNumber,
    required this.expiryDateMonth,
    required this.expiryDateYear,
    required this.cvv,
    required this.isDefault}) : super(id);

  @override
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'nameOnCard': nameOnCard,
      'cardNumber': cardNumber,
      'expiryDateMonth': expiryDateMonth,
      'expiryDateYear': expiryDateYear,
      'cvv': cvv,
      'isDefault': isDefault
    };
  }

  @override
  List<Object> get props => [
    id, 
    nameOnCard, 
    cardNumber, 
    expiryDateMonth,
    expiryDateYear,
    cvv,
    isDefault
  ];


  @override
  String toString() =>
    '**** **** **** ' + cardNumber.substring(cardNumber.length - 4);

}
