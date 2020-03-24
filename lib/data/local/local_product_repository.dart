import 'package:openflutterecommerce/config/theme.dart';
import 'package:openflutterecommerce/data/abstract/model/product.dart';
import 'package:openflutterecommerce/data/abstract/product_repository.dart';

class ProductLocalRepository implements ProductRepository {
  @override
  Future<List<Product>> getFavorites() {
    // TODO: implement getFavorites
    throw UnimplementedError();
  }

  @override
  Future<Product> getProduct(int id) {
    // TODO: implement getProduct
    throw UnimplementedError();
  }

  @override
  Future addToFavorites(int productId) {
    // TODO: implement addToFavorites
    throw UnimplementedError();
  }

  @override
  Future removeFromFavorites(int productId) {
    // TODO: implement removeFromFavorites
    throw UnimplementedError();
  }

  @override
  Future<List<Product>> getProductsInCategory(int categoryId,
      {int pageIndex = 0, int pageSize = AppConsts.PAGE_SIZE}) {
    // TODO: implement getProductsInCategory
    throw UnimplementedError();
  }

  @override
  Future<List<Product>> getSimilarProducts(int categoryI,
      {int pageIndex = 0, int pageSize = AppConsts.PAGE_SIZE}) {
    // TODO: implement getSimilarProducts
    throw UnimplementedError();
  }
}
