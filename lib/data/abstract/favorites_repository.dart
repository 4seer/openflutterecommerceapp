import 'dart:collection';

import 'package:openflutterecommerce/config/theme.dart';
import 'package:openflutterecommerce/data/abstract/model/favorite_product.dart';
import 'package:openflutterecommerce/data/abstract/model/product.dart';

import 'model/filter_rules.dart';
import 'model/product_attribute.dart';
import 'model/sort_rules.dart';

abstract class FavoritesRepository {
  ///returns list of products with selected properties, so the user can
  ///immediately add them to the cart without selecting anything else.
  ///The result is limited to [pageSize] and at [pageIndex] page.
  ///The result can be filtered by [filterRules] which basically consist of
  ///attributes, subcategories and price range, but can be extended to include more.
  ///The result can be sorted by [sortRules] with values coming from lowest to
  ///highest or vice versa with main sort parameter specified.
  Future<List<FavoriteProduct>> getFavoriteProducts({
    int pageIndex = 0,
    int pageSize = AppConsts.page_size,
    SortRules sortRules = const SortRules(),
    FilterRules filterRules,
  });

  ///adds product with [productId] to the list of favorites. It is required
  ///that all selectable properties should be set so it will be easy to order
  ///it then
  Future addToFavorites(
      Product product, HashMap<ProductAttribute, String> selectedAttributes);

  ///removes product with [productId] from the list of favorites
  Future<List<FavoriteProduct>> removeFromFavorites(int productId, HashMap<ProductAttribute, String> selectedAttributes);

  //check if product was added to favorite
  bool checkFavorite(int productId);

  ///returns filter options available for favorite products.
  ///All rules should be set with initial (unselected) values
  Future<FilterRules> getFavoritesFilterOptions();
}
