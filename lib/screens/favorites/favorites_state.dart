// Favourites Screen Bloc States
// Author: umair_adil@live.com
// Date: 2020-02-11

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:openflutterecommerce/repos/models/product.dart';

@immutable
abstract class FavouriteState extends Equatable {

}

@immutable
class FavouriteInitialState extends FavouriteState {
  String toString() => 'FavouriteInitialState';
}

@immutable
class FavouriteLoadedState extends FavouriteState {
  final List<Product> salesProducts;
  final List<Product> newProducts;

  FavouriteLoadedState({this.salesProducts, this.newProducts});

  String toString() => 'FavouriteLoadedState';
}