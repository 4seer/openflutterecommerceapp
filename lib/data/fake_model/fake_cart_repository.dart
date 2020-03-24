/*
 * @author Martin Appelmann <exlo89@gmail.com>
 * @copyright 2020 Open E-commerce App
 * @see fake_cart_repository.dart
 */

import 'package:openflutterecommerce/data/abstract/cart_repository.dart';
import 'package:openflutterecommerce/data/abstract/model/cart_item.dart';
import 'package:openflutterecommerce/data/abstract/model/product.dart';
import 'package:openflutterecommerce/data/abstract/model/product_attribute.dart';
import 'package:openflutterecommerce/data/abstract/model/promo.dart';

class FakeCartRepository extends CartRepository{
  @override
  Future addProductToCart(Product product, int quantity, Map<ProductAttribute, String> selectedAttributes) {
    // TODO: implement addProductToCart
    throw UnimplementedError();
  }

  @override
  Future changeQuantity(Product product, int newQuantity) {
    // TODO: implement changeQuantity
    throw UnimplementedError();
  }

  @override
  Future<Promo> getAppliedPromo() {
    // TODO: implement getAppliedPromo
    throw UnimplementedError();
  }

  @override
  Future<List<CartItem>> getCartContent() {
    // TODO: implement getCartContent
    throw UnimplementedError();
  }

  @override
  Future setPromo(Promo promo) {
    // TODO: implement setPromo
    throw UnimplementedError();
  }

}
