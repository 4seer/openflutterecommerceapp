// Product card in list of products and on home screen
// Author: openflutterproject@gmail.com
// Date: 2020-02-06

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:openflutterecommerce/config/theme.dart';
import 'package:openflutterecommerce/data/fake_repositories/models/product.dart';
import 'package:openflutterecommerce/presentation/features/product_details/product_screen.dart';
import 'package:openflutterecommerce/presentation/widgets/widgets.dart';

class OpenFlutterProductCard extends StatelessWidget {
  final Product product;
  final double width;
  final double height;
  final showCartButton;
  final showRemoveButton;
  final showColorAndSize;
  final showRatingInLine;
  final showTopLabel;
  final showCategoryFirst;

  const OpenFlutterProductCard(
      {Key key,
      this.product,
      this.width,
      this.height,
      this.showCartButton = false,
      this.showRemoveButton = false,
      this.showColorAndSize = false,
      this.showRatingInLine = false,
      this.showTopLabel = false,
      this.showCategoryFirst = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    ThemeData _theme = Theme.of(context);
    return GestureDetector(
      onTap: () => navigateToProductDetailsScreen(context),
      child: Stack(
        children: <Widget>[
          Container(
            //height: height*2,
            padding: EdgeInsets.symmetric(
                horizontal: AppSizes.widgetSidePadding / 2),
            width: width,
            child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    width: width + AppSizes.widgetSidePadding,
                    child: Container(
                      height: width * 1.13,
                      decoration: new BoxDecoration(
                          borderRadius:
                              BorderRadius.circular(AppSizes.imageRadius),
                          image: new DecorationImage(
                              fit: BoxFit.fill,
                              image: AssetImage(product.image))),
                      child: Container(),
                    ),
                  ),
                  buildRating(context, product),
                  Text(product.categoryTitle,
                      style: _theme.textTheme.bodyText1),
                  Text(product.title, style: _theme.textTheme.headline3),
                  Visibility(
                    child: Row(
                      children: <Widget>[
                        buildColor(product, _theme),
                        Padding(
                          padding: EdgeInsets.all(AppSizes.linePadding),
                        ),
                        buildSize(product, _theme),
                      ],
                    ),
                    visible: showColorAndSize,
                  ),
                  buildPrice(product, _theme),
                ]),
          ),
          buildTopLabel(product, _theme),
          Visibility(
            child: buildCartButton(product, _theme),
            visible: showCartButton,
          ),
          Visibility(
            child: buildRemoveButton(product),
            visible: showRemoveButton,
          )
        ],
      ),
    );
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

  buildRating(BuildContext context, Product product) {
    return Container(
        width: width - 20,
        padding: EdgeInsets.only(
            top: AppSizes.linePadding, bottom: AppSizes.linePadding),
        child: OpenFlutterProductRating(
          rating: product.rating,
          ratingCount: product.ratingCount,
          alignment: MainAxisAlignment.start,
          iconSize: 12,
          labelFontSize: 12,
        ));
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
                  style: theme.textTheme.bodyText1.copyWith(
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
                      style: theme.textTheme.bodyText1.copyWith(
                        color: AppColors.white,
                        fontWeight: FontWeight.bold,
                      )))
              : Container()),
    );
  }

  void navigateToProductDetailsScreen(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => ProductDetailsScreen(),
    ));
  }

  buildColor(Product product, ThemeData _theme) {
    return Row(
      children: <Widget>[
        Text("Color:", style: _theme.textTheme.bodyText1.copyWith()),
        Padding(
          padding: EdgeInsets.only(left: AppSizes.linePadding),
        ),
        Text("Blue",
            style: _theme.textTheme.bodyText1.copyWith(color: AppColors.black))
      ],
    );
  }

  buildSize(Product product, ThemeData _theme) {
    return Row(
      children: <Widget>[
        Text("Size:", style: _theme.textTheme.bodyText1.copyWith()),
        Padding(
          padding: EdgeInsets.only(left: AppSizes.linePadding),
        ),
        Text("L",
            style: _theme.textTheme.bodyText1.copyWith(color: AppColors.black))
      ],
    );
  }

  buildCartButton(Product product, ThemeData theme) {
    return Positioned(
        bottom: height * 0.22,
        right: AppSizes.sidePadding / 3,
        child: Container(
            height: 40.0,
            width: 40.0,
            padding: EdgeInsets.all(5.0),
            child: SvgPicture.asset("assets/icons/favourites/fav_cart.svg"),
            decoration: new BoxDecoration(
              borderRadius: BorderRadius.circular(AppSizes.buttonRadius),
              color: AppColors.red,
            )));
  }

  buildRemoveButton(Product product) {
    return Positioned(
        top: AppSizes.sidePadding / 2 - 10,
        right: AppSizes.sidePadding / 2 - 10,
        child: IconButton(
          icon: Icon(Icons.close),
          color: AppColors.lightGray,
          onPressed: () {
            print("Remove from favourites clicked");
          },
        ));
  }
}
