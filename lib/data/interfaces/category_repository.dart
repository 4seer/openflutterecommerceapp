// Category repository
// Author: openflutterproject@gmail.com
// Date: 2020-02-06

import '../fake_repositories/models/category.dart';

abstract class CategoryRepository {
  List<Category> getCategories(CategoryType categoryType);

  Category getCategoryDetails(int categoryId);
}

enum CategoryType { newItems, sale, general }
