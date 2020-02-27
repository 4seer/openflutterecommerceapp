import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class Promo extends Equatable{
  final double discount;
  final String title;
  final String promoCode;
  final int daysLeft;
  final String image;
  final Color textColor;

  Promo({
    @required this.discount, 
    @required this.title, 
    @required this.promoCode, 
    @required this.daysLeft, 
    @required this.image,
    @required this.textColor});

  @override
  List<Object> get props => [discount, title, promoCode, daysLeft, textColor];
}