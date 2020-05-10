// Favourite Screen Bloc Events
// Author: umair_adil@live.com
// Date: 2020-02-11

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:openflutterecommerce/data/abstract/model/favorite_product.dart';
import 'package:openflutterecommerce/data/abstract/model/filter_rules.dart';
import 'package:openflutterecommerce/data/abstract/model/sort_rules.dart';

@immutable
abstract class FavouriteEvent extends Equatable {
  @override
  List<Object> get props => [];
}

@immutable
class ScreenLoadedEvent extends FavouriteEvent {
  ScreenLoadedEvent();

  @override
  List<Object> get props => [];
}

@immutable
class ProductsChangeViewEvent extends FavouriteEvent {}

@immutable
class ProductChangeSortRulesEvent extends FavouriteEvent {
  final SortRules sortBy;

  ProductChangeSortRulesEvent(this.sortBy);

  @override
  List<Object> get props => [sortBy];
}

@immutable
class ProductChangeFilterRulesEvent extends FavouriteEvent {
  final FilterRules filterRules;

  ProductChangeFilterRulesEvent(this.filterRules);

  @override
  List<Object> get props => [filterRules];
}

class SearchEvent extends FavouriteEvent {
  final String search;

  SearchEvent(this.search);

  @override
  List<Object> get props => [search];
}

class RemoveFromFavoriteEvent extends FavouriteEvent {
  final FavoriteProduct product;

  RemoveFromFavoriteEvent(this.product);

  @override
  List<Object> get props => [product];
}

class AddToCartEvent extends FavouriteEvent {
  final int productId;

  AddToCartEvent(this.productId);

  @override
  List<Object> get props => [productId];
}
