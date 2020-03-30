import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:openflutterecommerce/config/theme.dart';
import 'package:openflutterecommerce/data/abstract/model/product.dart';
import 'package:openflutterecommerce/presentation/widgets/extensions/commerce_image_view.dart';
import 'package:openflutterecommerce/presentation/widgets/extensions/product_view_methods.dart';
import 'package:openflutterecommerce/presentation/widgets/independent/base_product_list_item.dart';

class FavoriteProductListItem extends BaseProductListItem {
  FavoriteProductListItem(
      {VoidCallback showProductInfo,
      bool isAvailable = true,
      VoidCallback onRemoveFromFavorites,
      VoidCallback onAddToCart,
      double imageWidth,
      double imageHeight,
      @required Product product})
      : super(
          onClick: showProductInfo,
          inactiveMessage:
              isAvailable ? null : 'Sorry, this item is currently sold out',
          bottomRoundButton: FloatingActionButton(
            backgroundColor: AppColors.red,
            onPressed: onAddToCart,
            child: Icon(
              FontAwesomeIcons.cartPlus,
              color: AppColors.white,
            ),
          ),
          image: product.mainImage.getView(),
          imageWidth: imageWidth,
          imageHeight: imageHeight,
          onRemove: onRemoveFromFavorites,
          specialMark: product.specialMark,
          mainContentBuilder: (context) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(product.title,
                    style: Theme.of(context).textTheme.display1),
                Row(
                  children: <Widget>[
                    ProductViewMethods.buildColor(product, Theme.of(context)),
                    Padding(
                      padding: EdgeInsets.all(AppSizes.linePadding),
                    ),
                    ProductViewMethods.buildSize(product, Theme.of(context)),
                  ],
                ),
                Row(
                  children: <Widget>[
                    ProductViewMethods.buildPrice(product, Theme.of(context)),
                    product.discountPercent == null
                        ? Container()
                        : ProductViewMethods.buildDiscountPrice(
                            product.discountPrice, Theme.of(context)),
                    Padding(
                      padding: EdgeInsets.only(left: AppSizes.linePadding),
                    ),
                    ProductViewMethods.buildRating(context, product)
                  ],
                )
              ],
            );
          },
        );
}
