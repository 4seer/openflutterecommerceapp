// Favourites Grid list of products and on Favourites screen
// Author: umair_adil@live.com
// Date: 2020-02-14

import 'package:flutter/material.dart';
import 'package:openflutterecommerce/config/theme.dart';
import 'package:openflutterecommerce/repos/models/product.dart';
import 'package:openflutterecommerce/screens/favorites/views/favourites_grid_item.dart';
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
      productTiles.add(FavouritesGridCard(
          width: elementWidth, height: elementHeight, product: products[i]));
    }
    if (productTiles.isNotEmpty) {
      return new GridView.builder(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        gridDelegate: new SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 250.0,
          mainAxisSpacing: 4.0,
          crossAxisSpacing: 4.0,
          childAspectRatio: MediaQuery.of(context).size.width /
              (MediaQuery.of(context).size.height),
        ),
        padding: const EdgeInsets.only(left: 4.0),
        itemCount: productTiles.length,
        itemBuilder: (context, i) => productTiles[i],
      );
    } else {
      return Container();
    }
  }
}
