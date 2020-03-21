// Product Repositry
// Author: openflutterproject@gmail.com
// Date: 2020-02-06

import 'model/product.dart';

abstract class ProductRepository {
  Future<Product> getProduct(int id);

  Future<List<Product>> getSimilarProducts(int productId);

  Future<List<Product>> getProductsInCategory(int categoryId);

  Future<List<Product>> getFavorites();

  Future addToFavorites(int productId);

  Future removeFromFavorites(int productId);
}
