import 'package:openflutterecommerce/data/abstract/model/commerce_image.dart';

class LocalCommerceImage extends CommerceImage {
  static const create_sql = 'CREATE TABLE commerceImage ('
      'id INTEGER PRIMARY KEY, '
      'productId INTEGER, '
      'address TEXT, '
      'altText TEXT,'
      'isLocal INTEGER)';

  LocalCommerceImage.fromMap(Map<String, dynamic> map)
      : super(
          map['id'],
          map['address'],
          map['altText'],
          isLocal: map['isLocal'] > 0,
        );

  Map<String, dynamic> toMap(int productId) => {
        'id': id,
        'productId': productId,
        'address': address,
        'altText': altText,
        'isLocal': isLocal ? 1 : 0,
      };
}
