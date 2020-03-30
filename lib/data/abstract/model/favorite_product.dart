import 'dart:collection';

import 'package:openflutterecommerce/data/abstract/model/product.dart';
import 'package:openflutterecommerce/data/abstract/model/product_attribute.dart';

class FavoriteProduct {
  final Product product;
  final HashMap<ProductAttribute, String> favoriteForm;

  FavoriteProduct(this.product, this.favoriteForm);
}
