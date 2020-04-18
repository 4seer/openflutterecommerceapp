

import 'package:openflutterecommerce/data/abstract/model/filter_rules.dart';
import 'package:openflutterecommerce/data/abstract/model/product.dart';

class ProductsByFilterResult {
  final FilterRules filterRules;
  final List<Product> products;
  final int quantity;

  ProductsByFilterResult(
    this.products,
    this.quantity,
    this.filterRules
  );
}