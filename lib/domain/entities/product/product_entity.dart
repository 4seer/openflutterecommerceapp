import 'package:openflutterecommerce/data/abstract/model/product_attribute.dart';
import 'package:openflutterecommerce/domain/entities/entity.dart';

class ProductEntity extends Entity<int> {
  final String title;
  final List<String> images;
  final String thumb;
  final double price;
  final double discountPercent;
  final List<int> categoryIds;
  final int amount;
  final String description;
  final bool isFavourite;
  final double rating;
  final int rating1Count;
  final int rating2Count;
  final int rating3Count;
  final int rating4Count;
  final int rating5Count;
  final List<ProductAttribute> selectableAttributes;

  ProductEntity(
    {int id,
    this.title,
    this.images,
    this.thumb,
    price,
    discountPercent,
    categoryIds,
    this.amount,
    this.description,
    this.selectableAttributes,
    bool isFavourite,
    rating,
    rating1Count,
    rating2Count,
    rating3Count,
    rating4Count,
    rating5Count}) :
      rating = rating??0,
      rating1Count = rating1Count??0,
      rating2Count = rating2Count??0,
      rating3Count = rating3Count??0,
      rating4Count = rating4Count??0,
      rating5Count = rating5Count??0,
      isFavourite = isFavourite??false,
      discountPercent = discountPercent??0,
      price = price??0,
      categoryIds = categoryIds??[],
      super(id);

  @override
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'image': images.isNotEmpty?images[0]:'',
      'thumb': thumb,
      'price': price,
      'discountPercent': discountPercent,
      'categoryId': categoryIds.isNotEmpty?categoryIds[0]:0,
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
