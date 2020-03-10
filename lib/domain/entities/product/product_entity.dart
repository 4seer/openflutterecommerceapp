import 'package:openflutterecommerce/domain/entities/entity.dart';

class ProductEntity extends Entity<int> {
  final String title;
  final String image;
  final String thumb;
  final double price;
  final double discountPercent;
  final int categoryId;
  final int amount;
  final String description;
  final bool isFavourite;
  final double rating;
  final int rating1Count;
  final int rating2Count;
  final int rating3Count;
  final int rating4Count;
  final int rating5Count;

  ProductEntity(
    {int id,
    this.title,
    this.image,
    this.thumb,
    this.price,
    this.discountPercent,
    this.categoryId,
    this.amount,
    this.description,
    this.isFavourite,
    this.rating,
    this.rating1Count,
    this.rating2Count,
    this.rating3Count,
    this.rating4Count,
    this.rating5Count}) : super(id);

  @override
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'image': image,
      'thumb': thumb,
      'price': price,
      'discountPercent': discountPercent,
      'categoryId': categoryId,
      'amount': amount,
      'description': description,
      'isFavourite': isFavourite,
      'rating': rating,
      'rating1Count': rating1Count,
      'rating2Count': rating2Count,
      'rating3Count': rating3Count,
      'rating4Count': rating4Count,
      'rating5Count': rating5Count,
    };
  }

  @override
  List<Object> get props => [
    id, 
    title,
    isFavourite,
    rating,
  ];
}
