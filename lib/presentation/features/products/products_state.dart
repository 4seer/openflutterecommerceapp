// Product list Bloc States
// Author: openflutterproject@gmail.com
// Date: 2020-02-06

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:openflutterecommerce/data/abstract/model/filter_rules.dart';
import 'package:openflutterecommerce/data/abstract/model/sort_rules.dart';

import 'bloc_list_data.dart';

@immutable
abstract class ProductState extends Equatable {
  @override
  bool get stringify => true;

  @override
  List<Object> get props => [];
}

@immutable
class ProductLoadingState extends ProductState {}

@immutable
class ProductsReadyState extends ProductState {
  final ProductListData data;
  final SortRules sortBy;
  final FilterRules filterRules;
  final ScreenType screenType;

  ProductsReadyState({
    this.data,
    this.sortBy,
    this.filterRules,
    this.screenType = ScreenType.list,
  });

  ProductsReadyState copyWith({
    ProductListData data,
    bool showSortBy,
    SortRules sortBy,
    FilterRules filterRules,
    ScreenType screenType,
  }) {
    return ProductsReadyState(
        data: data ?? this.data,
        sortBy: sortBy ?? this.sortBy,
        filterRules: filterRules ?? this.filterRules,
        screenType: screenType ?? this.screenType);
  }

  @override
  List<Object> get props => [data, sortBy, filterRules, screenType];
}

enum ScreenType { list, tile, filter, sort }

@immutable
class ProductsErrorState extends ProductState {
  final String error;

  ProductsErrorState(this.error);

  @override
  List<Object> get props => [error];
}
