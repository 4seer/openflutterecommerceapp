// Category list Bloc States
// Author: openflutterproject@gmail.com
// Date: 2020-02-06

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:openflutterecommerce/data/abstract/model/category.dart';

@immutable
abstract class CategoryState extends Equatable {
  final int parentCategoryId;

  CategoryState({this.parentCategoryId = 0});

  @override
  List<Object> get props => [parentCategoryId];
}

@immutable
class CategoryLoadingState extends CategoryState {
  @override
  String toString() => 'CategoryInitialState';
}

@immutable
abstract class CategoryViewState extends CategoryState {
  final List<ProductCategory> categories;

  CategoryViewState({int parentCategoryId, this.categories})
      : super(parentCategoryId: parentCategoryId);

  @override
  List<Object> get props => [categories, parentCategoryId];
}

@immutable
class CategoryListViewState extends CategoryViewState {
  CategoryListViewState({int parentCategoryId, List<ProductCategory> categories})
      : super(parentCategoryId: parentCategoryId, categories: categories);

  @override
  String toString() => 'CategoryListViewState';
}

@immutable
class CategoryTileViewState extends CategoryViewState {
  CategoryTileViewState({
    int parentCategoryId,
    List<ProductCategory> categories,
  }) : super(
          parentCategoryId: parentCategoryId,
          categories: categories,
        );

  @override
  String toString() => 'CategoryTileViewState';
}

@immutable
class CategoryErrorState extends CategoryState {
  @override
  String toString() => 'CategoryErrorState';
}
