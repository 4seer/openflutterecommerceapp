// Checkout Screen Bloc States
// Author: openflutterproject@gmail.com
// Date: 2020-02-17

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:openflutterecommerce/repos/models/product.dart';

@immutable
abstract class CheckoutState extends Equatable {
  @override
  List<Object> get props => [];
}

@immutable
class CheckoutInitialState extends CheckoutState {
  String toString() => 'CheckoutInitialState';
}

@immutable
class CheckoutProceedState extends CheckoutState {
  final List<Product> cartProducts;

  CheckoutProceedState({this.cartProducts});

  String toString() => 'CheckoutProceedState';

  @override
  List<Object> get props => [cartProducts];
}


@immutable
class CheckoutErrorState extends CheckoutState {
  String toString() => 'CheckoutErrorState';
}