import 'package:flutter/material.dart';
import 'package:openflutterecommerce/data/abstract/model/product_attribute.dart';
import 'package:openflutterecommerce/data/abstract/model/shipping_address.dart';

import '../abstract/model/promo.dart';
import '../abstract/model/user_order.dart';
import 'models/cart_item.dart';
import 'models/product.dart';

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
      products: <FakeCartItem>[],
      promo: Promo(
          daysLeft: 6,
          discount: 10,
          image: null,
          promoCode: 'promo12',
          textColor: Colors.white,
          title: 'Promo 12'),
      shippingAddress: ShippingAddress(
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
      products: <FakeCartItem>[],
      promo: Promo(
          daysLeft: 6,
          discount: 10,
          image: null,
          promoCode: 'promo12',
          textColor: Colors.white,
          title: 'Promo 12'),
      shippingAddress: ShippingAddress(
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
      products: <FakeCartItem>[
        FakeCartItem(
          product: FakeProduct(
            id: 1,
            localImages: ['assets/images/checkout/cart/product1.png'],
            discountPercent: 20,
            rating: 5,
            ratingCount: 10,
            price: 15,
            title: 'Pullover',
            productAttributes: [sizeAttribute, colorAttribute],
          ),
          selectedAttributes: {
            sizeAttribute: sizeAttribute.options[0],
            colorAttribute: colorAttribute.options.first
          },
          quantity: 1,
        ),
        FakeCartItem(
          product: FakeProduct(
            id: 2,
            localImages: ['assets/images/checkout/cart/product2.png'],
            discountPercent: 20,
            rating: 5,
            ratingCount: 10,
            price: 15,
            title: 'T-shirt',
            productAttributes: [sizeAttribute, colorAttribute],
          ),
          selectedAttributes: {
            sizeAttribute: sizeAttribute.options[0],
            colorAttribute: colorAttribute.options.last
          },
          quantity: 1,
        ),
        FakeCartItem(
          product: FakeProduct(
            id: 3,
            localImages: ['assets/images/checkout/cart/product2.png'],
            discountPercent: 20,
            isFavorite: false,
            rating: 5,
            ratingCount: 10,
            price: 15,
            title: 'Sport Dress',
            productAttributes: [sizeAttribute, colorAttribute],
          ),
          selectedAttributes: {
            sizeAttribute: sizeAttribute.options[0],
            colorAttribute: colorAttribute.options.last
          },
          quantity: 1,
        ),
      ],
      promo: Promo(
          daysLeft: 6,
          discount: 10,
          image: null,
          promoCode: 'promo12',
          textColor: Colors.white,
          title: 'Promo 12'),
      shippingAddress: ShippingAddress(
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
