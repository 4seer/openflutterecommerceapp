import 'dart:collection';

import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:openflutterecommerce/data/model/product.dart';
import 'package:openflutterecommerce/data/model/product_attribute.dart';

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
  final SelectedProductAttributes productAttributes;

  ProductLoadedState(
    {@required this.product,
    @required this.similarProducts,
    @required this.productAttributes});

  ProductLoadedState copyWith(
    Product product,
    List<Product> similarProducts,
    Map<ProductAttribute, String> productAttributes
  ) {
    return ProductLoadedState(
      product: product ?? this.product,
      similarProducts: similarProducts ?? this.similarProducts,
      productAttributes: productAttributes ?? this.productAttributes,
    );
  }

  @override
  List<Object> get props => [product, similarProducts, productAttributes];
}

@immutable
class SelectedProductAttributes extends Equatable{
  final HashMap<ProductAttribute, String> selectedAttributes;

  SelectedProductAttributes({
    @required this.selectedAttributes
  });
  @override
  List<Object> get props => [selectedAttributes, selectedAttributes.values];
}

@immutable
class ProductLoadingState extends ProductState {}

@immutable
class ProductErrorState extends ProductState {}
