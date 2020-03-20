// Category list Bloc Events
// Author: openflutterproject@gmail.com
// Date: 2020-02-06
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:openflutterecommerce/data/interfaces/category_repository.dart';

@immutable
abstract class CategoryEvent extends Equatable {
  final CategoryType type;
  CategoryEvent(this.type) : super();

  @override
  List<Object> get props => [type];
}

@immutable
class CategoryShowListEvent extends CategoryEvent {
  CategoryShowListEvent(CategoryType type) : super(type);

  @override
  String toString() => 'Category show list view';
}

@immutable
class CategoryShowTilesEvent extends CategoryEvent {
  CategoryShowTilesEvent(CategoryType type) : super(type);

  @override
  String toString() => 'Category show tiles view';
}
