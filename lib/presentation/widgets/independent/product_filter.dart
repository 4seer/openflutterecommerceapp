// Filter line above product list
// Author: openflutterproject@gmail.com
// Date: 2020-02-06

import 'package:flutter/material.dart';
import 'package:openflutterecommerce/data/abstract/model/sort_rules.dart';

enum ProductView { ListView, CardView }

class OpenFlutterProductFilter extends StatelessWidget {
  final double width;
  final double height;
  final SortRules selectedSortRules;
  final ProductView productView;
  final Function onFilterClicked;
  final Function(SortRules) onSortClicked;
  final Function onChangeViewClicked;

  const OpenFlutterProductFilter(
      {Key key,
      this.width,
      this.height,
      this.onFilterClicked,
      this.onSortClicked,
      this.onChangeViewClicked,
      this.selectedSortRules,
      this.productView})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var _theme = Theme.of(context);
    var iconSize = 24.0;
    var thirdWidth = (width - iconSize * 3) / 3;
    return Container(
        color: _theme.primaryColorLight.withAlpha(5),
        child: Row(
          children: <Widget>[
            InkWell(
                onTap: (() => {onFilterClicked()}),
                child: Row(children: <Widget>[
                  Icon(Icons.filter_list, size: iconSize),
                  Container(
                    padding: EdgeInsets.only(left: iconSize / 3),
                    width: thirdWidth,
                    child: Text('Filters', style: _theme.textTheme.body1),
                  )
                ])),
            InkWell(
                onTap: (() => {onSortClicked(selectedSortRules)}),
                child: Row(children: <Widget>[
                  Icon(Icons.import_export, size: iconSize),
                  Container(
                    padding: EdgeInsets.only(left: iconSize / 3),
                    width: thirdWidth * 2,
                    child: Text(selectedSortRules.getSortTitle(),
                        style: _theme.textTheme.body1),
                  )
                ])),
            InkWell(
                onTap: (() => {onChangeViewClicked()}),
                child: Icon(
                    productView == ProductView.ListView
                        ? Icons.view_module
                        : Icons.view_list,
                    size: iconSize)),
          ],
        ));
  }
}
