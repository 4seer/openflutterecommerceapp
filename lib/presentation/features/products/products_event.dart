// Product List Bloc Events
// Author: openflutterproject@gmail.com
// Date: 2020-02-06

import 'dart:collection';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:openflutterecommerce/data/model/filter_rules.dart';
import 'package:openflutterecommerce/data/model/hashtag.dart';
import 'package:openflutterecommerce/data/model/product.dart';
import 'package:openflutterecommerce/data/model/product_attribute.dart';
import 'package:openflutterecommerce/data/model/sort_rules.dart';

@immutable
abstract class ProductsListEvent extends Equatable {
  @override
  List<Object> get props => [];
}

@immutable
class ScreenLoadedEvent extends ProductsListEvent {
  ScreenLoadedEvent();

  @override
  List<Object> get props => [];
}

@immutable
class ProductsChangeViewEvent extends ProductsListEvent {}

@immutable
class ProductChangeSortRulesEvent extends ProductsListEvent {
  final SortRules sortBy;

  ProductChangeSortRulesEvent(this.sortBy);

  @override
  List<Object> get props => [sortBy];
}

@immutable
class ProductChangeFilterRulesEvent extends ProductsListEvent {
  final FilterRules filterRules;

  ProductChangeFilterRulesEvent(this.filterRules);

  @override
  List<Object> get props => [filterRules];
}

@immutable
class ProductChangeHashTagEvent extends ProductsListEvent {
  final HashTag hashTag;
  final bool isSelected;

  ProductChangeHashTagEvent(this.hashTag, this.isSelected);

  @override
  List<Object> get props => [hashTag];
}

class ProductSearchEvent extends ProductsListEvent {
  final String search;

  ProductSearchEvent(this.search);

  @override
  List<Object> get props => [search];
}

class ProductMakeFavoriteEvent extends ProductsListEvent {
  final bool isFavorite;
  final Product product;
  final HashMap<ProductAttribute, String> favoriteAttributes;

  ProductMakeFavoriteEvent(this.isFavorite, this.product, {this.favoriteAttributes});

  @override
  List<Object> get props => [isFavorite, product, favoriteAttributes];
}
