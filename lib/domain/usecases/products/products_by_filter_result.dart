

import 'package:openflutterecommerce/data/abstract/model/filter_rules.dart';
import 'package:openflutterecommerce/data/abstract/model/product.dart';

class ProductsByFilterResult {
  final FilterRules filterRules;
  final List<Product> products;
  final int quantity;
  final Exception exception;

  ProductsByFilterResult(
    this.products,
    this.quantity,
    this.filterRules,{
      this.exception
    }
  );

  bool get validResults => exception == null;
}