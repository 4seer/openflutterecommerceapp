// Product List Bloc Events
// Author: openflutterproject@gmail.com
// Date: 2020-02-06

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:openflutterecommerce/widgets/product_filter.dart';

@immutable
abstract class ProductEvent extends Equatable {
  @override
  List<Object> get props => [];
}

@immutable
class ProductStartEvent extends ProductEvent { 
  final int categoryId;

  ProductStartEvent(this.categoryId);
  
  @override
  List<Object> get props => [categoryId];
}

@immutable
class ProductShowSortByEvent extends ProductEvent { }


@immutable
class ProductChangeSortByEvent extends ProductEvent {
  final SortBy sortBy;

  ProductChangeSortByEvent(this.sortBy);
  
  @override
  List<Object> get props => [sortBy];
}
