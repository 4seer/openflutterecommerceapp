import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

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
  final Map<String, dynamic> properties;
  final List<ProductAttribute> selectableAttributes;

  Product(
    this.id, {
    @required this.title,
    this.shortDescription,
    this.description,
    @required this.price,
    this.discountPercent,
    this.amountAvailable,
    DateTime created,
    this.averageRating,
    this.ratingCount,
    this.images,
    this.properties,
    this.selectableAttributes,
    this.isFavorite = false,
  }) : created = created ?? DateTime.now();

  Product favorite(bool isFavorite) {
    return Product(id,
        title: title,
        shortDescription: shortDescription,
        description: description,
        price: price,
        discountPercent: discountPercent,
        amountAvailable: amountAvailable,
        created: created,
        averageRating: averageRating,
        ratingCount: ratingCount,
        images: images,
        selectableAttributes: selectableAttributes,
        isFavorite: isFavorite);
  }

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

  double get discountPrice {
    return (price * (100 - discountPercent) / 100).roundToDouble();
  }

  //TODO place it in extension because it is about UI
  String get specialMark {
    if (discountPercent > 0) {
      return '-$discountPercent%';
    } else if (isNew) {
      return 'New';
    } else {
      return null;
    }
  }

  CommerceImage get mainImage => (images != null && images.isNotEmpty)
      ? images.first
      : CommerceImage.placeHolder();
}
