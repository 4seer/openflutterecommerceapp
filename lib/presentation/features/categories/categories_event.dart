// Category list Bloc Events
// Author: openflutterproject@gmail.com
// Date: 2020-02-06
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
abstract class CategoryEvent extends Equatable {
  final int parentCategoryId;
  CategoryEvent(this.parentCategoryId) : super();

  @override
  List<Object> get props => [parentCategoryId];
}

@immutable
class CategoryShowListEvent extends CategoryEvent {
  CategoryShowListEvent(int parentCategoryId) : super(parentCategoryId);

  @override
  String toString() => 'Category show list view';
}

@immutable
class CategoryShowTilesEvent extends CategoryEvent {
  CategoryShowTilesEvent(int parentCategoryId) : super(parentCategoryId);

  @override
  String toString() => 'Category show tiles view';
}
