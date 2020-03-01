import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:openflutterecommerce/data/fake_repositories/models/promo.dart';
import 'package:openflutterecommerce/data/fake_repositories/models/shipping_address.dart';

import 'cart_product.dart';

enum UserOrderStatus { New, Paid, Sent, Delivered }

class UserOrder extends Equatable {
  final int id;
  final List<CartProduct> products;
  final int orderNumber;
  final UserOrderStatus orderStatus;
  final ShippingAddress shippingAddress;

  //TODO: extend further on
  final String paymentMethod;

  //TODO: extend further on
  final String deliveryMethod;
  final Promo promo;
  final double totalAmount;
  final String trackingNumber;
  final DateTime orderDate;
  final int quantity;

  UserOrder(
      {@required this.id,
      @required this.products,
      @required this.orderNumber,
      @required this.orderStatus,
      @required this.shippingAddress,
      @required this.paymentMethod,
      @required this.deliveryMethod,
      @required this.trackingNumber,
      @required this.promo,
      @required this.totalAmount,
      @required this.orderDate,
      @required this.quantity});

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
        totalAmount,
        orderDate,
        quantity
      ];
}
