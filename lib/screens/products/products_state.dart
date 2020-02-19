// Product list Bloc States
// Author: openflutterproject@gmail.com
// Date: 2020-02-06

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:openflutterecommerce/repos/models/category.dart';
import 'package:openflutterecommerce/repos/models/hashtag.dart';
import 'package:openflutterecommerce/repos/models/product.dart';
import 'package:openflutterecommerce/widgets/product_filter.dart';

class ProductStateData {
  List<Product> products;
  List<HashTag> hashtags;
  Category category;
}

@immutable
abstract class ProductState extends Equatable {
  @override
  List<Object> get props => [];
}

@immutable
class ProductInitialState extends ProductState { }

@immutable
class ProductsLoadedState extends ProductState {
  final ProductStateData data;
  final bool isLoading;
  final bool showSortBy;
  final SortBy sortBy;

  ProductsLoadedState({this.data, this.isLoading, 
    this.showSortBy, this.sortBy});

  ProductsLoadedState copyWith(
      {ProductStateData data,
      bool loading, 
      bool showSortBy,
      SortBy sortBy}) {
    return ProductsLoadedState(
      data: data ?? this.data,
      isLoading: loading ?? this.isLoading,
      showSortBy: showSortBy ?? this.showSortBy,
      sortBy: sortBy ?? this.sortBy
    );
  }
  
  @override
  bool get stringify => true;

  @override
  List<Object> get props => [data, isLoading, showSortBy, sortBy];
}

@immutable
class ProductsErrorState extends ProductState { }
