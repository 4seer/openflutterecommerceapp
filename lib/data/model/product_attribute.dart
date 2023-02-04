import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

class ProductAttribute extends Equatable {
  final int id;
  final String name;
  final List<String> options;
  final String info;

  const ProductAttribute(
      {required this.id, required this.name, required this.options, required this.info});

  @override
  List<Object> get props => [id, name, options, info];
}
