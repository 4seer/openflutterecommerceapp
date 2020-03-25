import 'package:openflutterecommerce/config/theme.dart';
import 'package:openflutterecommerce/data/abstract/model/filter_rules.dart';
import 'package:openflutterecommerce/data/abstract/model/product.dart';
import 'package:openflutterecommerce/data/abstract/model/sort_rules.dart';
import 'package:openflutterecommerce/data/abstract/product_repository.dart';

class ProductLocalRepository implements ProductRepository {
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
  Future<List<Product>> getSimilarProducts(int categoryI,
      {int pageIndex = 0, int pageSize = AppConsts.PAGE_SIZE}) {
    // TODO: implement getSimilarProducts
    throw UnimplementedError();
  }

  @override
  Future<List<Product>> getProducts(
      {int pageIndex = 0,
      int pageSize = AppConsts.PAGE_SIZE,
      int categoryId = 0,
      bool isFavorite = false,
      SortRules sortRules = const SortRules(),
      FilterRules filterRules}) {
    // TODO: implement getProducts
    return null;
  }

  @override
  Future<FilterRules> getPossibleFilterOptions(int categoryId) {
    // TODO: implement getPossibleFilterOptions
    return null;
  }
}
