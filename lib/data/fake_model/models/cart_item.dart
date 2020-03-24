import 'package:openflutterecommerce/data/abstract/model/cart_item.dart';
import 'package:openflutterecommerce/data/abstract/model/product.dart';
import 'package:openflutterecommerce/data/abstract/model/product_attribute.dart';

class FakeCartItem extends CartItem {
  FakeCartItem(
      {Product product,
      int quantity,
      Map<ProductAttribute, String> selectedAttributes})
      : super(
            product: product,
            quantity: quantity,
            selectedAttributes: selectedAttributes);

  FakeCartItem copyWith(
      {int quantity, Map<ProductAttribute, String> selectedAttributes}) {
    return FakeCartItem(
        product: product,
        quantity: quantity ?? this.quantity,
        selectedAttributes: selectedAttributes ?? this.selectedAttributes);
  }
}
