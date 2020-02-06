// Product list Bloc States
// Author: openflutterproject@gmail.com
// Date: 2020-02-06

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:openflutterecommerce/repos/models/category.dart';
import 'package:openflutterecommerce/repos/models/hashtag.dart';
import 'package:openflutterecommerce/repos/models/product.dart';

@immutable
abstract class ProductState extends Equatable {
  
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

  ProductsLoadedState({this.hashtags, this.category, this.products, this.isLoading});

  ProductsLoadedState copyWith({
    Category category, List<HashTag> hashtags,
    List<Product> products, bool loading}){
      return ProductsLoadedState(
        category: category?? this.category,
        products: products ?? this.products,
        hashtags: hashtags ?? this.hashtags,
        isLoading : loading?? this.isLoading 
      );
    }
  String toString() => 'ProductLoadedState';
}

@immutable
class ProductsListViewState extends ProductsLoadedState {

  ProductsListViewState({List<HashTag> hashtags, Category category, List<Product> products, bool isLoading}) 
    : super(hashtags: hashtags, category: category, products: products, isLoading: isLoading);

  ProductsListViewState copyWith({
    Category category, List<HashTag> hashtags,
    List<Product> products, bool loading}){
      return ProductsListViewState(
        category: category?? this.category,
        products: products ?? this.products,
        hashtags: hashtags ?? this.hashtags,
        isLoading : loading?? this.isLoading 
      );
    }
  String toString() => 'ProductsListViewState';
}

@immutable
class ProductsCardViewState extends ProductsLoadedState {

  ProductsCardViewState({List<HashTag> hashtags, Category category, List<Product> products, bool isLoading}) 
    : super(hashtags: hashtags, category: category, products: products, isLoading: isLoading);

  ProductsCardViewState copyWith({
    Category category, List<HashTag> hashtags,
    List<Product> products, bool loading}){
      return ProductsCardViewState(
        category: category?? this.category,
        products: products ?? this.products,
        hashtags: hashtags ?? this.hashtags,
        isLoading : loading?? this.isLoading 
      );
    }
  String toString() => 'ProductsCardViewState';
}


@immutable
class ProductsErrorState extends ProductState {
  String toString() => 'ProductsErrorState';
}