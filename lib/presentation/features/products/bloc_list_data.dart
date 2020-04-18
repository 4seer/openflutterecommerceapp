import 'package:openflutterecommerce/data/abstract/model/category.dart';
import 'package:openflutterecommerce/data/abstract/model/filter_rules.dart';
import 'package:openflutterecommerce/data/abstract/model/hashtag.dart';
import 'package:openflutterecommerce/data/abstract/model/product.dart';

class ProductListData {
  final List<Product> products;
  final List<HashTag> hashtags;
  final Category category;
  final FilterRules filterRules;

  ProductListData(this.products, this.hashtags, this.category, this.filterRules);

  ProductListData copyWith(List<Product> updatedProducts) {
    return ProductListData(updatedProducts, hashtags, category, filterRules);
  }
}
