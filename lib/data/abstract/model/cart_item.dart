import 'dart:collection';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:openflutterecommerce/data/abstract/model/product_attribute.dart';

import 'product.dart';

class CartItem extends Equatable {
  final Product product;
  final HashMap<ProductAttribute, String> selectedAttributes;
  final ProductQuantity productQuantity;

  double get price => productQuantity.quantity * product.price;

  CartItem({
    @required this.product,
    @required this.productQuantity,
    @required this.selectedAttributes,
  });

  void changeQuantity(int quantity){
    productQuantity.changeQuantity(quantity);
  }

  @override
  List<Object> get props => [product, selectedAttributes, productQuantity.quantity];
}

class ProductQuantity {
  int quantity;

  ProductQuantity(this.quantity);

  void changeQuantity(int newQuantity){
    quantity = newQuantity;
  }
}
