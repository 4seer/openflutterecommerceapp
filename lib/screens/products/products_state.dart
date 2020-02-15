// Product list Bloc States
// Author: openflutterproject@gmail.com
// Date: 2020-02-06

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:openflutterecommerce/repos/models/category.dart';
import 'package:openflutterecommerce/repos/models/hashtag.dart';
import 'package:openflutterecommerce/repos/models/product.dart';
import 'package:openflutterecommerce/widgets/product_filter.dart';

@immutable
abstract class ProductState extends Equatable {
  @override
  List<Object> get props => [];
}

@immutable
class ProductInitialState extends ProductState {
  String toString() => 'ProductInitialState';
}

@immutable
class ProductsLoadedState extends ProductState {
  final List<Product> products;
  final List<HashTag> hashtags;
  final Category category;
  final bool isLoading;
  final bool showSortBy;
  final SortBy sortBy;

  ProductsLoadedState({this.hashtags, this.category, this.products, 
    this.isLoading, this.showSortBy, this.sortBy});

  ProductsLoadedState copyWith(
      {Category category,
      List<HashTag> hashtags,
      List<Product> products,
      bool loading, 
      bool showSortBy,
      SortBy sortBy}) {
    return ProductsLoadedState(
        category: category ?? this.category,
        products: products ?? this.products,
        hashtags: hashtags ?? this.hashtags,
        isLoading: loading ?? this.isLoading,
        showSortBy: showSortBy ?? this.showSortBy,
        sortBy: sortBy ?? this.sortBy);
  }

   @override
  int get hashCode =>
    category.hashCode ^
    products.hashCode ^
    hashtags.hashCode ^
    isLoading.hashCode ^
    showSortBy.hashCode ^
    sortBy.hashCode;
    
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ProductsLoadedState &&
        category == other.category &&
        products == other.products &&
        hashtags == other.hashtags &&
        isLoading == other.isLoading &&
        showSortBy == other.showSortBy &&
        sortBy == other.sortBy;

  String toString() => 'ProductLoadedState:' + toStringWithData();

  String toStringWithData() =>  
    ' showSortBy='+showSortBy.toString() +
    ', isLoading='+isLoading.toString() +
    ', sortBy='+sortBy.toString();
}

@immutable
class ProductsListViewState extends ProductsLoadedState {
  ProductsListViewState(
      {List<HashTag> hashtags,
      Category category,
      List<Product> products,
      bool isLoading,
      bool showSortBy,
      bool showFilterBy,
      SortBy sortBy})
      : super(
            hashtags: hashtags,
            category: category,
            products: products,
            isLoading: isLoading,
            showSortBy: showSortBy,
            sortBy: sortBy
            );

  ProductsListViewState copyWith(
      {Category category,
      List<HashTag> hashtags,
      List<Product> products,
      bool loading,
      bool showSortBy,
      SortBy sortBy}) {
    return ProductsListViewState(
        category: category ?? this.category,
        products: products ?? this.products,
        hashtags: hashtags ?? this.hashtags,
        isLoading: loading ?? this.isLoading,
        showSortBy: showSortBy ?? this.showSortBy,
        sortBy: sortBy ?? this.sortBy);
  }

  String toString() => 'ProductsListViewState:' + toStringWithData();
}

@immutable
class ProductsCardViewState extends ProductsLoadedState {

  ProductsCardViewState(
      {List<HashTag> hashtags,
      Category category,
      List<Product> products,
      bool isLoading,
      bool showSortBy,
      SortBy sortBy,
      })
      : super(
            hashtags: hashtags,
            category: category,
            products: products,
            isLoading: isLoading,
            showSortBy: showSortBy,
            );

  ProductsCardViewState copyWith(
      {Category category,
      List<HashTag> hashtags,
      List<Product> products,
      bool loading,
      bool showSortBy,
      SortBy sortBy}) {
      return ProductsCardViewState(
          category: category ?? this.category,
          products: products ?? this.products,
          hashtags: hashtags ?? this.hashtags,
          isLoading: loading ?? this.isLoading,
          showSortBy: showSortBy ?? this.showSortBy,
          sortBy: sortBy ?? this.sortBy);
  }

  String toString() => 'ProductsCardViewState: '+ toStringWithData();
}

@immutable
class ProductsErrorState extends ProductState {
  String toString() => 'ProductsErrorState';
}
