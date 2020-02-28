import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class ProductColor extends Equatable{
  final Color color;
  final String title;

  ProductColor(this.color, this.title);

  @override
  List<Object> get props => [color, title];
}