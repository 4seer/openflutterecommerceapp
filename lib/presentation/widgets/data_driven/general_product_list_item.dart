import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:openflutterecommerce/data/abstract/model/product.dart';
import 'package:openflutterecommerce/presentation/widgets/extensions/commerce_image_view.dart';
import 'package:openflutterecommerce/presentation/widgets/extensions/product_view_methods.dart';
import 'package:openflutterecommerce/presentation/widgets/independent/base_product_list_item.dart';

class GeneralProductListItem extends BaseProductListItem {
  GeneralProductListItem(
      {VoidCallback showProductInfo,
      bool isAvailable = true,
      VoidCallback onFavoritesClick,
      @required Product product})
      : super(
          onClick: showProductInfo,
          inactiveMessage:
              isAvailable ? null : 'Sorry, this item is currently sold out',
          bottomRoundButton:
              ProductViewMethods.getFavoritesButton(product, onFavoritesClick),
          image: product.mainImage.getView(),
          specialMark: product.specialMark,
          mainContentBuilder: (context) {
            return Column(
              children: <Widget>[
                Text(product.title,
                    style: Theme.of(context).textTheme.display1),
                ProductViewMethods.buildRating(context, product),
                ProductViewMethods.buildPrice(product, Theme.of(context)),
              ],
            );
          },
        );
}
