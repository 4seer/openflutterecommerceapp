import 'package:equatable/equatable.dart';

import 'commerce_image.dart';
import 'product_attribute.dart';

class Product extends Equatable {
  final int id;
  final String title;
  final String shortDescription;
  final String description;
  final bool isFavorite;
  final double price;
  final int discountPercent;
  final int amountAvailable;
  final DateTime created;
  final double averageRating;
  final int ratingCount;
  final List<CommerceImage> images;
  final List<ProductAttribute> attributes;

  Product(
    this.id, {
    this.title,
    this.shortDescription,
    this.description,
    this.price,
    this.discountPercent,
    this.amountAvailable,
    this.created,
    this.averageRating,
    this.ratingCount,
    this.images,
    this.attributes,
    this.isFavorite = false,
  });

  bool get isNew => created.difference(DateTime.now()).inDays < 3;

  @override
  List<Object> get props => [
        id,
        title,
        shortDescription,
        description,
        isFavorite,
        price,
        discountPercent,
        amountAvailable,
        created,
        averageRating,
        ratingCount,
        isFavorite
      ];

  @override
  bool get stringify => true;

  bool get hasRating => averageRating != null;

  CommerceImage get mainImage => (images != null && images.isNotEmpty)
      ? images.first
      : CommerceImage.placeHolder();
}
