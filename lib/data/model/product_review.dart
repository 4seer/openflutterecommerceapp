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
    required this.id,
    required this.productId,
    required this.authorName,
    required this.authorPhotoUrl,
    required this.rating,
    required this.comment,
    DateTime? reviewDate,
    required this.isHelpful,
    required this.photos,
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
