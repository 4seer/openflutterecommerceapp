
import 'package:openflutterecommerce/data/abstract/category_repository.dart';
import 'package:openflutterecommerce/data/abstract/model/category.dart';
import 'package:openflutterecommerce/data/error/exceptions.dart';
import 'package:openflutterecommerce/data/local/local_category_repository.dart';
import 'package:openflutterecommerce/data/network/network_status.dart';
import 'package:openflutterecommerce/data/woocommerce/repositories/category_remote_repository.dart';
import 'package:openflutterecommerce/locator.dart';

//Uses remote or local data depending on NetworkStatus
class CategoryRepositoryImpl extends CategoryRepository {

  @override
  Future<List<ProductCategory>> getCategories({int parentCategoryId = 0}) async {
    try
    {
      NetworkStatus networkStatus = sl();
      CategoryRepository categoryRepository;
      if ( networkStatus.isConnected != null ) {
        categoryRepository = RemoteCategoryRepository(woocommerce: sl());
      } else {
        categoryRepository = LocalCategoryRepository();
      }

      return await categoryRepository.getCategories(parentCategoryId: parentCategoryId);
    } on HttpRequestException {
      throw RemoteServerException();
    }
  }

  @override
  Future<ProductCategory> getCategoryDetails(int categoryId) async {
    // TODO: implement getCategoryDetails
    List<ProductCategory> categories = await getCategories();
    return categories.isNotEmpty ? categories[0] : null;
  }
}
