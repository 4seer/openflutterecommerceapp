// Product list view element
// Author: openflutterproject@gmail.com
// Date: 2020-02-06

import 'package:flutter/material.dart';
import 'package:openflutterecommerce/data/abstract/model/category.dart';
import 'package:openflutterecommerce/data/abstract/model/product.dart';
import 'package:openflutterecommerce/presentation/widgets/extensions/product_view_methods.dart';
import 'package:openflutterecommerce/presentation/widgets/independent/base_product_tile.dart';

import '../extensions/commerce_image_view.dart';

class GeneralProductTile extends BaseProductTile {
  GeneralProductTile(
      {Key key,
      @required Product product,
      Category category,
      @required VoidCallback onFavoritesClick,
      @required VoidCallback onClick})
      : super(
            key: key,
            onClick: onClick,
            bottomRoundButton: ProductViewMethods.getFavoritesButton(
                product, onFavoritesClick),
            image: product.mainImage.getView(),
            mainContentBuilder: (context) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  ProductViewMethods.buildRating(context, product),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 4.0),
                    child: Text(product.title,
                        style: Theme.of(context).textTheme.display1),
                  ),
                  Row(
                    children: <Widget>[
                      ProductViewMethods.buildPrice(product, Theme.of(context)),
                      SizedBox(
                        width: 8.0,
                      ),
                      product.discountPercent == null
                          ? Container()
                          : ProductViewMethods.buildDiscountPrice(
                              product.discountPrice, Theme.of(context)),
                    ],
                  )
                ],
              );
            },
            specialMark: product.specialMark);
}
