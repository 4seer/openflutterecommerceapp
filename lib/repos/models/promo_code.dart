import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class PromoCode extends Equatable {
  final int id;
  final String title;
  final String description;
  final double offerPercentage;
  final String expiryDate;



  PromoCode(
      {@required this.id,
        @required this.title,
        @required this.description,
        @required this.offerPercentage,
        @required this.expiryDate,
      });

  @override
  List<Object> get props => [
    id,
    title,
    description,
    offerPercentage,
    expiryDate,
  ];
}
