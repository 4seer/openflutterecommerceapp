import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:openflutterecommerce/data/abstract/model/hashtag.dart';
import 'package:openflutterecommerce/data/error/exceptions.dart';
import 'package:openflutterecommerce/domain/entities/entity.dart';
import 'package:openflutterecommerce/data/abstract/model/category.dart';
import 'package:openflutterecommerce/domain/entities/product/product_entity.dart';

import 'commerce_image.dart';
import 'product_attribute.dart';

class Product extends Equatable {
  final int id;
  final String title;
  //cateogry or hashtag to display next to title
  final String subTitle;
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
  final List<ProductCategory> categories;
  final List<HashTag> hashTags;
  final Map<String, dynamic> properties;
  final List<ProductAttribute> selectableAttributes;

  Product(
    this.id, {
    @required this.title,
    @required this.subTitle,
    this.shortDescription,
    this.description,
    @required this.price,
    this.discountPercent = 0,
    this.amountAvailable = 0,
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
    @required this.categories,
    @required this.hashTags,
    this.isFavorite = false,
  }) : created = created ?? DateTime.now();

  Product favorite(bool isFavorite) {
    return Product(id,
        title: title,
        subTitle: subTitle,
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
        categories: categories,
        hashTags: hashTags,
        selectableAttributes: selectableAttributes,
        isFavorite: isFavorite??false);
  }

  //Method mapping domain entity with presentation level model
  @override
  factory Product.fromEntity(Entity entity) {
    if ( entity is ProductEntity ) {
      List<CommerceImage> images = [];
      if ( entity.images.isNotEmpty ) {
        entity.images.forEach((f) => images.add(CommerceImage(0, f, '')));
      }
      List<ProductCategory> categories = [];
      if ( entity.categories.isNotEmpty ){
        entity.categories.forEach((category) => categories.add(ProductCategory(category.id, name: category.title)));
      }
      List<HashTag> hashTags = [];
      if ( entity.hashTags.isNotEmpty ){
        entity.hashTags.forEach((hashTag) => hashTags.add(HashTag(id: hashTag.id, title: hashTag.title)));
      }
      return Product(
        entity.id, 
        title: entity.title,
        subTitle: entity.subTitle,
        shortDescription: entity.description,
        description: entity.description,
        price: entity.price ?? 0,
        discountPercent: entity.discountPercent,
        amountAvailable: entity.amount,
        //TODO: created - do we need this attribute in the model?
        averageRating: entity.rating,
        categories: categories,
        hashTags:  hashTags,
        ratingCount: entity.rating1Count + entity.rating2Count + entity.rating3Count + entity.rating4Count + entity.rating5Count,
        //TODO: add images images: [],
        images: images,
        //TODO: add selectable attributes selectableAttributes: [],
        isFavorite: entity.isFavourite,
        selectableAttributes: entity.selectableAttributes
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

  bool get hasDiscountPrice => discountPercent > 0;

  double get discountPrice {
    return ((price ?? 0) * (100 - discountPercent) / 100).roundToDouble();
  }

  //TODO place it in extension because it is about UI
  String get specialMark {
    if (discountPercent > 0) {
      return '-' + discountPercent.round().toString() + '%';
    } else if (isNew) {
      return 'New';
    } else {
      return null;
    }
  }

  CommerceImage get mainImage => (images != null && images.isNotEmpty)
      ? images.first
      : CommerceImage.placeHolder();

  Product copyWith({bool isFavorite}) {
    return Product(
      id, 
      title: title,
      subTitle: subTitle,
      shortDescription: description,
      description: description,
      price: price ?? 0,
      discountPercent: discountPercent,
      amountAvailable: amountAvailable,
      averageRating: averageRating,
      categories: categories,
      hashTags:  hashTags,
      ratingCount: ratingCount,
      images: images,
      isFavorite: isFavorite ?? isFavorite,
      selectableAttributes: selectableAttributes
    );
  }
}
