
import 'package:flutter/material.dart';
import 'package:openflutterecommerce/domain/entities/checkout/payment_method_entity.dart';

class PaymentMethodModel extends PaymentMethodEntity {
  PaymentMethodModel(
    {@required int id,
    String nameOnCard, 
    String cardNumber, 
    int expiryDateMonth,
    int expiryDateYear,
    int cvv,
    bool isDefault}
  ) : super(
      id: id,
      nameOnCard: nameOnCard,
      cardNumber: cardNumber,
      expiryDateMonth: expiryDateMonth,
      expiryDateYear: expiryDateYear,
      cvv: cvv,
      isDefault: isDefault);

  PaymentMethodModel copyWith(
    {int id,
    String nameOnCard, 
    String cardNumber, 
    int expiryDateMonth,
    int expiryDateYear,
    int cvv,
    bool isDefault})  
  {
    return PaymentMethodModel(
      id: id ?? id,
      nameOnCard: nameOnCard ?? nameOnCard,
      cardNumber: cardNumber ?? cardNumber,
      expiryDateMonth: expiryDateMonth ?? expiryDateMonth,
      expiryDateYear: expiryDateYear ?? expiryDateYear,
      cvv: cvv ?? cvv,
      isDefault: isDefault ?? isDefault
    );
  }
}
