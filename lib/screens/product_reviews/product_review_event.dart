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

  ProductReviewStartEvent(this.productId);
}

@immutable
class ProductReviewWithPhotosEvent extends ProductReviewEvent {
  final bool withPhotos;

  ProductReviewWithPhotosEvent(this.withPhotos);
}
