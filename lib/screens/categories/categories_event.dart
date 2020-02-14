// Category list Bloc Events
// Author: openflutterproject@gmail.com
// Date: 2020-02-06
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
abstract class CategoryEvent extends Equatable {
  final int typeId;
  CategoryEvent(this.typeId) : super();

  @override
  List<Object> get props => [typeId];
}

@immutable
class CategoryShowListEvent extends CategoryEvent {
  CategoryShowListEvent(int typeId) : super(typeId);

  @override
  String toString() => 'Category show list view';
}

@immutable
class CategoryShowTilesEvent extends CategoryEvent {
  CategoryShowTilesEvent(typeId) : super(typeId);

  @override
  String toString() => 'Category show tiles view';
}
