import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:openflutterecommerce/data/abstract/model/product_attribute.dart';

@immutable
class ProductEvent extends Equatable {
  @override
  List<Object> get props => [];
}

@immutable
class ScreenLoadedEvent extends ProductEvent {}

@immutable
class ProductAddToFavoritesEvent extends ProductEvent {}

@immutable
class ProductRemoveFromFavoritesEvent extends ProductEvent {}

@immutable
class ProductAddToCartEvent extends ProductEvent {}

@immutable
class ProductSetAttributeEvent extends ProductEvent {
  final String selectedValue;
  final ProductAttribute attribute;

  ProductSetAttributeEvent(this.selectedValue, this.attribute);
}
