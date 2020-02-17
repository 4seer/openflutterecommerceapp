// Product card in list of products and on home screen
// Author: openflutterproject@gmail.com
// Date: 2020-02-06

import 'package:flutter/material.dart';
import 'package:openflutterecommerce/config/theme.dart';
import 'package:openflutterecommerce/repos/models/product.dart';
import 'package:openflutterecommerce/widgets/product_rating.dart';

class OpenFlutterProductCard extends StatelessWidget {
  final Product product;
  final double width;
  final double height;

  const OpenFlutterProductCard({Key key, this.product, this.width, this.height}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ThemeData _theme = Theme.of(context);
    return Stack(
      children: <Widget>[
        Container(
          //height: height*2,
          padding: EdgeInsets.symmetric(horizontal: AppSizes.widgetSidePadding/2),
          width: width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                width:  width+AppSizes.widgetSidePadding,
                child: Container(
                  height: width*1.13,
                  decoration: new BoxDecoration(
                    borderRadius: BorderRadius.circular(AppSizes.imageRadius),
                    image: new DecorationImage(
                      fit: BoxFit.fill,
                      image: AssetImage(product.image)
                    )
                  ),
                  child: Container()
                )
              ),
              buildRating(product, _theme),
              Text(product.categoryTitle,
                style: _theme.textTheme.bodyText1),
              Text(product.title,
                style: _theme.textTheme.headline3),
              buildPrice(product, _theme),
            ]
          ),
        ),
        buildTopLabel(product, _theme),
      ],
    );
  }
  buildPrice(Product product, ThemeData _theme){
    double discountPrice = getDiscountPrice(product);
    return Row(
      children: <Widget>[
        Text("\$" + product.price.toStringAsFixed(0),
          style: _theme.textTheme.headline5.copyWith(
            decoration: discountPrice>0?
              TextDecoration.lineThrough: TextDecoration.none,
          )
        ),
        Padding(padding: EdgeInsets.only(left: AppSizes.linePadding),),
        discountPrice>0?
          Text("\$" + discountPrice.toStringAsFixed(0),
            style: _theme.textTheme.headline5.copyWith(
              color: _theme.errorColor
            )):
        Container()
      ],
    );
  }
  buildRating(Product product, ThemeData _theme){
    return Container(
      width: width-20,
      padding: EdgeInsets.only(top: AppSizes.linePadding,
        bottom: AppSizes.linePadding),
      child: OpenFlutterProductRating(
        rating: product.rating,
        ratingCount: product.ratingCount
      )
    );
  }
  getDiscountPrice(Product product){
    return (product.price * (100 - product.discountPercent)/100)  .roundToDouble();
  }
  buildTopLabel(Product product, ThemeData theme) {
    return Positioned(
      top: 5,
      left: 5 + AppSizes.sidePadding/2,
      child: product.isNew ?
        Container(
          padding: EdgeInsets.all(AppSizes.linePadding*1.5),
          decoration: new BoxDecoration(
            borderRadius: BorderRadius.circular(AppSizes.imageRadius),
            color: AppColors.black,
          ),
          child: Text('NEW',
            style: theme.textTheme.bodyText1.copyWith(
              color: AppColors.white,
              fontWeight: FontWeight.bold
            )
          )
        ):
        (product.discountPercent>0?
          Container(
            padding: EdgeInsets.all(AppSizes.linePadding*2),
            decoration: new BoxDecoration(
              borderRadius: BorderRadius.circular(AppSizes.imageRadius),
              color: theme.errorColor,
            ),
            child: Text("-" + product.discountPercent.toStringAsFixed(0)+"%",
              style: theme.textTheme.bodyText1.copyWith(
                color: AppColors.white,
                fontWeight: FontWeight.bold,
              )
            )
          ):Container()
        ),
    );
  }
}