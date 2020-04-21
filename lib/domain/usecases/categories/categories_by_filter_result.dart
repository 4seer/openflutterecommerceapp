

import 'package:openflutterecommerce/data/abstract/model/category.dart';

class CategoriesByFilterResult {
  final List<Category> categories;
  final int quantity;

  CategoriesByFilterResult(
    this.categories,
    this.quantity
  );
}