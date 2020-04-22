import 'dart:math';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:openflutterecommerce/config/theme.dart';
import 'package:openflutterecommerce/data/abstract/model/favorite_product.dart';
import 'package:openflutterecommerce/data/abstract/model/product.dart';
import 'package:openflutterecommerce/presentation/widgets/independent/base_product_list_item.dart';
import 'package:openflutterecommerce/presentation/widgets/independent/base_product_tile.dart';
import 'package:openflutterecommerce/presentation/widgets/independent/product_rating.dart';

import 'commerce_image_view.dart';

extension View on Product {
  Widget getListView(
      {@required BuildContext context,
      @required VoidCallback showProductInfo,
      @required VoidCallback onFavoritesClick}) {
    return BaseProductListItem(
      onClick: showProductInfo,
      inactiveMessage: amountAvailable == null || amountAvailable > 0
          ? null
          : 'Sorry, this item is currently sold out',
      bottomRoundButton: _getFavoritesButton(onFavoritesClick),
      image: mainImage?.getView(),
      specialMark: specialMark,
      mainContentBuilder: (context) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(title, style: Theme.of(context).textTheme.display1),
            buildRating(context),
            buildPrice(Theme.of(context)),
          ],
        );
      },
    );
  }

  Widget getTileView(
      {@required BuildContext context,
      @required VoidCallback showProductInfo,
      @required VoidCallback onFavoritesClick}) {
    return BaseProductTile(
        onClick: showProductInfo,
        bottomRoundButton: _getFavoritesButton(onFavoritesClick),
        inactiveMessage: amountAvailable == null || amountAvailable > 0
            ? null
            : 'Sorry, this item is currently sold out',
        image: mainImage.getView(),
        mainContentBuilder: (context) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              buildRating(context),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 4.0),
                child: Text(title, style: Theme.of(context).textTheme.display1),
              ),
              Row(
                children: <Widget>[
                  buildPrice(Theme.of(context)),
                  SizedBox(
                    width: 8.0,
                  ),
                  discountPercent == null
                      ? Container()
                      : buildDiscountPrice(Theme.of(context)),
                ],
              )
            ],
          );
        },
        specialMark: specialMark);
  }

  Widget _getFavoritesButton(VoidCallback onFavoritesClick) {
    return FloatingActionButton(
      heroTag: title +
          Random()
              .nextInt(1000000)
              .toString(), //TODO make sure that there is only one product with specified id on screen and use it as a tag
      mini: true,
      backgroundColor: AppColors.white,
      onPressed: onFavoritesClick,
      child: isFavorite
          ? Icon(
              FontAwesomeIcons.solidHeart,
              color: AppColors.red,
              size: 18.0,
            )
          : Icon(
              FontAwesomeIcons.heart,
              color: AppColors.red,
              size: 18.0,
            ),
    );
  }

  Widget buildPrice(ThemeData _theme) {
    return Text(
      price != null ? '\$' + price.toStringAsFixed(0) : '',
      style: _theme.textTheme.display3.copyWith(
        decoration: discountPrice != null && discountPrice > 0
            ? TextDecoration.lineThrough
            : TextDecoration.none,
      ),
    );
  }

  Widget buildRating(BuildContext context) {
    return Container(
        padding: EdgeInsets.only(
            top: AppSizes.linePadding, bottom: AppSizes.linePadding),
        child: OpenFlutterProductRating(
          rating: averageRating,
          ratingCount: ratingCount,
          alignment: MainAxisAlignment.start,
          iconSize: 12,
          labelFontSize: 12,
        ));
  }

  Widget buildDiscountPrice(ThemeData _theme) {
    return Text('\$' + discountPrice.toStringAsFixed(0),
        style: _theme.textTheme.display3.copyWith(color: _theme.errorColor));
  }
}

extension FavoriteView on FavoriteProduct {
  Widget getListView(
      {@required BuildContext context,
      @required VoidCallback showProductInfo,
      @required VoidCallback onAddToCart,
      @required VoidCallback onRemoveFromFavorites}) {
    return BaseProductListItem(
      onClick: showProductInfo,
      inactiveMessage:
          product.amountAvailable == null || product.amountAvailable > 0
              ? null
              : 'Sorry, this item is currently sold out',
      bottomRoundButton: FloatingActionButton(
        backgroundColor: AppColors.red,
        onPressed: onAddToCart,
        child: Icon(
          FontAwesomeIcons.cartPlus,
          color: AppColors.white,
        ),
      ),
      image: product.mainImage.getView(),
      onRemove: onRemoveFromFavorites,
      specialMark: product.specialMark,
      mainContentBuilder: (context) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(product.title, style: Theme.of(context).textTheme.display1),
            Row(
              children: <Widget>[
                _buildColor(Theme.of(context)),
                Padding(
                  padding: EdgeInsets.all(AppSizes.linePadding),
                ),
                _buildSize(Theme.of(context)),
              ],
            ),
            Row(
              children: <Widget>[
                product.buildPrice(Theme.of(context)),
                product.discountPercent == null
                    ? Container()
                    : product.buildDiscountPrice(Theme.of(context)),
                Padding(
                  padding: EdgeInsets.only(left: AppSizes.linePadding),
                ),
                product.buildRating(context)
              ],
            )
          ],
        );
      },
    );
  }

  Widget getTileView(
      {@required BuildContext context,
      @required VoidCallback showProductInfo,
      @required VoidCallback onAddToCart,
      @required VoidCallback onRemoveFromFavorites}) {
    return BaseProductTile(
        onClick: showProductInfo,
        inactiveMessage:
            product.amountAvailable == null || product.amountAvailable > 0
                ? null
                : 'Sorry, this item is currently sold out',
        bottomRoundButton: FloatingActionButton(
          backgroundColor: AppColors.red,
          onPressed: onAddToCart,
          child: Icon(
            FontAwesomeIcons.cartPlus,
            color: AppColors.white,
          ),
        ),
        image: product.mainImage.getView(),
        onRemove: onRemoveFromFavorites,
        specialMark: product.specialMark,
        mainContentBuilder: (context) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(product.title, style: Theme.of(context).textTheme.display1),
              Row(
                children: <Widget>[
                  _buildColor(Theme.of(context)),
                  Padding(
                    padding: EdgeInsets.all(AppSizes.linePadding),
                  ),
                  _buildSize(Theme.of(context)),
                ],
              ),
              Row(
                children: <Widget>[
                  product.buildPrice(Theme.of(context)),
                  product.discountPercent == null
                      ? Container()
                      : product.buildDiscountPrice(Theme.of(context)),
                  Padding(
                    padding: EdgeInsets.only(left: AppSizes.linePadding),
                  ),
                  product.buildRating(context)
                ],
              )
            ],
          );
        });
  }

  Widget _buildColor(ThemeData _theme) {
    return Row(
      children: <Widget>[
        Text('Color:', style: _theme.textTheme.body1.copyWith()),
        Padding(
          padding: EdgeInsets.only(left: AppSizes.linePadding),
        ),
        Text('Blue',
            style: _theme.textTheme.body1.copyWith(color: AppColors.black))
      ],
    );
  }

  Row _buildSize(ThemeData _theme) {
    return Row(
      children: <Widget>[
        Text('Size:', style: _theme.textTheme.body1.copyWith()),
        Padding(
          padding: EdgeInsets.only(left: AppSizes.linePadding),
        ),
        Text('L',
            style: _theme.textTheme.body1.copyWith(color: AppColors.black))
      ],
    );
  }
}
