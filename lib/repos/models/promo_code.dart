import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class PromoCode extends Equatable {
  final int id;
  final String title;
  final String promoCode;
  final String offerPercentage;
  final String expiryDate;



  PromoCode(
      {@required this.id,
        @required this.title,
        @required this.promoCode,
        @required this.offerPercentage,
        @required this.expiryDate,
      });

  @override
  List<Object> get props => [
    id,
    title,
    promoCode,
    offerPercentage,
    expiryDate,
  ];
}
