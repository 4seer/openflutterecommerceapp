import 'package:equatable/equatable.dart';

class ProductAttribute extends Equatable {
  final int id;
  final String name;
  final List<String> options;
  final String info;

  const ProductAttribute({this.id, this.name, this.options, this.info});

  @override
  List<Object> get props => [id, name, options, info];
}
