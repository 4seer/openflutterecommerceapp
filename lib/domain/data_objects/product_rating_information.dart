import 'product_rating.dart';

class ProductRatingInformation {
  final double rating;
  final int ratingCount;
  final List<ProductRating> ratings;

  ProductRatingInformation(
    this.rating,
    this.ratingCount,
    this.ratings,
  );
}
