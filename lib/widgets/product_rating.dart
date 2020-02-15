// Product rating element with number of reviews
// Author: openflutterproject@gmail.com
// Date: 2020-02-06

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:openflutterecommerce/config/theme.dart';

class OpenFlutterProductRating extends StatelessWidget {
  final double rating;
  final int ratingCount;
  final double iconSize;

  const OpenFlutterProductRating(
      {Key key, this.rating, this.ratingCount, this.iconSize})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    ThemeData _theme = Theme.of(context);
    return FittedBox(
        fit: BoxFit.scaleDown,
        child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                  padding: EdgeInsets.only(top: AppSizes.linePadding / 2),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Icon(
                          rating >= 1
                              ? FontAwesomeIcons.solidStar
                              : FontAwesomeIcons.star,
                          size: 24.0,
                          color: AppColors.orange,
                        ),
                        Icon(
                          rating >= 2
                              ? FontAwesomeIcons.solidStar
                              : FontAwesomeIcons.star,
                          color: AppColors.orange,
                          size: 24.0,
                        ),
                        Icon(
                          rating >= 3
                              ? FontAwesomeIcons.solidStar
                              : FontAwesomeIcons.star,
                          color: AppColors.orange,
                          size: 24.0,
                        ),
                        Icon(
                          rating >= 4
                              ? FontAwesomeIcons.solidStar
                              : FontAwesomeIcons.star,
                          color: AppColors.orange,
                          size: 24.0,
                        ),
                        Icon(
                          rating == 5
                              ? FontAwesomeIcons.solidStar
                              : FontAwesomeIcons.star,
                          color: AppColors.orange,
                          size: 24.0,
                        ),
                      ])),
              ratingCount > 0
                  ? Text('(' + ratingCount.toString() + ')',
                      style: _theme.textTheme.headline4.copyWith(fontSize: 14))
                  : Container(),
            ]));
  }
}
