import 'package:equatable/equatable.dart';
import 'package:openflutterecommerce/data/model/promo.dart';

import 'cart_item.dart';
import 'shipping_address.dart';

enum UserOrderStatus { InProgress, New, Paid, Sent, Delivered }

class UserOrder extends Equatable {
  final int id;
  final List<CartItem> products;
  final int orderNumber;
  final UserOrderStatus orderStatus;
  final ShippingAddressModel shippingAddress;

  //TODO: extend further on
  final String paymentMethod;

  //TODO: extend further on
  final String deliveryMethod;
  final Promo promo;
  final String trackingNumber;
  final DateTime orderDate;

  double get totalPrice => 0.0;
      /*products.fold(
          0,
          (previousValue, element) => previousValue +=
              element.productQuantity.quantity * element.price) -
      promo.discount;*/

  int get totalQuantity => products.fold(
      0,
      (previousValue, element) =>
          previousValue += element.productQuantity.quantity);

  UserOrder({
    required this.id,
    required List<CartItem> products,
    required this.orderNumber,
    this.orderStatus = UserOrderStatus.InProgress,
    required this.shippingAddress,
    required this.paymentMethod,
    required this.deliveryMethod,
    required this.trackingNumber,
    required this.promo,
    required DateTime orderCreated,
  })  : products = products ?? [],
        orderDate = orderCreated ?? DateTime.now();

  @override
  List<Object> get props => [
        id,
        products,
        orderNumber,
        orderStatus,
        shippingAddress,
        paymentMethod,
        deliveryMethod,
        trackingNumber,
        promo,
        orderDate,
      ];
}
