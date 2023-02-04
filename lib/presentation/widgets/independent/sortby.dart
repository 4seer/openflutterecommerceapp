import 'package:flutter/material.dart';
import 'package:openflutterecommerce/config/theme.dart';
import 'package:openflutterecommerce/data/model/sort_rules.dart';

import '../widgets.dart';

class OpenFlutterSortBy extends StatelessWidget {
  final Function(SortRules) onSelect;
  final SortRules currentSortBy;

  const OpenFlutterSortBy(
      {required this.onSelect, required this.currentSortBy});

  @override
  Widget build(BuildContext context) {
    var _theme = Theme.of(context);
    var fullWidth = MediaQuery.of(context).size.width;
    return OpenFlutterBottomPopup(
        title: 'Sort By',
        child: Container(
            padding: EdgeInsets.only(top: AppSizes.sidePadding),
            child: Column(children: buildSortBy(fullWidth, _theme))));
  }

  List<Widget> buildSortBy(double width, ThemeData _theme) {
    return SortRules.options
        .map((rule) => OpenFlutterClickableLine(
              height: 58,
              width: width,
              title: rule.getSortTitle(),
              sortRules: rule,
              backgroundColor:
                  rule == currentSortBy ? _theme.accentColor : _theme.accentColor,
              textColor: rule == currentSortBy ? AppColors.white : AppColors.white,
              onTap: ((rule) => {onSelect(rule)}),
            ))
        .toList(growable: false);
  }
}
