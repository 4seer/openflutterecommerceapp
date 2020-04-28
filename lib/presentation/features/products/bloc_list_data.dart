import 'package:openflutterecommerce/data/abstract/model/category.dart';
import 'package:openflutterecommerce/data/abstract/model/filter_rules.dart';
import 'package:openflutterecommerce/data/abstract/model/product.dart';

class ProductListData {
  final List<Product> products;
  final ProductCategory category;
  final FilterRules filterRules;

  ProductListData(this.products, this.category, this.filterRules);

  ProductListData copyWith(List<Product> updatedProducts) {
    return ProductListData(updatedProducts, category, filterRules);
  }
}
