// Category model declaration
// Author: openflutterproject@gmail.com
// Date: 2020-02-06

import 'package:openflutterecommerce/data/abstract/model/category.dart' as data;
import 'package:openflutterecommerce/data/abstract/model/commerce_image.dart';

class FakeCategory extends data.Category {
  FakeCategory(
      {int id,
      int parentId,
      bool isCategoryContainer,
      String name,
      String description,
      String localImage})
      : super(id,
            parentId: parentId,
            name: name,
            isCategoryContainer: isCategoryContainer,
            description: description,
            image:
                CommerceImage(0, localImage, 'image of $name', isLocal: true));
}
