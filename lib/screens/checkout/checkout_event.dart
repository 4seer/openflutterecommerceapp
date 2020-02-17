// Checkout Screen Bloc Events
// Author: openflutterproject@gmail.com
// Date: 2020-02-17

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
abstract class CheckoutEvent extends Equatable {
  @override
  List<Object> get props => [];
}

@immutable
class CheckoutStartEvent extends CheckoutEvent {
  @override
  String toString() => 'CheckoutStartEvent';
}

@immutable
class CheckoutFinishEvent extends CheckoutEvent {
  @override
  String toString() => 'CheckoutFinishEvent';
}

@immutable
class CheckoutShowAddNewCardEvent extends CheckoutEvent {
  @override
  String toString() => 'CheckoutShowAddNewCardEvent';
}

@immutable
class CheckoutSetDefaultCardEvent extends CheckoutEvent {
  final int cardId;

  CheckoutSetDefaultCardEvent(this.cardId);

  @override
  String toString() => 'CheckoutSetDefaultCardEvent';
}


@immutable
class CheckoutAddNewCardEvent extends CheckoutEvent {
  final String nameOnCard;
  final String cardNumber;
  final int expirationMonth;
  final int expirationYear;
  final int cvv;
  final bool setAsDefault;

  CheckoutAddNewCardEvent(this.nameOnCard, this.cardNumber, 
    this.expirationMonth, this.expirationYear, 
    this.cvv, this.setAsDefault);

  @override
  String toString() => 'CheckoutAddNewCardEvent';
}


@immutable
class CheckoutSetDefaultShippingAddressEvent extends CheckoutEvent {
  final int shippingAddressId;

  CheckoutSetDefaultShippingAddressEvent(this.shippingAddressId);

  @override
  String toString() => 'CheckoutSetDefaultShippingAddressEvent';
}


@immutable
class CheckoutAddNewShippingAddressEvent extends CheckoutEvent {
  final String fullName;
  final String address;
  final String city;
  final String state;
  final String postal;
  final String country;

  CheckoutAddNewShippingAddressEvent(this.fullName, this.address, this.city, this.state, this.postal, this.country);


  @override
  String toString() => 'CheckoutAddNewShippingAddressEvent';
}
