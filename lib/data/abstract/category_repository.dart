// Category repository
// Author: openflutterproject@gmail.com
// Date: 2020-02-06

import 'model/category.dart';

abstract class CategoryRepository {
  ///returns categories list for the selected parent category. 0 - is top
  ///level category
  Future<List<ProductCategory>> getCategories({int parentCategoryId = 0});

  ///returns category data for the selected [categoryId]
  Future<ProductCategory> getCategoryDetails(int categoryId);
}
