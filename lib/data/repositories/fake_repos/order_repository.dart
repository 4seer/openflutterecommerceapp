import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:openflutterecommerce/data/model/cart_item.dart';
import 'package:openflutterecommerce/data/model/commerce_image.dart';
import 'package:openflutterecommerce/data/model/product.dart';
import 'package:openflutterecommerce/data/model/product_attribute.dart';
import 'package:openflutterecommerce/data/model/shipping_address.dart';

import '../../model/promo.dart';
import '../../model/user_order.dart';

class OrderRepository {
  UserOrder getOrderDetails(int orderId) {
    return _myOrders.firstWhere((element) => element.id == orderId);
  }

  List<UserOrder> getMyOrders() {
    return _myOrders;
  }

  static const sizeAttribute =
      ProductAttribute(name: 'size', options: ['S', 'M', 'L', 'XL']);
  static const colorAttribute =
      ProductAttribute(name: 'color', options: ['grey', 'red', 'yellow']);

  final _myOrders = [
    UserOrder(
      id: 1,
      orderNumber: 1947034,
      orderStatus: UserOrderStatus.Delivered,
      products: <CartItem>[],
      promo: Promo(
        daysLeft: 6,
        discount: 10,
        image: null,
        promoCode: 'promo12',
        textColor: Colors.white,
        title: 'Promo 12'),
      shippingAddress: ShippingAddressModel(
        id: 1,
        address: '3 Newbridge Court',
        city: 'Chino Hills',
        country: 'United States',
        fullName: 'John Smith',
        postal: '91709',
        state: 'CA'),
      paymentMethod: '**** **** **** 3947',
      deliveryMethod: 'FedEx, 3 days, \$15',
      trackingNumber: 'IW3475453455',
      orderCreated: DateTime.parse('2020-01-22 20:18:04Z'),
    ),
    UserOrder(
      id: 2,
      orderNumber: 1947035,
      orderStatus: UserOrderStatus.Delivered,
      products: <CartItem>[],
      promo: Promo(
        daysLeft: 6,
        discount: 10,
        image: null,
        promoCode: 'promo12',
        textColor: Colors.white,
        title: 'Promo 12'),
      shippingAddress: ShippingAddressModel(
        id: 1,
        address: '3 Newbridge Court',
        city: 'Chino Hills',
        country: 'United States',
        fullName: 'John Smith',
        postal: '91709',
        state: 'CA'),
      paymentMethod: '**** **** **** 3947',
      deliveryMethod: 'FedEx, 3 days, \$15',
      trackingNumber: 'IW3475453456',
      orderCreated: DateTime.parse('2020-01-20 20:18:04Z'),
    ),
    UserOrder(
      id: 3,
      orderNumber: 1947035,
      orderStatus: UserOrderStatus.Delivered,
      products: <CartItem>[
        CartItem(
          product: Product(
            1,
            images: [CommerceImage(0, 'assets/images/checkout/cart/product1.png', '')],
            discountPercent: 20,
            averageRating: 5,
            ratingCount: 10,
            price: 15,
            title: 'Pullover',
            selectableAttributes: [sizeAttribute, colorAttribute], categories: [], hashTags: [], subTitle: null,
          ),
          selectedAttributes: HashMap.fromEntries([
            MapEntry(sizeAttribute, 'S'),
            MapEntry(colorAttribute, 'Blue')
          ]),
          productQuantity: ProductQuantity(1)
        ),
        CartItem(
          product: Product(
            2,
            images: [CommerceImage(0, 'assets/images/checkout/cart/product2.png', '')],
            discountPercent: 20,
            averageRating: 5,
            ratingCount: 10,
            price: 15,
            title: 'T-shirt',
            selectableAttributes: [sizeAttribute, colorAttribute],
            categories: [], hashTags: [], subTitle: null,
          ),
          selectedAttributes: HashMap.fromEntries([
            MapEntry(sizeAttribute, 'S'),
            MapEntry(colorAttribute, 'Blue')
          ]),
          productQuantity: ProductQuantity(1)
        ),
        CartItem(
          product: Product(
            3,
            images: [CommerceImage(0, 'assets/images/checkout/cart/product2.png', '')],
            discountPercent: 20,
            isFavorite: false,
            averageRating: 5,
            ratingCount: 10,
            price: 15,
            title: 'Sport Dress',
            selectableAttributes: [sizeAttribute, colorAttribute],
            categories: [], hashTags: [], subTitle: null,
          ),
          selectedAttributes: HashMap.fromEntries([
            MapEntry(sizeAttribute, 'S'),
            MapEntry(colorAttribute, 'Blue')
          ]),
          productQuantity: ProductQuantity(1)
        ),
      ],
      promo: Promo(
        daysLeft: 6,
        discount: 10,
        image: null,
        promoCode: 'promo12',
        textColor: Colors.white,
        title: 'Promo 12'),
      shippingAddress: ShippingAddressModel(
        id: 1,
        address: '3 Newbridge Court',
        city: 'Chino Hills',
        country: 'United States',
        fullName: 'John Smith',
        postal: '91709',
        state: 'CA'),
      paymentMethod: '**** **** **** 3947',
      deliveryMethod: 'FedEx, 3 days, \$15',
      trackingNumber: 'IW3475453456',
      orderCreated: DateTime.parse('2020-01-20 20:18:04Z'),
    )
  ];
}
