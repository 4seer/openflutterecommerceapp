/*
 * @author Andrew Poteryahin <openflutterproject@gmail.com>
 * @copyright 2020 Open E-commerce App
 * @see cart_repository_impl.dart
 */

import 'package:openflutterecommerce/data/abstract/cart_repository.dart';
import 'package:openflutterecommerce/data/abstract/model/cart_item.dart';
import 'package:openflutterecommerce/data/abstract/model/product.dart';
import 'package:openflutterecommerce/data/abstract/model/product_attribute.dart';
import 'package:openflutterecommerce/data/abstract/model/promo.dart';

class CartRepositoryImpl extends CartRepository{
  static CartProductDataStorage cartProductDataStorage 
    = CartProductDataStorage();
  @override
  Future addProductToCart(Product product, int quantity, Map<ProductAttribute, String> selectedAttributes) {
    // TODO: implement addProductToCart
    throw UnimplementedError();
  }

  @override
  Future changeQuantity(CartItem item, int newQuantity) async {
    for(int i = 0; i < cartProductDataStorage.items.length; i++){
      if ( cartProductDataStorage.items[i] == item ) {
        cartProductDataStorage.items[i].productQuantity.changeQuantity(newQuantity);
      }
    }
  }

  @override
  Future<Promo> getAppliedPromo() {
    // TODO: implement getAppliedPromo
    throw UnimplementedError();
  }

  @override
  Future<List<CartItem>> getCartContent() async {
    return cartProductDataStorage.items;
  }

  @override
  Future setPromo(Promo promo) {
    // TODO: implement setPromo
    throw UnimplementedError();
  }

}

class CartProductDataStorage {
  List<CartItem> items = [];
}