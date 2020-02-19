// Favourites List of products and on Favourites screen
// Author: umair_adil@live.com
// Date: 2020-02-14

import 'package:flutter/material.dart';
import 'package:openflutterecommerce/config/theme.dart';
import 'package:openflutterecommerce/repos/models/product.dart';
import 'package:openflutterecommerce/widgets/product_card.dart';

import 'favourites_list_item.dart';

class FavouritesListView extends StatelessWidget {
  final double width;
  final double height = 284;
  final double elementHeight = 184;
  final double elementWidth = 148;
  final List<Product> products;

  const FavouritesListView({Key key, this.width, this.products})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Widget> productTiles = new List<Widget>();
    ThemeData _theme = Theme.of(context);
    for (int i = 0; i < products.length; i++) {
      productTiles.add(FavouritesListCard(
          width: elementWidth, height: elementHeight, product: products[i]));
    }
    if (productTiles.isNotEmpty) {
      return Padding(
        padding: const EdgeInsets.only(left: 2.0,right: 2.0),
        child: ListView.separated(
          separatorBuilder: (BuildContext context, int index) {
            return SizedBox(
              height: 10,
            );
          },
          physics: BouncingScrollPhysics(),
          scrollDirection: Axis.vertical,
          itemCount: productTiles.length,
          shrinkWrap: true,
          itemBuilder: (context, index) {
            return productTiles[index];
          },
        ),
      );
    } else {
      return Container();
    }
  }
}
