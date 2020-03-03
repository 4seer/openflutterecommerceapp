import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

@immutable
class ProductReviewEvent extends Equatable {
  @override
  List<Object> get props => [];
}

@immutable
class ProductReviewStartEvent extends ProductReviewEvent {
  final int productId;

  final bool withPhotos;

  ProductReviewStartEvent(this.productId, this.withPhotos);
}