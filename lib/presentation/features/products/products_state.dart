// Product list Bloc States
// Author: openflutterproject@gmail.com
// Date: 2020-02-06

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:openflutterecommerce/data/model/filter_rules.dart';
import 'package:openflutterecommerce/data/model/sort_rules.dart';

import 'bloc_list_data.dart';

abstract class ProductsState extends Equatable {
  final ProductListData data;
  final SortRules sortBy;
  final FilterRules filterRules;
  final String error;

  ProductsState({
    this.data,
    this.filterRules,
    this.sortBy,
    this.error,
  });

  ProductsState copyWith({
    ProductListData data,
    SortRules sortBy,
    FilterRules filterRules,
    String error,
  });

  ProductsState getLoading() {
    return copyWith(data: null);
  }

  bool get isProductsLoading => data == null;
  bool get isFilterRulesVisible => filterRules != null;
  bool get hasError => error != null;

  @override
  List<Object> get props => [data, filterRules, sortBy];

  @override
  bool get stringify => true;
}

@immutable
class ProductsListViewState extends ProductsState {
  ProductsListViewState({
    ProductListData data,
    SortRules sortBy,
    FilterRules filterRules,
    String error,
  }) : super(
    data: data, sortBy: sortBy, filterRules: filterRules, error: error);

  ProductsTileViewState getTiles() {
    return ProductsTileViewState(
        data: data, sortBy: sortBy, filterRules: filterRules);
  }

  @override
  ProductsListViewState copyWith({
    ProductListData data,
    SortRules sortBy,
    FilterRules filterRules,
    String error,
  }) {
    return ProductsListViewState(
      data: data ?? this.data,
      filterRules: filterRules ?? this.filterRules,
      sortBy: sortBy ?? this.sortBy,
      error: error,
    );
  }
}

@immutable
class ProductsTileViewState extends ProductsState {
  ProductsTileViewState(
      {ProductListData data,
      SortRules sortBy,
      FilterRules filterRules,
      String error})
      : super(
            data: data, sortBy: sortBy, filterRules: filterRules, error: error);

  @override
  ProductsTileViewState copyWith({
    ProductListData data,
    SortRules sortBy,
    FilterRules filterRules,
    String error,
  }) {
    return ProductsTileViewState(
      data: data ?? this.data,
      filterRules: filterRules ?? this.filterRules,
      sortBy: sortBy ?? this.sortBy,
      error: error,
    );
  }

  ProductsListViewState getList() {
    return ProductsListViewState(
        data: data, sortBy: sortBy, filterRules: filterRules);
  }
}
