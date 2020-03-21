import 'package:openflutterecommerce/data/abstract/model/product.dart';
import 'package:openflutterecommerce/data/abstract/product_repository.dart';

class RemoteProductRepository extends ProductRepository {
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
  Future<List<Product>> getProductsInCategory(int id) {
    // TODO: implement getProductsInCategory
    throw UnimplementedError();
  }

  @override
  Future<List<Product>> getSimilarProducts(int id) {
    // TODO: implement getSimilarProducts
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
}
