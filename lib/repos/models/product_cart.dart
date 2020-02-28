


import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class ProductCart extends Equatable {
  final int id;
  final String title;
  final String image;
  final double price;
  final String color;
  final String size;
  final String currency;


  ProductCart(
      {@required this.id,
        @required this.title,
        @required this.image,
        @required this.price,
        @required this.color,
        @required this.size,
        @required this.currency,
        });

  @override
  List<Object> get props => [
    id,
    title,
    image,
    price,
    color,
    size,
    currency
  ];
}
