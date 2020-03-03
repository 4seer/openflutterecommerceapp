// Category Tile with image
// Author: openflutterproject@gmail.com
// Date: 2020-02-06

import 'package:flutter/material.dart';
import 'package:openflutterecommerce/config/theme.dart';
import 'package:openflutterecommerce/data/fake_repositories/models/category.dart';

class OpenFlutterCategoryTile extends StatelessWidget {
  final Category category;
  final double height;
  final double width;

  const OpenFlutterCategoryTile(
      {Key key, this.category, this.height, this.width})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    ThemeData _theme = Theme.of(context);
    return Padding(
        padding: EdgeInsets.only(bottom: AppSizes.sidePadding),
        child: Container(
            padding: EdgeInsets.only(left: AppSizes.sidePadding),
            height: height,
            decoration: new BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(AppSizes.imageRadius),
            ),
            child: Row(
              children: <Widget>[
                Container(
                    alignment: Alignment.centerLeft,
                    width: this.width - 200,
                    child: Text(category.title,
                        style: _theme.textTheme.headline3)),
                Container(
                    width: 200,
                    alignment: Alignment.centerRight,
                    child: Image(image: AssetImage(category.image)))
              ],
            )));
  }
}
