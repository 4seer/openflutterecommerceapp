import 'package:flutter/material.dart';
import 'models/cart_product.dart';
import 'models/product.dart';
import 'models/product_color.dart';
import 'models/promo.dart';
import 'models/shipping_address.dart';
import 'models/user_order.dart';

class OrderRepository {
  UserOrder getOrderDetails(int orderId) {
    return UserOrder(
        id: 1,
        orderNumber: 1947035,
        orderStatus: UserOrderStatus.Delivered,
        products: <CartProduct>[
          CartProduct(
              product: Product(
                  id: 1,
                  image: 'assets/images/checkout/cart/product1.png',
                  discountPercent: 20,
                  favorite: false,
                  rating: 5,
                  ratingCount: 10,
                  price: 15,
                  title: 'Pullover',
                  categoryTitle: 'Dorothy Perkins',
                  isNew: true),
              size: 'L',
              color: ProductColor(Colors.black, 'Black'),
              quantity: 1,
              price: 15),
          CartProduct(
              product: Product(
                  id: 2,
                  image: 'assets/images/checkout/cart/product2.png',
                  discountPercent: 20,
                  favorite: false,
                  rating: 5,
                  ratingCount: 10,
                  price: 15,
                  title: 'T-shirt',
                  categoryTitle: 'Dorothy Perkins',
                  isNew: true),
              size: 'L',
              color: ProductColor(Colors.grey, 'Gray'),
              quantity: 1,
              price: 15),
          CartProduct(
              product: Product(
                  id: 3,
                  image: 'assets/images/checkout/cart/product2.png',
                  discountPercent: 20,
                  favorite: false,
                  rating: 5,
                  ratingCount: 10,
                  price: 15,
                  title: 'Sport Dress',
                  categoryTitle: 'Dorothy Perkins',
                  isNew: true),
              size: 'L',
              color: ProductColor(Colors.grey, 'Gray'),
              quantity: 1,
              price: 15),
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
        totalAmount: 155,
        orderDate: DateTime.parse('2020-01-20 20:18:04Z'),
        quantity: 3);
  }

  List<UserOrder> getMyOrders() {
    return [
      UserOrder(
          id: 1,
          orderNumber: 1947034,
          orderStatus: UserOrderStatus.Delivered,
          products: <CartProduct>[],
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
          totalAmount: 133,
          orderDate: DateTime.parse('2020-01-22 20:18:04Z'),
          quantity: 3),
      UserOrder(
          id: 2,
          orderNumber: 1947035,
          orderStatus: UserOrderStatus.Delivered,
          products: <CartProduct>[],
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
          totalAmount: 155,
          orderDate: DateTime.parse('2020-01-20 20:18:04Z'),
          quantity: 3),
    ];
  }
}
