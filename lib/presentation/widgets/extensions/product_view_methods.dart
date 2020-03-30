import 'dart:math';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:openflutterecommerce/config/theme.dart';
import 'package:openflutterecommerce/data/abstract/model/product.dart';
import 'package:openflutterecommerce/presentation/widgets/independent/product_rating.dart';

class ProductViewMethods {
  static Widget getFavoritesButton(
      Product product, VoidCallback onFavoritesClick) {
    return FloatingActionButton(
      heroTag: Random().nextInt(
          1000000), //TODO make sure that there is only one product with specified id on screen and use it as a tag
      mini: true,
      backgroundColor: AppColors.white,
      onPressed: onFavoritesClick,
      child: product.isFavorite
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

  static Widget buildPrice(Product product, ThemeData _theme) {
    final discountPrice = product.discountPrice;
    return Text(
      '\$' + product.price.toStringAsFixed(0),
      style: _theme.textTheme.display3.copyWith(
        decoration: discountPrice > 0
            ? TextDecoration.lineThrough
            : TextDecoration.none,
      ),
    );
  }

  static Widget buildRating(BuildContext context, Product product) {
    return Container(
        padding: EdgeInsets.only(
            top: AppSizes.linePadding, bottom: AppSizes.linePadding),
        child: OpenFlutterProductRating(
          rating: product.averageRating,
          ratingCount: product.ratingCount,
          alignment: MainAxisAlignment.start,
          iconSize: 12,
          labelFontSize: 12,
        ));
  }

  static Widget buildDiscountPrice(double discountPrice, ThemeData _theme) {
    return Text('\$' + discountPrice.toStringAsFixed(0),
        style: _theme.textTheme.display3.copyWith(color: _theme.errorColor));
  }

  static Widget buildColor(Product product, ThemeData _theme) {
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

  static Row buildSize(Product product, ThemeData _theme) {
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
