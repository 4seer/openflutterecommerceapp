import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:openflutterecommerce/repos/models/product.dart';


@immutable
class ProductState extends Equatable {
  @override
  List<Object> get props => [];
}

@immutable
class ProductInitialState extends ProductState {}

@immutable
class ProductLoadedState extends ProductState {
  final Product product;
  final List<Product> similarProducts;
  final String color;
  final String size;

  ProductLoadedState({
    @required this.product, 
    @required this.similarProducts,
    this.color,
    this.size
  });
}

@immutable
class ProductLoadingState extends ProductState {}



@immutable
class ProductErrorState extends ProductState { }
