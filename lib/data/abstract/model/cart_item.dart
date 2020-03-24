import 'package:equatable/equatable.dart';
import 'package:openflutterecommerce/data/abstract/model/product_attribute.dart';

import 'product.dart';

class CartItem extends Equatable {
  final Product product;
  final Map<ProductAttribute, String> selectedAttributes;
  final int quantity;

  double get price => quantity * product.price;

  CartItem({
    this.product,
    this.quantity,
    this.selectedAttributes,
  });

  @override
  List<Object> get props => [product, selectedAttributes, quantity];
}
