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
    ThemeData _theme = Theme.of(context);
    double fullWidth = MediaQuery.of(context).size.width;
    return OpenFlutterBottomPopup(
        title: 'Sort By',
        child: Container(
            padding: EdgeInsets.only(top: AppSizes.sidePadding),
            child: Column(children: buildSortBy(fullWidth, _theme))));
  }

  List<Widget> buildSortBy(double width, ThemeData _theme) {
    List<String> sortByVariantTitles = [
      "Popular",
      "Newest",
      "Customer Review",
      "Price: lowest to hight",
      "Price: highest to low"
    ];
    List<SortBy> sortByVariants = [
      SortBy.Popular,
      SortBy.Newest,
      SortBy.CustomerReview,
      SortBy.PriceLowestToHigh,
      SortBy.PriceHighestToLow
    ];
    List<Widget> widgets = List<Widget>();
    for (int i = 0;
        i < sortByVariants.length && i < sortByVariantTitles.length;
        i++) {
      widgets.add(OpenFlutterClickableLine(
          height: 58,
          width: width,
          title: sortByVariantTitles[i],
          sortBy: sortByVariants[i],
          backgroundColor:
              sortByVariants[i] == currentSortBy ? _theme.accentColor : null,
          textColor:
              sortByVariants[i] == currentSortBy ? AppColors.white : null,
          onTap: ((SortBy newSortBy) => {this.onSelect(sortByVariants[i])})));
    }
    return widgets;
  }
}
