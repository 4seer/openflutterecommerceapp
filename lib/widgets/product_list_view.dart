// List of products in a slider
// Author: openflutterproject@gmail.com
// Date: 2020-02-06

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:openflutterecommerce/config/theme.dart';
import 'package:openflutterecommerce/repos/models/product.dart';
import 'package:openflutterecommerce/widgets/product_card.dart';
import 'package:openflutterecommerce/widgets/product_rating.dart';

class OpenFlutterProductListView extends StatelessWidget {
  final double width;
  final double height = 284;
  final double elementHeight = 184;
  final double elementWidth = 148;
  final List<Product> products;
  const OpenFlutterProductListView({Key key, this.width, 
    this.products}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Widget> productTiles = new List<Widget>();
    ThemeData _theme = Theme.of(context);
    for(int i = 0; i < products.length; i++){
      productTiles.add(
        OpenFlutterProductCard(
          width: elementWidth,
          height: elementHeight, 
          product: products[i])
      );
    }
    return Container(
      padding: EdgeInsets.only(top: AppSizes.sidePadding),
      width: width,
      height: height,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: productTiles
      )
    );
  }
}