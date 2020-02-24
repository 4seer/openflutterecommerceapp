// Product list view element
// Author: openflutterproject@gmail.com
// Date: 2020-02-06

import 'package:flutter/material.dart';
import 'package:openflutterecommerce/config/theme.dart';
import 'package:openflutterecommerce/repos/models/product.dart';
import 'package:openflutterecommerce/screens/product_details/productDetails_screen.dart';
import 'package:openflutterecommerce/widgets/favourite_button.dart';
import 'package:openflutterecommerce/widgets/product_rating.dart';

class OpenFlutterProductTile extends StatelessWidget {
  final Product product;
  final double height;
  final double width;
  final Function(bool) onFavClicked;

  const OpenFlutterProductTile({Key key, this.product, this.height, this.width, this.onFavClicked}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ThemeData _theme = Theme.of(context);
    return Padding(
      padding: EdgeInsets.only(bottom: 10),
      child: Stack(
        children: <Widget>[
          GestureDetector(
            onTap:()=>Navigator.of(context).push(MaterialPageRoute(builder:(context)=>ProductDetailsScreen())) ,
            child: Padding(
              padding: EdgeInsets.only(bottom: AppSizes.sidePadding),
              child: Container(
                  height: height,
                  decoration: new BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.circular(AppSizes.imageRadius),
                  ),
                  child: Row(
                      children: <Widget>[
                        Container(
                            width: 100,
                            alignment: Alignment.centerLeft,
                            child: Image(image: AssetImage(product.image))
                        ),
                        Container(
                          padding: EdgeInsets.only(top: AppSizes.linePadding*2),
                          alignment: Alignment.topLeft,
                          width: this.width - 100,
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children:<Widget>[
                                Text(product.title,
                                    style: _theme.textTheme.headline3),
                                Text(product.categoryTitle,
                                    style: _theme.textTheme.bodyText1),
                                Padding(padding: EdgeInsets.only(top: AppSizes.linePadding)),
                                OpenFlutterProductRating(
                                    rating: product.rating,
                                    ratingCount: product.ratingCount,
                                    iconSize: 14,
                                    alignment: MainAxisAlignment.start,
                                ),
                                Padding(padding: EdgeInsets.only(top: AppSizes.linePadding)),
                                Text('\$'+product.price.toStringAsFixed(2),
                                    style: _theme.textTheme.headline5.copyWith(
                                        color: _theme.primaryColor,
                                        fontWeight: FontWeight.bold
                                    )
                                )
                              ]
                          ),
                        ),
                      ]
                  )
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            right: 0,
            child: OpenFlutterFavouriteButton(favourite: product.favorite, setFavourite: this.onFavClicked,size: 36.0,iconSize: 12.0,)
          ),
        ]
      )
    );
  }
}

//
//InkWell(
//onTap: ( () => {
//this.onFavClicked(!product.favorite)
//}),
//child: Container(
//decoration: BoxDecoration(
//color: AppColors.white,
//boxShadow: [
//BoxShadow(color: _theme.primaryColorLight,
//blurRadius: 10),
//],
//borderRadius: BorderRadius.all(Radius.circular(18)),
//),
//height: 36,
//width: 36,
//child: product.favorite ?
//Icon(Icons.favorite, size: 12,
//color: _theme.accentColor) :
//Icon(Icons.favorite_border, size: 12,
//color: _theme.primaryColorLight)
//)
//)