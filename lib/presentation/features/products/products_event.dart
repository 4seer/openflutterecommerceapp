// Product List Bloc Events
// Author: openflutterproject@gmail.com
// Date: 2020-02-06

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:openflutterecommerce/data/abstract/model/filter_rules.dart';
import 'package:openflutterecommerce/data/abstract/model/sort_rules.dart';

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
class ProductShowSortByEvent extends ProductsListEvent {}

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

class SearchEvent extends ProductsListEvent {
  final String search;

  SearchEvent(this.search);

  @override
  List<Object> get props => [search];
}

class MakeFavoriteEvent extends ProductsListEvent {
  final bool isFavorite;
  final int productId;

  MakeFavoriteEvent(this.isFavorite, this.productId);

  @override
  List<Object> get props => [isFavorite, productId];
}
