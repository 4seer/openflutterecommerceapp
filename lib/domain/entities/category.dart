import 'package:openflutterecommerce/data/abstract/model/category.dart';
import 'package:openflutterecommerce/data/abstract/model/commerce_image.dart';

class LocalCategory extends Category {
  static const create_sql = 'CREATE TABLE category ('
      'id INTEGER PRIMARY KEY, '
      'name TEXT, '
      'description TEXT, '
      'parentId INTEGER, '
      'isCategoryContainer INTEGER)';

  LocalCategory.fromMap(Map<String, dynamic> map, CommerceImage commerceImage)
      : super(map['id'],
            name: map['name'],
            parentId: map['parentId'],
            description: map['description'],
            isCategoryContainer: map['isCategoryContainer'] > 0,
            image: commerceImage);

  Map<String, dynamic> toMap() => {
        'id': id,
        'parentId': parentId,
        'name': name,
        'description': description,
        'isCategoryContainer': isCategoryContainer ? 1 : 0,
      };
}
