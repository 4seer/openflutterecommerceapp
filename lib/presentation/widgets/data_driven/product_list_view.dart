// List of products in a slider
// Author: openflutterproject@gmail.com
// Date: 2020-02-06

import 'package:flutter/material.dart';
import 'package:openflutterecommerce/config/routes.dart';
import 'package:openflutterecommerce/config/theme.dart';
import 'package:openflutterecommerce/data/abstract/model/product.dart';
import 'package:openflutterecommerce/presentation/features/product_details/product_screen.dart';

import '../extensions/product_view.dart';

class OpenFlutterProductListView extends StatelessWidget {
  final double width;
  final double height = 284;
  final List<Product> products;

  const OpenFlutterProductListView({
    Key key,
    this.width,
    this.products,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print('product number is ${products.length}');
    return Container(
        padding: EdgeInsets.only(top: AppSizes.sidePadding),
        width: width,
        height: height,
        child: ListView(
            scrollDirection: Axis.horizontal,
            children: products
                .map((product) => product.getTileView(
                      context: context,
                      onFavoritesClick: null, //TODO add favorites actions
                      showProductInfo: () {
                        Navigator.of(context).pushNamed(
                            OpenFlutterEcommerceRoutes.product,
                            arguments: ProductDetailsParameters(product.id, 
                              product.categoryIds.isNotEmpty ? product.categoryIds[0] : 0)
                            );
                      },
                    ))
                .toList(growable: false)));
  }
}
