import 'package:flutter/material.dart';
import 'package:openflutterecommerce/data/model/product_attribute.dart';

class SelectedAttributeView extends StatelessWidget {
  final ProductAttribute productAttribute;
  final String selectedValue;

  const SelectedAttributeView(
      {required this.productAttribute, required this.selectedValue});

  @override
  Widget build(BuildContext context) {
    return Chip(
      label: Text('${productAttribute.name}: $selectedValue'),
    );
  }
}
