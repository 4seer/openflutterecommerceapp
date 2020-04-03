import 'package:openflutterecommerce/data/abstract/model/commerce_image.dart';
import 'package:openflutterecommerce/data/abstract/model/product.dart';
import 'package:openflutterecommerce/data/abstract/model/product_attribute.dart';

class LocalProduct extends Product {
  static const create_sql = 'CREATE TABLE product ('
      'id INTEGER PRIMARY KEY, '
      'title TEXT, '
      'shortDescription TEXT, '
      'description TEXT, '
      'isFavorite INTEGER, '
      'price REAL, '
      'discountPercent INTEGER, '
      'amountAvailable INTEGER, '
      'created INTEGER, '
      'averageRating REAL, '
      'ratingCount INTEGER)';
  static const create_properties_sql = 'CREATE TABLE productProperty ('
      'id INTEGER PRIMARY KEY, '
      'productId INTEGER, '
      'propertyName TEXT, '
      'propertyValue TEXT)';

  LocalProduct.fromMap(
      Map<String, dynamic> map,
      List<CommerceImage> images,
      Map<String, dynamic> properties,
      List<ProductAttribute> selectableAttributes)
      : super(map['id'],
            title: map['title'],
            shortDescription: map['shortDescription'],
            description: map['description'],
            isFavorite: map['isFavorite'] > 0,
            price: map['price'],
            discountPercent: map['discountPercent'],
            amountAvailable: map['amountAvailable'],
            created: DateTime.fromMillisecondsSinceEpoch(map['created']),
            averageRating: map['averageRating'],
            ratingCount: map['ratingCount'],
            images: images,
            properties: properties,
            selectableAttributes: selectableAttributes);

  Map<String, dynamic> toMap() => {
        'id': id,
        'title': title,
        'shortDescription': shortDescription,
        'description': description,
        'isFavorite': isFavorite ? 1 : 0,
        'price': price,
        'discountPercent': discountPercent,
        'amountAvailable': amountAvailable,
        'created': created.millisecondsSinceEpoch,
        'averageRating': averageRating,
        'ratingCount': ratingCount,
      };
}
