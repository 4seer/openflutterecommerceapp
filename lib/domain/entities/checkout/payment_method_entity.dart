import 'package:openflutterecommerce/domain/entities/entity.dart';

class PaymentMethodEntity extends Entity<int> {
  final String nameOnCard;
  final String cardNumber;
  final int expiryDateMonth;
  final int expiryDateYear;
  final int cvv;

  PaymentMethodEntity(
    {int id, 
    this.nameOnCard, 
    this.cardNumber, 
    this.expiryDateMonth,
    this.expiryDateYear,
    this.cvv}) : super(id);

  @override
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'nameOnCard': nameOnCard,
      'cardNumber': cardNumber,
      'expiryDateMonth': expiryDateMonth,
      'expiryDateYear': expiryDateYear,
      'cvv': cvv,
    };
  }

  @override
  List<Object> get props => [
    id, 
    nameOnCard, 
    cardNumber, 
    expiryDateMonth,
    expiryDateYear,
    cvv
  ];
}
