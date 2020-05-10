
import 'package:openflutterecommerce/data/model/product_attribute.dart';
import 'package:openflutterecommerce/domain/entities/entity.dart';
import 'package:openflutterecommerce/domain/entities/hashtag/hashtag_entity.dart';
import 'package:openflutterecommerce/domain/entities/product/product_category_entity.dart';

class ProductEntity extends Entity<int> {
  final String title;
  final String subTitle;
  final List<String> images;
  final String thumb;
  final double price;
  final double discountPercent;
  final List<ProductCategoryEntity> categories;
  final List<HashTagEntity> hashTags;
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
    this.subTitle,
    this.images,
    this.thumb,
    double price,
    double discountPercent,
    List<ProductCategoryEntity> categories,
    List<HashTagEntity> hashTags,
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
      price = (price??0).toDouble(),
      categories = categories??[],
      hashTags = hashTags??[],
      super(id);

  @override
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      //TODO: serialize all images and add tests
      'image': images.isNotEmpty?images[0]:'',
      'thumb': thumb,
      'price': price,
      'discountPercent': discountPercent,
      //TODO: serialize all categoryIds and add tests
      'categoryId': categories.isNotEmpty?categories[0].id:0,
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
