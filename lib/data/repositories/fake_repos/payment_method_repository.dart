/*
 * @author Andrew Poteryahin <openflutterproject@gmail.com>
 * @copyright 2020 Open E-commerce App
 * @see payment_method_repository.dart
 */
import 'package:openflutterecommerce/data/model/payment_method.dart';
import 'package:openflutterecommerce/data/repositories/abstract/payment_method_repository.dart';

class FakePaymentMethodRepository implements PaymentMethodRepository{

  final PaymentMethodDataStorage dataStorage = PaymentMethodDataStorage([
    PaymentMethodModel(
      id: 1,
      nameOnCard: 'Andrew Poteryahin',
      cardNumber: '4000 0000 0000 0001',
      expiryDateMonth: 12,
      expiryDateYear: 2025,
      cvv: 111,
      isDefault: true
    ),
    PaymentMethodModel(
      id: 2,
      nameOnCard: 'Andrew Poteryahin',
      cardNumber: '4000 0000 0000 0002',
      expiryDateMonth: 12,
      expiryDateYear: 2025,
      cvv: 111,
      isDefault: true
    )
  ]);


  @override
  Future addPaymentMethod(PaymentMethodModel shippingAddress) {
    // TODO: implement addPaymentMethod
    throw UnimplementedError();
  }

  @override
  Future<List<PaymentMethodModel>> getPaymentMethodList() async {
    return dataStorage.paymentMethods;
  }

  @override
  Future removePaymentMethod(int paymentMethodId) {
    // TODO: implement removePaymentMethod
    throw UnimplementedError();
  }

  @override
  Future setDefaultPaymentMethod(int paymentMethodId) {
    // TODO: implement setDefaultPaymentMethod
    throw UnimplementedError();
  }

  @override
  Future<PaymentMethodModel> getDefaultPaymentMethod() {
    // TODO: implement getDefaultPaymentMethod
    throw UnimplementedError();
  }
}