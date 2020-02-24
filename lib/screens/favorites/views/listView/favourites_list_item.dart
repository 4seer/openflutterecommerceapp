// Favourites card in list of products and on Favourites screen
// Author: umair_adil@live.com
// Date: 2020-02-17

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:openflutterecommerce/config/theme.dart';
import 'package:openflutterecommerce/repos/models/product.dart';
import 'package:openflutterecommerce/screens/product_details/productDetails_screen.dart';
import 'package:openflutterecommerce/widgets/product_rating.dart';

class FavouritesListCard extends StatelessWidget {
  final Product product;
  final double width;

  const FavouritesListCard({Key key, this.product, this.width})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    ThemeData _theme = Theme.of(context);
    return GestureDetector(
        onTap: () => Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => ProductDetailsScreen())),
        child: Stack(
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(10.0),
              child: Container(
                decoration: new BoxDecoration(
                  borderRadius: BorderRadius.circular(AppSizes.imageRadius),
                  color: AppColors.white,
                ),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Stack(
                        children: <Widget>[
                          Container(
                              width: width * 0.30,
                              child: Container(
                                  height: width * 0.35,
                                  decoration: new BoxDecoration(
                                      borderRadius: BorderRadius.circular(
                                          AppSizes.imageRadius),
                                      image: new DecorationImage(
                                          fit: BoxFit.fill,
                                          image: AssetImage(product.image))),
                                  child: Container())),
                          buildTopLabel(product, _theme)
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0, top: 8.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(product.categoryTitle,
                                style: _theme.textTheme.bodyText1),
                            Padding(
                              padding: 
                                EdgeInsets.only(top: AppSizes.linePadding*2  ),
                              child: Text(product.title,
                                style: _theme.textTheme.headline6
                                    .copyWith(fontSize: 16))
                            ),
                            Padding(
                              padding: 
                                EdgeInsets.only(left: AppSizes.linePadding,
                                  top: AppSizes.linePadding*2  ),
                            ),
                            Row(
                              children: <Widget>[
                                buildColor(product, _theme),
                                Padding(
                                  padding: EdgeInsets.all(AppSizes.linePadding),
                                ),
                                buildSize(product, _theme),
                              ],
                            ),
                            Padding(
                              padding:
                                EdgeInsets.only(left: AppSizes.linePadding,
                                  top: AppSizes.linePadding*2  ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                buildPrice(product, _theme),
                                Padding(
                                  padding: EdgeInsets.only(
                                      left: AppSizes.sidePadding * 1.45),
                                ),
                                buildRating(product, _theme),
                              ],
                            )
                          ],
                        ),
                      )
                    ]),
              ),
            ),
            buildCartButton(product, _theme),
            buildRemoveButton(product)
          ],
        ));
  }

  buildPrice(Product product, ThemeData _theme) {
    double discountPrice = getDiscountPrice(product);
    return Row(
      children: <Widget>[
        Text("\$" + product.price.toStringAsFixed(0),
            style: _theme.textTheme.headline5.copyWith(
              decoration: discountPrice > 0
                  ? TextDecoration.lineThrough
                  : TextDecoration.none,
            )),
        Padding(
          padding: EdgeInsets.only(left: AppSizes.linePadding),
        ),
        discountPrice > 0
            ? Text("\$" + discountPrice.toStringAsFixed(0),
                style: _theme.textTheme.headline5
                    .copyWith(color: _theme.errorColor))
            : Container()
      ],
    );
  }

  buildRating(Product product, ThemeData _theme) {
    return Container(
      padding: EdgeInsets.only(
        top: AppSizes.linePadding, bottom: AppSizes.linePadding),
      child: OpenFlutterProductRating(
        rating: product.rating, 
        ratingCount: product.ratingCount,
        iconSize: 14
      )
    );
  }

  getDiscountPrice(Product product) {
    return (product.price * (100 - product.discountPercent) / 100)
        .roundToDouble();
  }

  buildTopLabel(Product product, ThemeData theme) {
    return Positioned(
      top: 5,
      left: AppSizes.sidePadding / 3,
      child: product.isNew
          ? Container(
              padding: EdgeInsets.all(AppSizes.linePadding * 1.5),
              decoration: new BoxDecoration(
                borderRadius: BorderRadius.circular(AppSizes.buttonRadius),
                color: AppColors.black,
              ),
              child: Text('NEW',
                  style: theme.textTheme.bodyText1.copyWith(
                      color: AppColors.white, fontWeight: FontWeight.bold)))
          : (product.discountPercent > 0
              ? Container(
                  padding: EdgeInsets.all(AppSizes.linePadding * 1.5),
                  decoration: new BoxDecoration(
                    borderRadius: BorderRadius.circular(AppSizes.buttonRadius),
                    color: theme.errorColor,
                  ),
                  child: Text(
                      "-" + product.discountPercent.toStringAsFixed(0) + "%",
                      style: theme.textTheme.bodyText1.copyWith(
                        color: AppColors.white,
                        fontWeight: FontWeight.bold,
                      )))
              : Container()),
    );
  }

  buildColor(Product product, ThemeData _theme) {
    return Row(
      children: <Widget>[
        Text("Color:", style: _theme.textTheme.headline5.copyWith()),
        Padding(
          padding: EdgeInsets.only(left: AppSizes.linePadding),
        ),
        Text("Blue",
            style: _theme.textTheme.headline5.copyWith(color: AppColors.black))
      ],
    );
  }

  buildSize(Product product, ThemeData _theme) {
    return Row(
      children: <Widget>[
        Text("Size:", style: _theme.textTheme.headline5.copyWith()),
        Padding(
          padding: EdgeInsets.only(left: AppSizes.linePadding),
        ),
        Text("L",
            style: _theme.textTheme.headline5.copyWith(color: AppColors.black))
      ],
    );
  }

  buildCartButton(Product product, ThemeData theme) {
    return Positioned(
      bottom: 0,
      right: AppSizes.sidePadding / 4,
      child: Container(
        height: 40.0,
        width: 40.0,
        padding: EdgeInsets.all(5.0),
        child: SvgPicture.asset("assets/icons/favourites/fav_cart.svg"),
    
        decoration: new BoxDecoration(
          borderRadius: BorderRadius.circular(AppSizes.buttonRadius),
          color: AppColors.red,
          /*image: new DecorationImage(
              fit: BoxFit.scaleDown,
              colorFilter:
                  ColorFilter.mode(Colors.white, BlendMode.srcIn),
              image: AssetImage("assets/icons/favourites/fav_cart.png",))*/
        )
      )
    );
  }

  buildRemoveButton(Product product) {
    return Positioned(
        top: 0,
        right: AppSizes.sidePadding / 3,
        child: IconButton(
          icon: Icon(Icons.close),
          color: AppColors.lightGray,
          onPressed: () {
            print("Remove from favourites clicked");
          },
        ));
  }
}
