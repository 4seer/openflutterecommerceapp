// Product model declaration
// Author: openflutterproject@gmail.com
// Date: 2020-02-06

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class Product extends Equatable{
  final int id;
  final String title;
  final String image;
  final String categoryTitle;
  final double price;
  final double discountPercent;
  final double rating;
  final int ratingCount;
  final bool favorite;
  final bool isNew;

  Product({@required this.id, @required this.title, @required this.image, 
    @required this.categoryTitle, @required this.price, @required this.discountPercent, 
    @required this.rating, @required this.ratingCount, @required this.favorite,
    @required this.isNew});
}