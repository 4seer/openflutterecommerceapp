// Category list Bloc States
// Author: openflutterproject@gmail.com
// Date: 2020-02-06

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:openflutterecommerce/data/fake_repositories/models/category.dart';
import 'package:openflutterecommerce/data/interfaces/category_repository.dart';

@immutable
abstract class CategoryState extends Equatable {
  final CategoryType type;

  CategoryState({this.type = CategoryType.general});

  @override
  List<Object> get props => [type];
}

@immutable
class CategoryLoadingState extends CategoryState {
  @override
  String toString() => 'CategoryInitialState';
}

@immutable
abstract class CategoryViewState extends CategoryState {
  final List<Category> categories;

  CategoryViewState({CategoryType categoryType, this.categories})
      : super(type: categoryType);

  CategoryViewState copyWith();

  @override
  String toString() => 'CategoryLoadedState';

  @override
  List<Object> get props => [categories, type];
}

@immutable
class CategoryListViewState extends CategoryViewState {
  CategoryListViewState(
      {CategoryType type, List<Category> categories, bool isLoading})
      : super(categoryType: type, categories: categories);

  @override
  CategoryListViewState copyWith(
      {CategoryType type, List<Category> categories}) {
    return CategoryListViewState(
        type: type ?? this.type, categories: categories ?? this.categories);
  }

  @override
  String toString() => 'CategoryListViewState';
}

@immutable
class CategoryTileViewState extends CategoryViewState {
  CategoryTileViewState({
    CategoryType type,
    List<Category> categories,
    bool isLoading,
  }) : super(
          categoryType: type,
          categories: categories,
        );

  @override
  CategoryTileViewState copyWith(
      {CategoryType type, List<Category> categories, bool loading}) {
    return CategoryTileViewState(
        type: type ?? this.type, categories: categories ?? this.categories);
  }

  @override
  String toString() => 'CategoryTileViewState';
}

@immutable
class CategoryErrorState extends CategoryState {
  @override
  String toString() => 'CategoryErrorState';
}
