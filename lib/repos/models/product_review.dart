import 'package:equatable/equatable.dart';

class ProductReview extends Equatable {
  final int id;
  final String authorName;
  final String authorPhotoUrl;
  final String comment;
  final DateTime reviewDate;
  final bool isHelpful;
  final List<String> photos;

  ProductReview(
    this.id,
    this.authorName,
    this.authorPhotoUrl,
    this.comment,
    this.reviewDate,
    this.isHelpful,
    this.photos,
  );

  @override
  List<Object> get props => [id];
}
