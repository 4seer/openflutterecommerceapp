import 'package:flutter/material.dart';
import 'package:openflutterecommerce/config/theme.dart';

import 'widgets.dart';

class OpenFlutterSortBy extends StatelessWidget {
  final Function(SortBy) onSelect;
  final SortBy currentSortBy;

  const OpenFlutterSortBy({Key key, this.onSelect, this.currentSortBy})
      : super(key: key);

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
    var sortByVariantTitles = <String>[
      'Popular',
      'Newest',
      'Customer Review',
      'Price: lowest to hight',
      'Price: highest to low'
    ];
    var sortByVariants = <SortBy>[
      SortBy.Popular,
      SortBy.Newest,
      SortBy.CustomerReview,
      SortBy.PriceLowestToHigh,
      SortBy.PriceHighestToLow
    ];
    var widgets = <Widget>[];
    for (var i = 0;
        i < sortByVariants.length && i < sortByVariantTitles.length;
        i++) {
      widgets.add(
        OpenFlutterClickableLine(
          height: 58,
          width: width,
          title: sortByVariantTitles[i],
          sortBy: sortByVariants[i],
          backgroundColor:
              sortByVariants[i] == currentSortBy ? _theme.accentColor : null,
          textColor:
              sortByVariants[i] == currentSortBy ? AppColors.white : null,
          onTap: ((SortBy newSortBy) => {onSelect(sortByVariants[i])}),
        ),
      );
    }
    return widgets;
  }
}
