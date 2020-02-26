import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:openflutterecommerce/repos/models/product_review.dart';

@immutable
class ProductReviewData {
  final List<ProductReview> reviews;
  final int reviewCounter;

  ProductReviewData(this.reviews, this.reviewCounter);
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
