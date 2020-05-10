// Category repository
// Author: openflutterproject@gmail.com
// Date: 2020-02-06

import 'package:openflutterecommerce/data/model/cart_item.dart';
import 'package:openflutterecommerce/data/model/product.dart';
import 'package:openflutterecommerce/data/model/promo.dart';

import '../../model/product_attribute.dart';

abstract class CartRepository {
  ///returns all cart products with their quantity and attributes
  Future<List<CartItem>> getCartContent();

  ///adds product with selected attributes to cart
  Future addProductToCart(Product product, int quantity,
      Map<ProductAttribute, String> selectedAttributes);

  ///sets new quantity for the product in cart. If there is no such product
  ///in cart, does nothing. It can be used also to remove product from cart
  Future changeQuantity(CartItem item, int newQuantity);

  ///gets discount properties
  Future<Promo> getAppliedPromo();

  ///applies promo to cart
  Future setPromo(Promo promo);
}
