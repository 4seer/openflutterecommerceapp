// Checkout Screen Bloc States
// Author: openflutterproject@gmail.com
// Date: 2020-02-17

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:openflutterecommerce/data/model/cart_item.dart';
import 'package:openflutterecommerce/data/model/payment_method.dart';
import 'package:openflutterecommerce/data/model/product.dart';
import 'package:openflutterecommerce/data/model/shipping_address.dart';

@immutable
abstract class CheckoutState extends Equatable {
  @override
  List<Object> get props => [];
}

@immutable
class CheckoutInitialState extends CheckoutState {
  @override
  String toString() => 'CheckoutInitialState';
}

@immutable
class CheckoutProceedState extends CheckoutState {
  final List<CartItem> cartProducts;
  final List<ShippingAddressModel> shippingAddresses;
  final List<PaymentMethodModel> paymentMethods;
  final ShippingAddressModel currentShippingAddress;
  final PaymentMethodModel currentPaymentMethod;
  final int cardId;
  final bool showAddNewCardForm;

  CheckoutProceedState(
      {@required this.cardId,
      this.shippingAddresses,
      this.paymentMethods,
      this.cartProducts,
      this.currentShippingAddress,
      this.currentPaymentMethod,
      this.showAddNewCardForm = false});

  CheckoutProceedState copyWith(
      {List<Product> cartProducts, int cardId, bool showAddNewCardForm}) {
    return CheckoutProceedState(
        cartProducts: cartProducts ?? this.cartProducts,
        showAddNewCardForm: showAddNewCardForm ?? this.showAddNewCardForm,
        cardId: cardId ?? this.cardId);
  }

  @override
  List<Object> get props => [cartProducts, cardId, showAddNewCardForm];
}

@immutable
class CheckoutErrorState extends CheckoutState {}
