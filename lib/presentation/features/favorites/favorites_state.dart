// Favourites Screen Bloc States
// Author: umair_adil@live.com
// Date: 2020-02-11

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:openflutterecommerce/data/abstract/model/hashtag.dart';
import 'package:openflutterecommerce/data/abstract/model/product.dart';

@immutable
abstract class FavouriteState extends Equatable {
  final List<Product> favouriteProducts;
  final List<HashTag> hashtags;

  FavouriteState(this.favouriteProducts, this.hashtags);

  @override
  List<Object> get props => [favouriteProducts, hashtags];
}

@immutable
class InitialViewState extends FavouriteState {
  InitialViewState() : super(null, null);
}

@immutable
class FavouriteListViewState extends FavouriteState {
  FavouriteListViewState(
      List<Product> favouriteProducts, List<HashTag> hashtags)
      : super(favouriteProducts, hashtags);

  @override
  String toString() => 'FavouriteListViewState';
}

@immutable
class FavouriteTileViewState extends FavouriteState {
  FavouriteTileViewState(
      List<Product> favouriteProducts, List<HashTag> hashtags)
      : super(favouriteProducts, hashtags);

  @override
  String toString() => 'FavouriteTileViewState';
}
