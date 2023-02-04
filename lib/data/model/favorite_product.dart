import 'dart:collection';

import 'package:openflutterecommerce/data/model/product.dart';
import 'package:openflutterecommerce/data/model/product_attribute.dart';

class FavoriteProduct {
  final Product product;
  final Map<ProductAttribute, String> favoriteForm;

  FavoriteProduct(this.product, this.favoriteForm);
}
