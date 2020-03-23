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
}

@immutable
class CategoryShowTilesEvent extends CategoryEvent {
  CategoryShowTilesEvent(int parentCategoryId) : super(parentCategoryId);
}

class ChangeCategoryParent extends CategoryEvent {
  ChangeCategoryParent(int parentCategoryId) : super(parentCategoryId);
}
