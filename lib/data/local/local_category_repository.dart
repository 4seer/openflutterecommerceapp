import 'package:openflutterecommerce/data/repositories/abstract/category_repository.dart';
import 'package:openflutterecommerce/data/model/category.dart';

class LocalCategoryRepository extends CategoryRepository{
  @override
  Future<List<ProductCategory>> getCategories({int parentCategoryId = 0}) async {
    // TODO: implement getCategories
    return null;
  }

  @override
  Future<ProductCategory> getCategoryDetails(int categoryId) {
    // TODO: implement getCategoryDetails
    return null;
  }

}