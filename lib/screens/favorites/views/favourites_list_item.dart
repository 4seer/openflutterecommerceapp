// Favourites card in list of products and on Favourites screen
// Author: umair_adil@live.com
// Date: 2020-02-17

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:openflutterecommerce/config/theme.dart';
import 'package:openflutterecommerce/repos/models/product.dart';
import 'package:openflutterecommerce/widgets/product_rating.dart';

class FavouritesListCard extends StatelessWidget {
  final Product product;
  final double width;
  final double height;

  const FavouritesListCard({Key key, this.product, this.width, this.height})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    ThemeData _theme = Theme.of(context);
    return Stack(
      children: <Widget>[
        Container(
          padding: EdgeInsets.all(8.0),
          child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                    width: width * 0.85,
                    child: Container(
                        height: width * 0.85,
                        decoration: new BoxDecoration(
                            borderRadius:
                                BorderRadius.circular(AppSizes.imageRadius),
                            image: new DecorationImage(
                                fit: BoxFit.fill,
                                image: AssetImage(product.image))),
                        child: Container())),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(product.categoryTitle,
                          style: _theme.textTheme.display1),
                      Text(product.title, style: _theme.textTheme.display3),
                      Padding(
                        padding: EdgeInsets.all(AppSizes.linePadding),
                      ),
                      Row(
                        children: <Widget>[
                          buildColor(product, _theme),
                          buildSize(product, _theme),
                        ],
                      ),
                      Padding(
                        padding: EdgeInsets.all(AppSizes.linePadding),
                      ),
                      Row(
                        children: <Widget>[
                          buildPrice(product, _theme),
                          Padding(
                            padding: EdgeInsets.all(AppSizes.linePadding),
                          ),
                          buildRating(product, _theme),
                        ],
                      )
                    ],
                  ),
                )
              ]),
        ),
        buildTopLabel(product, _theme),
        buildCartButton(product, _theme),
      ],
    );
  }

  buildPrice(Product product, ThemeData _theme) {
    double discountPrice = getDiscountPrice(product);
    return Row(
      children: <Widget>[
        Text("\$" + product.price.toStringAsFixed(0),
            style: _theme.textTheme.display4.copyWith(
              decoration: discountPrice > 0
                  ? TextDecoration.lineThrough
                  : TextDecoration.none,
            )),
        Padding(
          padding: EdgeInsets.only(left: AppSizes.linePadding),
        ),
        discountPrice > 0
            ? Text("\$" + discountPrice.toStringAsFixed(0),
                style: _theme.textTheme.display4
                    .copyWith(color: _theme.errorColor))
            : Container()
      ],
    );
  }

  buildRating(Product product, ThemeData _theme) {
    return Container(
        width: width - 20,
        padding: EdgeInsets.only(
            top: AppSizes.linePadding, bottom: AppSizes.linePadding),
        child: OpenFlutterProductRating(
            rating: product.rating, ratingCount: product.ratingCount));
  }

  getDiscountPrice(Product product) {
    return (product.price * (100 - product.discountPercent) / 100)
        .roundToDouble();
  }

  buildTopLabel(Product product, ThemeData theme) {
    return Positioned(
      top: 5,
      left: 5 + AppSizes.sidePadding / 2,
      child: product.isNew
          ? Container(
              padding: EdgeInsets.all(AppSizes.linePadding * 1.5),
              decoration: new BoxDecoration(
                borderRadius: BorderRadius.circular(AppSizes.imageRadius),
                color: AppColors.black,
              ),
              child: Text('NEW',
                  style: theme.textTheme.display1.copyWith(
                      color: AppColors.white, fontWeight: FontWeight.bold)))
          : (product.discountPercent > 0
              ? Container(
                  padding: EdgeInsets.all(AppSizes.linePadding * 2),
                  decoration: new BoxDecoration(
                    borderRadius: BorderRadius.circular(AppSizes.imageRadius),
                    color: theme.errorColor,
                  ),
                  child: Text(
                      "-" + product.discountPercent.toStringAsFixed(0) + "%",
                      style: theme.textTheme.display1.copyWith(
                        color: AppColors.white,
                        fontWeight: FontWeight.bold,
                      )))
              : Container()),
    );
  }

  buildColor(Product product, ThemeData _theme) {
    return Row(
      children: <Widget>[
        Text("Color:", style: _theme.textTheme.display4.copyWith()),
        Padding(
          padding: EdgeInsets.only(left: AppSizes.linePadding),
        ),
        Text("Blue",
            style:
                _theme.textTheme.display4.copyWith(color: _theme.accentColor))
      ],
    );
  }

  buildSize(Product product, ThemeData _theme) {
    return Row(
      children: <Widget>[
        Text("Size:", style: _theme.textTheme.display4.copyWith()),
        Padding(
          padding: EdgeInsets.only(left: AppSizes.linePadding),
        ),
        Text("L",
            style:
                _theme.textTheme.display4.copyWith(color: _theme.accentColor))
      ],
    );
  }

  buildCartButton(Product product, ThemeData theme) {
    return Positioned(
        bottom: 5,
        right: 5 + AppSizes.sidePadding / 2,
        child: Container(
          height: 30.0,
            width: 30.0,
            padding: EdgeInsets.all(15.0),
            decoration: new BoxDecoration(
                borderRadius: BorderRadius.circular(AppSizes.imageRadius),
                color: AppColors.red,
                image: new DecorationImage(
                    fit: BoxFit.scaleDown,
                    colorFilter: ColorFilter.mode(Colors.white, BlendMode.srcIn),
                    image: AssetImage("assets/icons/favourites/bag.png")))));
  }
}
