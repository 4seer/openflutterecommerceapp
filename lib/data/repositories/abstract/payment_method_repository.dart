/*
 * @author Andrew Poteryahin <openflutterproject@gmail.com>
 * @copyright 2020 Open E-commerce App
 * @see payment_method_repository.dart
 */

import 'package:openflutterecommerce/data/model/payment_method.dart';

abstract class PaymentMethodRepository {
  //Get list of user payment method
  Future<List<PaymentMethodModel>> getPaymentMethodList();
  //Add payment method
  Future addPaymentMethod(PaymentMethodModel shippingAddress);
  //Set payment method as default
  Future setDefaultPaymentMethod(int paymentMethodId);
  //Remove payment method
  Future removePaymentMethod(int paymentMethodId);
  //Get default payment method
  Future<PaymentMethodModel> getDefaultPaymentMethod();
}

class PaymentMethodDataStorage {
  List<PaymentMethodModel> paymentMethods;

  PaymentMethodDataStorage(this.paymentMethods);
}