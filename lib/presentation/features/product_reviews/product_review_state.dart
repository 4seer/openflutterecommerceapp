import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:openflutterecommerce/data/abstract/model/product_review.dart';

@immutable
class ProductReviewData {
  final List<ProductReview> reviews;
  final int reviewCounter;
  final bool withPhotos;

  ProductReviewData(this.reviews, this.reviewCounter, this.withPhotos);
}

@immutable
class ProductReviewState extends Equatable {
  @override
  List<Object> get props => [];
}

@immutable
class ProductReviewInitialState extends ProductReviewState {}

@immutable
class ProductReviewLoadedState extends ProductReviewState {
  final ProductReviewData data;

  ProductReviewLoadedState(this.data);
}

@immutable
class ProductReviewLoadingState extends ProductReviewState {}

@immutable
class ProductReviewWithPhotosState extends ProductReviewLoadedState {
  final bool withPhotos;

  ProductReviewWithPhotosState(ProductReviewData data, this.withPhotos)
      : super(data);
}
