// Category element in list view
// Author: openflutterproject@gmail.com
// Date: 2020-02-06

import 'package:flutter/material.dart';
import 'package:openflutterecommerce/config/theme.dart';
import 'package:openflutterecommerce/data/abstract/model/category.dart';

class OpenFlutterCatregoryListElement extends StatelessWidget {
  final Category category;

  const OpenFlutterCatregoryListElement({Key key, this.category})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var _theme = Theme.of(context);
    return Container(
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.only(
            top: AppSizes.sidePadding,
            bottom: AppSizes.sidePadding,
            left: AppSizes.sidePadding * 2,
            right: AppSizes.sidePadding),
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(color: _theme.primaryColorLight, width: 0.4),
          ),
        ),
        child: Text(category.name,
            style: _theme.textTheme.display1
                .copyWith(fontWeight: FontWeight.normal)));
  }
}
