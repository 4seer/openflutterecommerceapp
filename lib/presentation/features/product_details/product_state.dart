import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:openflutterecommerce/data/abstract/model/product.dart';
import 'package:openflutterecommerce/data/abstract/model/product_attribute.dart';

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
  final Map<ProductAttribute, String> selectedAttributes;

  ProductLoadedState(
      {@required this.product,
      @required this.similarProducts,
      this.selectedAttributes});
}

@immutable
class ProductLoadingState extends ProductState {}

@immutable
class ProductErrorState extends ProductState {}
