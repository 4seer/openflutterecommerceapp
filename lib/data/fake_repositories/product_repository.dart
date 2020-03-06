// Product Repositry
// Author: openflutterproject@gmail.com
// Date: 2020-02-06

import 'package:flutter/material.dart';

import 'models/cart_product.dart';
import 'models/product.dart';
import 'models/product_color.dart';
import 'models/product_rating.dart';

class ProductRepository {
  void addToFav(int id) {
    //TODO: add to fav [local database]
  }

  void removeFromFav(int id) {
    //TODO: remove from fav
  }

  Product getProduct(int id) {
    return Product(
        id: 1,
        image: 'assets/images/checkout/cart/product1.png',
        discountPercent: 20,
        favorite: false,
        rating: 5,
        ratingCount: 10,
        price: 15,
        title: 'Pullover',
        categoryTitle: 'Dorothy Perkins',
        isNew: true,
        sizes: ['Red', 'Black', 'White', 'Yellow'],
        colors: ['XS', 'S', 'M', 'L', 'XL'],
        description:
            "Lorem ipsum dolor amet ennui chia synth mixtape wolf forage brooklyn pug you probably haven't heard of them lumbersexual, iceland tilde. Poke tumeric readymade brunch, mustache banh mi man bun bushwick celiac hoodie mumblecore",
        ratingDetail: [
          ProductRating(rating: 5.0, quantity: 600),
          ProductRating(rating: 4.0, quantity: 700),
          ProductRating(rating: 3.0, quantity: 12),
          ProductRating(rating: 2.0, quantity: 4),
          ProductRating(rating: 1.0, quantity: 0),
        ]);
  }

  List<Product> getSimilarProducts(int productId) {
    return getProducts(1);
  }

  List<CartProduct> getCartProducts() {
    return [
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
    ];
  }

  //Get Product array
  //TODO: fetch from local DB
  List<Product> getProducts(int categoryId) {
    switch (categoryId) {
      case 1:
        return [
          Product(
            id: 1,
            image: 'assets/thumbs/dress/dress2.png',
            discountPercent: 20,
            favorite: false,
            rating: 5,
            ratingCount: 1316,
            price: 15,
            title: 'Evening Dress',
            categoryTitle: 'Dorothy Perkins',
            isNew: true,
            ratingDetail: [
              ProductRating(rating: 5.0, quantity: 600),
              ProductRating(rating: 4.0, quantity: 700),
              ProductRating(rating: 3.0, quantity: 12),
              ProductRating(rating: 2.0, quantity: 4),
              ProductRating(rating: 1.0, quantity: 0),
            ],
          ),
          Product(
            id: 2,
            image: 'assets/thumbs/dress/dress1.png',
            discountPercent: 15,
            favorite: false,
            rating: 5,
            ratingCount: 10,
            price: 22,
            title: 'Short Dress',
            categoryTitle: 'Sitlly',
            isNew: false,
            ratingDetail: [
              ProductRating(rating: 5.0, quantity: 12),
              ProductRating(rating: 4.0, quantity: 7),
              ProductRating(rating: 3.0, quantity: 4),
              ProductRating(rating: 2.0, quantity: 2),
              ProductRating(rating: 1.0, quantity: 1),
            ],
          ),
          Product(
            id: 3,
            image: 'assets/thumbs/dress/dress2.png',
            discountPercent: 20,
            favorite: false,
            rating: 5,
            ratingCount: 10,
            price: 15,
            title: 'Evening Dress',
            categoryTitle: 'Dorothy Perkins',
            isNew: false,
            ratingDetail: [
              ProductRating(rating: 5.0, quantity: 99),
              ProductRating(rating: 4.0, quantity: 180),
              ProductRating(rating: 3.0, quantity: 0),
              ProductRating(rating: 2.0, quantity: 40),
              ProductRating(rating: 1.0, quantity: 10),
            ],
          ),
          Product(
              id: 4,
              image: 'assets/thumbs/dress/dress1.png',
              discountPercent: 15,
              favorite: false,
              rating: 5,
              ratingCount: 10,
              price: 22,
              title: 'Short Dress',
              categoryTitle: 'Sitlly',
              isNew: true,
              ratingDetail: []),
        ];
        break;

      case 2:
      default:
        final products = [
          Product(
              id: 5,
              image: 'assets/thumbs/dress/dress2.png',
              discountPercent: 20,
              favorite: false,
              rating: 5,
              ratingCount: 10,
              price: 15,
              title: 'Evening Dress',
              categoryTitle: 'Dorothy Perkins',
              isNew: true,
              ratingDetail: []),
          Product(
              id: 6,
              image: 'assets/thumbs/dress/dress1.png',
              discountPercent: 15,
              favorite: false,
              rating: 5,
              ratingCount: 10,
              price: 22,
              title: 'Short Dress',
              categoryTitle: 'Sitlly',
              isNew: false,
              ratingDetail: []),
          Product(
              id: 7,
              image: 'assets/thumbs/dress/dress2.png',
              discountPercent: 20,
              favorite: false,
              rating: 5,
              ratingCount: 10,
              price: 15,
              title: 'Evening Dress',
              categoryTitle: 'Dorothy Perkins',
              isNew: false,
              ratingDetail: []),
          Product(
              id: 8,
              image: 'assets/thumbs/dress/dress1.png',
              discountPercent: 15,
              favorite: false,
              rating: 5,
              ratingCount: 10,
              price: 22,
              title: 'Short Dress',
              categoryTitle: 'Sitlly',
              isNew: true,
              ratingDetail: []),
          Product(
              id: 5,
              image: 'assets/thumbs/dress/dress2.png',
              discountPercent: 20,
              favorite: false,
              rating: 5,
              ratingCount: 10,
              price: 15,
              title: 'Evening Dress',
              categoryTitle: 'Dorothy Perkins',
              isNew: true,
              ratingDetail: []),
          Product(
              id: 6,
              image: 'assets/thumbs/dress/dress1.png',
              discountPercent: 15,
              favorite: false,
              rating: 5,
              ratingCount: 10,
              price: 22,
              title: 'Short Dress',
              categoryTitle: 'Sitlly',
              isNew: false,
              ratingDetail: []),
          Product(
              id: 7,
              image: 'assets/thumbs/dress/dress2.png',
              discountPercent: 20,
              favorite: false,
              rating: 5,
              ratingCount: 10,
              price: 15,
              title: 'Evening Dress',
              categoryTitle: 'Dorothy Perkins',
              isNew: false,
              ratingDetail: []),
          Product(
              id: 8,
              image: 'assets/thumbs/dress/dress1.png',
              discountPercent: 15,
              favorite: false,
              rating: 5,
              ratingCount: 10,
              price: 22,
              title: 'Short Dress',
              categoryTitle: 'Sitlly',
              isNew: true,
              ratingDetail: []),
        ];
        return products;
        break;
    }
  }
}
