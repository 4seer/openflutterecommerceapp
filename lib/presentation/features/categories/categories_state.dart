// Category list Bloc States
// Author: openflutterproject@gmail.com
// Date: 2020-02-06

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:openflutterecommerce/data/model/category.dart';

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

  CategoryViewState({required int parentCategoryId, required this.categories})
      : super(parentCategoryId: parentCategoryId);

  @override
  List<Object> get props => [categories, parentCategoryId];
}

@immutable
class CategoryListViewState extends CategoryViewState {
  CategoryListViewState({required int parentCategoryId, required List<ProductCategory> categories})
      : super(parentCategoryId: parentCategoryId, categories: categories);

  @override
  String toString() => 'CategoryListViewState';
}

@immutable
class CategoryTileViewState extends CategoryViewState {
  CategoryTileViewState({
    required int parentCategoryId,
    required List<ProductCategory> categories,
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
