import 'package:equatable/equatable.dart';

class ProductReview extends Equatable {
  final int id;
  final int productId;
  final String authorName;
  final String authorPhotoUrl;
  final int rating;
  final String comment;
  final DateTime reviewDate;
  final bool isHelpful;
  final List<String> photos;

  ProductReview({
    this.id,
    this.productId,
    this.authorName,
    this.authorPhotoUrl,
    this.rating,
    this.comment,
    DateTime reviewDate,
    this.isHelpful,
    this.photos,
  }) : reviewDate = reviewDate ?? DateTime.now();

  @override
  List<Object> get props => [
        id,
        productId,
        authorName,
        authorPhotoUrl,
        rating,
        comment,
        reviewDate,
        isHelpful,
        photos
      ];

  bool hasPhotos() {
    return photos != null && photos.isNotEmpty;
  }
}
