// Category repository
// Author: openflutterproject@gmail.com
// Date: 2020-02-06

import 'model/category.dart';

abstract class CategoryRepository {
  Future<List<Category>> getCategories({int parentCategoryId = 0});

  Future<Category> getCategoryDetails(int categoryId);
}
