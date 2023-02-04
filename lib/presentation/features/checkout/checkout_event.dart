// Checkout Screen Bloc Events
// Author: openflutterproject@gmail.com
// Date: 2020-02-17

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
abstract class CheckoutEvent extends Equatable {
  @override
  List<Object> get props => [];

  @override
  bool get stringify => true;
}

@immutable
class CheckoutStartEvent extends CheckoutEvent { }

@immutable
class CheckoutFinishEvent extends CheckoutEvent { }

@immutable
class CheckoutShowAddNewCardEvent extends CheckoutEvent { }

@immutable
class CheckoutSetDefaultCardEvent extends CheckoutEvent {
  final int cardId;

  CheckoutSetDefaultCardEvent(this.cardId);

  @override
  List<Object> get props => [cardId];
}


@immutable
class CheckoutAddNewCardEvent extends CheckoutEvent {
  final String nameOnCard;
  final String cardNumber;
  final int expirationMonth;
  final int expirationYear;
  final int cvv;
  final bool? setAsDefault;

  CheckoutAddNewCardEvent({required this.nameOnCard, required this.cardNumber,
    required this.expirationMonth, required this.expirationYear,
    required this.cvv, this.setAsDefault});

  @override
  List<Object> get props => [nameOnCard, cardNumber, expirationMonth, expirationYear, cvv, setAsDefault!];
}

@immutable
class CheckoutSetDefaultShippingAddressEvent extends CheckoutEvent {
  final int shippingAddressId;

  CheckoutSetDefaultShippingAddressEvent(this.shippingAddressId);
}


@immutable
class CheckoutAddNewShippingAddressEvent extends CheckoutEvent {
  final String fullName;
  final String address;
  final String city;
  final String state;
  final String postal;
  final String country;

  CheckoutAddNewShippingAddressEvent({
    required this.fullName, required this.address, required this.city,
    required this.state, required this.postal, required this.country});
}
