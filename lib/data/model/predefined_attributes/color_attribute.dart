import 'dart:ui';

import 'package:openflutterecommerce/data/model/product_attribute.dart';

class ColorAttribute extends ProductAttribute {
  final Map<String, Color> visibleColors;

  ColorAttribute({required int id, required String info, required this.visibleColors})
      : super(id: id, name: 'Color', info: info, options: []);
}
