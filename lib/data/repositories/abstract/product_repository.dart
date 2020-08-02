// Product Repositry
// Author: openflutterproject@gmail.com
// Date: 2020-02-06

import 'package:openflutterecommerce/config/theme.dart';
import 'package:openflutterecommerce/data/model/sort_rules.dart';

import '../../model/filter_rules.dart';
import '../../model/product.dart';

abstract class ProductRepository {
  ///returns product info for the selected [id]
  Future<Product> getProduct(int id);

  ///returns list of similar products for the product with [productId].
  ///The algorithm of selecting similarity is up to repository concrete
  ///realization. Output is limited to [pageSize] and at [pageIndex] page
  Future<List<Product>> getSimilarProducts(int productId,
      {int pageIndex = 0, int pageSize = AppConsts.page_size});

  ///returns products limited to [pageSize] and at [pageIndex] page.
  ///The result can be filtered by
  ///a) which category (with [categoryId] and its subcategories) they belong
  ///b) [filterRules] which basically consist of attributes, subcategories and
  ///price range, but can be extended to include more
  ///The result can be sorted by [sortRules] with values coming from lowest to
  ///highest or vice versa with main sort parameter specified.
  Future<List<Product>> getProducts({
    int pageIndex = 0,
    int pageSize = AppConsts.page_size,
    int categoryId = 0,
    SortRules sortRules = const SortRules(),
    FilterRules filterRules,
  });

  ///returns filter options available for products in category with
  ///id = [categoryId] and its subcategories. All rules should be set with
  ///initial (unselected) values
  Future<FilterRules> getPossibleFilterOptions(int categoryId);
}
