// Product rating element with number of reviews
// Author: openflutterproject@gmail.com
// Date: 2020-02-06

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:openflutterecommerce/config/theme.dart';

class OpenFlutterProductRating extends StatelessWidget {
  final double rating;
  final int ratingCount;
  final double iconSize;

  const OpenFlutterProductRating({Key key, this.rating, this.ratingCount, this.iconSize}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    ThemeData _theme = Theme.of(context);
    return  Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          padding: EdgeInsets.only(top: AppSizes.linePadding/2),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SvgPicture.asset("assets/icons/products/star" + 
                (rating>1? "_fav":"")  + ".svg",
                width: iconSize, height: iconSize),
              SvgPicture.asset("assets/icons/products/star" + 
                (rating>2? "_fav":"")  + ".svg",
                width: iconSize, height: iconSize),
              SvgPicture.asset("assets/icons/products/star" + 
                (rating>3? "_fav":"")  + ".svg",
                width: iconSize, height: iconSize),
              SvgPicture.asset("assets/icons/products/star" + 
                (rating>4? "_fav":"")  + ".svg",
                width: iconSize, height: iconSize),
              SvgPicture.asset("assets/icons/products/star" + 
                (rating>4? "_fav":"")  + ".svg",
                width: iconSize, height: iconSize),
            ]
          )
        ),
        ratingCount>0?
          Text('('+ratingCount.toString()+')',
            style: _theme.textTheme.display1.copyWith(
              fontSize: 14)
          )
        : Container(),
      ]
    );
  }
}