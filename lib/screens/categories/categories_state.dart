// Category list Bloc States
// Author: openflutterproject@gmail.com
// Date: 2020-02-06

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:openflutterecommerce/repos/models/category.dart';

@immutable
abstract class CategoryState extends Equatable {
  
}

@immutable
class CategoryInitialState extends CategoryState {
  String toString() => 'CategoryInitialState';
}

@immutable
class CategoryLoadedState extends CategoryState {
  final List<Category> categories;
  final bool isLoading;
  final int typeId;

  CategoryLoadedState({this.typeId, this.categories, this.isLoading});

  CategoryLoadedState copyWith({int typeId, List<Category> categories, bool loading}){
    return CategoryLoadedState(
      typeId: typeId?? this.typeId,
      categories: categories ?? this.categories,
      isLoading : loading?? this.isLoading 
    );
  }
  String toString() => 'CategoryLoadedState';
}

@immutable
class CategoryListViewState extends CategoryLoadedState {

  CategoryListViewState({int typeId, List<Category> categories, bool isLoading}) 
    : super(typeId: typeId, categories: categories, isLoading: isLoading);

  CategoryListViewState copyWith({int typeId, List<Category> categories, bool loading}){
    return CategoryListViewState(
      typeId: typeId?? this.typeId,
      categories: categories ?? this.categories,
      isLoading : loading?? this.isLoading 
    );
  }

  String toString() => 'CategoryListViewState';
}

@immutable
class CategoryTileViewState extends CategoryLoadedState {

  CategoryTileViewState({int typeId, List<Category> categories, bool isLoading}) 
    : super(typeId: typeId, categories: categories, isLoading: isLoading);

  CategoryTileViewState copyWith({int typeId, List<Category> categories, bool loading}){
    return CategoryTileViewState(
      typeId: typeId?? this.typeId,
      categories: categories ?? this.categories,
      isLoading : loading?? this.isLoading 
    );
  }

  String toString() => 'CategoryTileViewState';
}


@immutable
class CategoryErrorState extends CategoryState {
  String toString() => 'CategoryErrorState';
}