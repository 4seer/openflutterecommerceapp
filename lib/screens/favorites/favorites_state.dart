// Favourites Screen Bloc States
// Author: umair_adil@live.com
// Date: 2020-02-11

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:openflutterecommerce/repos/models/hashtag.dart';
import 'package:openflutterecommerce/repos/models/product.dart';

@immutable
abstract class FavouriteState extends Equatable {
  @override
  List<Object> get props => [];
}

@immutable
class FavouriteListViewState extends FavouriteState {
  final List<Product> favouriteProducts;
  final List<HashTag> hashtags;

  FavouriteListViewState({this.favouriteProducts,this.hashtags});

  String toString() => 'FavouriteListViewState';

  @override
  List<Object> get props => [favouriteProducts,hashtags];
}

@immutable
class FavouriteTileViewState extends FavouriteState {
  final List<Product> favouriteProducts;
  final List<HashTag> hashtags;

  FavouriteTileViewState({this.favouriteProducts,this.hashtags});

  String toString() => 'FavouriteTileViewState';

  @override
  List<Object> get props => [favouriteProducts,hashtags];
}