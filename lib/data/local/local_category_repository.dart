import 'package:openflutterecommerce/data/abstract/category_repository.dart';
import 'package:openflutterecommerce/data/abstract/model/category.dart';

class LocalCategoryRepository extends CategoryRepository{
  @override
  Future<List<Category>> getCategories({int parentCategoryId = 0}) async {
    // TODO: implement getCategories
    return null;
  }

  @override
  Future<Category> getCategoryDetails(int categoryId) {
    // TODO: implement getCategoryDetails
    return null;
  }

}