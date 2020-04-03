import 'package:openflutterecommerce/data/abstract/model/product_attribute.dart';

class LocalProductAttribute extends ProductAttribute {
  static const create_sql = 'CREATE TABLE productAttribute ('
      'id INTEGER PRIMARY KEY, '
      'name TEXT, '
      'info TEXT)';

  static const create_many_to_many = 'CREATE TABLE productAttributeLink ('
      'id INTEGER PRIMARY KEY, '
      'productId INTEGER, '
      'attributeId INTEGER, '
      'textValue TEXT)';

  LocalProductAttribute.fromMap(List<Map<String, dynamic>> options)
      : super(
          id: options.first['id'],
          name: options.first['name'],
          info: options.first['info'],
          options:
              options.map((map) => map['text_value']).toList(growable: false),
        );
  static const query_for_product_by_id = 'SELECT a.attributeId AS id, '
      'a.textValue AS textValue, b.name AS name, b.info AS info FROM '
      '(SELECT attributeId, textValue FROM productAttributeLink WHERE productId=?) AS a '
      'LEFT JOIN productAttribute AS b ON a.attributeId = b.id ORDER BY a.attributeId';

  Map<String, dynamic> toMap() => {
        'id': id,
        'name': name,
        'info': info,
      };

  List<Map<String, dynamic>> toProductLinkMap(int productId) => options
      .map((value) => {
            'product_id': productId,
            'attributeId': id,
            'textValue': value,
          })
      .toList(growable: false);
}
