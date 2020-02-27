import 'package:equatable/equatable.dart';
import 'package:openflutterecommerce/repos/models/product.dart';
import 'package:openflutterecommerce/repos/models/product_color.dart';

class CartProduct extends Equatable{
  final Product product;
  final String size;
  final ProductColor color;
  int quantity;
  double price;

  CartProduct({this.product, this.quantity, this.size, this.color, this.price});

  changeQuantity(int newQuantity){
    quantity = newQuantity;
    price = quantity * product.price;
  }
  CartProduct copyWith({
    Product product, 
    int quantity, 
    String size, 
    ProductColor color, 
    double price}){
      return CartProduct(
        product: product ?? this.product,
        quantity: quantity ?? this.quantity,
        size: size ?? this.size,
        color: color ?? this.color,
        price: price ?? this.price,
      );
    }

  @override
  List<Object> get props => [product, quantity, size, color, price];
}