import 'package:openflutterecommerce/local_db/entity.dart';

class ProductReviewPhotoEntity extends Entity {
  final int id;
  final String image;
  final int reviewId;

  ProductReviewPhotoEntity({
    this.id,
    this.image,
    this.reviewId,
  });

  @override
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'image': this.image,
      'reviewId': reviewId,
    };
  }

  @override
  List<Object> get props => [id, image, reviewId];
}
