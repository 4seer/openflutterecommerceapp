// Home Screen Bloc States
// Author: openflutterproject@gmail.com
// Date: 2020-02-06

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:openflutterecommerce/repos/models/product.dart';

@immutable
abstract class CartState extends Equatable {
  @override
  List<Object> get props => [];
}

@immutable
class CartInitialState extends CartState {
  String toString() => 'HomeInitialState';
}

@immutable
class CartLoadedState extends CartState {
  final List<Product> cartProducts;

  CartLoadedState({this.cartProducts});

  String toString() => 'HomeLoadedState';

  @override
  List<Object> get props => [cartProducts];
}
