import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:openflutterecommerce/data/error/exceptions.dart';
import 'package:openflutterecommerce/domain/entities/entity.dart';
import 'package:openflutterecommerce/domain/entities/product/product_entity.dart';

import 'commerce_image.dart';
import 'product_attribute.dart';

class Product extends Equatable {
  final int id;
  final String title;
  final String shortDescription;
  final String description;
  final bool isFavorite;
  final double price;
  final double discountPercent;
  final int amountAvailable;
  final DateTime created;
  final double averageRating;
  final double rating1Count;
  final double rating2Count;
  final double rating3Count;
  final double rating4Count;
  final double rating5Count;
  final int ratingCount;
  final List<CommerceImage> images;
  final Map<String, dynamic> properties;
  final List<ProductAttribute> selectableAttributes;

  Product(
    this.id,{
    @required this.title,
    this.shortDescription,
    this.description,
    @required this.price,
    this.discountPercent = 0,
    this.amountAvailable = 10,
    DateTime created,
    this.averageRating,
    this.ratingCount = 0,
    this.rating1Count = 0,
    this.rating2Count = 0,
    this.rating3Count = 0,
    this.rating4Count = 0,
    this.rating5Count = 0,
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
        rating1Count: rating1Count,
        rating2Count: rating2Count,
        rating3Count: rating3Count,
        rating4Count: rating4Count,
        rating5Count: rating5Count,
        images: images,
        selectableAttributes: selectableAttributes,
        isFavorite: isFavorite);
  }

  //Method mapping domain entity with presentation level model
  @override
  factory Product.fromEntity(Entity entity) {
    if ( entity is ProductEntity ) {
      return Product(
        entity.id, 
        title: entity.title,
        shortDescription: entity.description,
        description: entity.description,
        price: entity.price,
        discountPercent: entity.discountPercent,
        amountAvailable: entity.amount,
        //TODO: created - do we need this attribute in the model?
        averageRating: entity.rating,
        ratingCount: entity.rating1Count + entity.rating2Count + entity.rating3Count + entity.rating4Count + entity.rating5Count,
        //TODO: add images images: [],
        //TODO: add selectable attributes selectableAttributes: [],
        isFavorite: entity.isFavourite,
      );
    } else {
      throw EntityModelMapperException(message: 'Entity should be of type ProductEntity');
    }
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
