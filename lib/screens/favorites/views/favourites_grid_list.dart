import 'package:flutter/material.dart';
import 'package:openflutterecommerce/config/theme.dart';
import 'package:openflutterecommerce/repos/models/product.dart';
import 'package:openflutterecommerce/widgets/product_card.dart';

class FavouritesGridList extends StatelessWidget {
  final double width;
  final double height = 284;
  final double elementHeight = 184;
  final double elementWidth = 148;
  final List<Product> products;

  const FavouritesGridList({Key key, this.width, this.products})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Widget> productTiles = new List<Widget>();
    ThemeData _theme = Theme.of(context);
    for (int i = 0; i < products.length; i++) {
      productTiles.add(OpenFlutterProductCard(
          width: elementWidth, height: elementHeight, product: products[i]));
    }
    if (productTiles.isNotEmpty) {
      return Container(
          padding: EdgeInsets.only(top: AppSizes.sidePadding),
          child: GridView.count(
              crossAxisCount: 2,
              childAspectRatio: 1.0,
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              children: productTiles.map((Widget childItem) {
                return childItem;
              }).toList()));
    } else {
      return Container();
    }
  }
}
