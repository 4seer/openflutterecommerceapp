import 'package:openflutterecommerce/data/model/filter_rules.dart';
import 'package:openflutterecommerce/data/model/product.dart';

class ProductsByFilterResult {
  final FilterRules filterRules;
  final List<Product> products;
  final int quantity;
  final Exception exception;

  ProductsByFilterResult(this.products, this.quantity, this.filterRules,
      {required this.exception});

  bool get validResults => exception == null;
}
