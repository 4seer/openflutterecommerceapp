// Category repository
// Author: openflutterproject@gmail.com
// Date: 2020-02-06

import 'package:openflutterecommerce/data/abstract/model/cart_item.dart';
import 'package:openflutterecommerce/data/abstract/model/product.dart';

import 'model/product_attribute.dart';

abstract class CartRepository {
  Future<List<CartItem>> getCartContent();

  Future addProductToCart(Product product, int quantity,
      Map<ProductAttribute, String> selectedAttributes);

  Future changeQuantity(Product product, int newQuantity);
}
