import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

@immutable
class ProductEvent extends Equatable {
  @override
  List<Object> get props => [];
}

@immutable 
class ProductActionEvent extends ProductEvent{
  final int productId;

  ProductActionEvent(this.productId);
}

@immutable
class ProductStartEvent extends ProductActionEvent {
  ProductStartEvent(int productId) : super(productId);
}

@immutable 
class ProductAddToFavEvent extends ProductActionEvent {
  ProductAddToFavEvent(int productId) : super(productId);
}

@immutable 
class ProductRemoveFromFavEvent extends ProductActionEvent {
  ProductRemoveFromFavEvent(int productId) : super(productId);
}


@immutable 
class ProductAddToCartEvent extends ProductActionEvent {
  ProductAddToCartEvent(int productId) : super(productId);
}


@immutable 
class ProductSetColorEvent extends ProductActionEvent {
  final String color;

  ProductSetColorEvent({this.color, int productId}) : super(productId);
}

@immutable 
class ProductSetSizeEvent extends ProductActionEvent {
  final String size;

  ProductSetSizeEvent({this.size, int productId}) : super(productId);
}