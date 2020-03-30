import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

class ProductAttribute extends Equatable {
  final int id;
  final String name;
  final List<String> options;
  final String info;

  const ProductAttribute(
      {this.id, @required this.name, this.options, this.info});

  @override
  List<Object> get props => [id, name, options, info];
}
