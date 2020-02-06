// Product List Bloc Events
// Author: openflutterproject@gmail.com
// Date: 2020-02-06

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
abstract class ProductEvent extends Equatable {
  final int categoryId;
  ProductEvent(this.categoryId, [List props = const []]) : super(props);
}

@immutable
class ProductShowListEvent extends ProductEvent {

  ProductShowListEvent(int categoryId) : super(categoryId);

  @override
  String toString() =>
      'Product show list view';
}

@immutable
class ProductShowCardEvent extends ProductEvent {

  ProductShowCardEvent(categoryId) : super(categoryId);

  @override
  String toString() =>
      'Product show card view';
}