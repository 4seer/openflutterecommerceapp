// Product List Bloc Events
// Author: openflutterproject@gmail.com
// Date: 2020-02-06

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:openflutterecommerce/widgets/product_filter.dart';

@immutable
abstract class ProductEvent extends Equatable {
  final int categoryId;
  final SortBy sortBy;
  ProductEvent(this.categoryId, this.sortBy) : super();

  @override
  List<Object> get props => [categoryId];
}

@immutable
class ProductShowListEvent extends ProductEvent {
  ProductShowListEvent(int categoryId, SortBy sortBy) : super(categoryId, sortBy);

  @override
  String toString() => 'Product show list view';
}

@immutable
class ProductShowCardEvent extends ProductEvent {
  ProductShowCardEvent(int categoryId, SortBy sortBy) : super(categoryId, sortBy);

  @override
  String toString() => 'Product show card view';
}


@immutable
class ProductChangeSortByEvent extends ProductEvent {
  ProductChangeSortByEvent(int categoryId, SortBy sortBy) : super(categoryId, sortBy);

  @override
  String toString() => 'ProductChangeSortByEvent';
}
