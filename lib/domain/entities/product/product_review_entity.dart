import 'package:openflutterecommerce/domain/entities/entity.dart';

class ProductReviewEntity extends Entity<int> {
  final String description;
  final int productId;
  final double rating;
  final bool hasPhoto;
  final String date;
  final String author;
  final String thumb;

  ProductReviewEntity(
    {int id,
    this.description,
    this.productId,
    this.rating,
    this.hasPhoto,
    this.date,
    this.author,
    this.thumb}) : super(id);

  @override
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'description': description,
      'productId': productId,
      'rating': rating,
      'hasPhoto': hasPhoto,
      'date': date,
      'author': author,
      'thumb': thumb
    };
  }

  @override
  List<Object> get props =>
    [id, 
    description, 
    productId, 
    rating, 
    hasPhoto, 
    date, 
    author, 
    thumb
  ];
}
