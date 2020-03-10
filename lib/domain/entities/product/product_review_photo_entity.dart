import 'package:openflutterecommerce/domain/entities/entity.dart';

class ProductReviewPhotoEntity extends Entity<int> {
  final String image;
  final int reviewId;

  ProductReviewPhotoEntity({
    int id,
    this.image,
    this.reviewId,
  }) : super(id);

  @override
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'image': image,
      'reviewId': reviewId,
    };
  }

  @override
  List<Object> get props => [
    id, 
    image, 
    reviewId
  ];
}
