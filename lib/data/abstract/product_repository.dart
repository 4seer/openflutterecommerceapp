// Product Repositry
// Author: openflutterproject@gmail.com
// Date: 2020-02-06

import 'package:openflutterecommerce/config/theme.dart';

import 'model/product.dart';

abstract class ProductRepository {
  ///returns product info for the selected [id]
  Future<Product> getProduct(int id);

  ///returns list of similar products for the product with [productId].
  ///The algorithm of selecting similarity is up to repository concrete
  ///realization. Output is limited to [pageSize] and at [pageIndex] page
  Future<List<Product>> getSimilarProducts(int productId,
      {int pageIndex = 0, int pageSize = AppConsts.PAGE_SIZE});

  ///returns products which belongs to category with [categoryId] limited to
  ///[pageSize] and at [pageIndex] page
  Future<List<Product>> getProductsInCategory(int categoryId,
      {int pageIndex = 0, int pageSize = AppConsts.PAGE_SIZE});

  ///returns list of products, marked as favorites
  Future<List<Product>> getFavorites();

  ///adds product with [productId] to the list of favorites
  Future addToFavorites(int productId);

  ///removes product with [productId] from the list of favorites
  Future removeFromFavorites(int productId);
}
