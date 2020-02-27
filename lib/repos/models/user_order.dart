import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:openflutterecommerce/repos/models/cart_product.dart';
import 'package:openflutterecommerce/repos/models/promo.dart';
import 'package:openflutterecommerce/repos/models/shipping_address.dart';

enum UserOrderStatus{
  New,
  Paid,
  Sent,
  Delivered
}

class UserOrder extends Equatable{
  final List<CartProduct> products;
  final int orderNumber;
  final UserOrderStatus orderStatus;
  final ShippingAddress shippingAddress;
  final Promo promo;
  final double totalAmount;
  final String trackingNumber;

  UserOrder({
    @required this.products, 
    @required this.orderNumber, 
    @required this.orderStatus, 
    @required this.shippingAddress,
    @required this.trackingNumber, 
    @required this.promo, 
    @required this.totalAmount
  });

  @override
  List<Object> get props =>[products, orderNumber, orderStatus, shippingAddress, trackingNumber, promo, totalAmount];
}