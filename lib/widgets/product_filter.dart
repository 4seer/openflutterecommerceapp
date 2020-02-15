// Filter line above product list
// Author: openflutterproject@gmail.com
// Date: 2020-02-06

import 'package:flutter/material.dart';

enum SortBy{
  Popular,
  Newest,
  CustomerReview,
  PriceLowestToHigh,
  PriceHighestToLow
}

enum ProductView{
  ListView,
  CardView
}

class OpenFlutterProductFilter extends StatelessWidget {
  final double width;
  final double height;
  final SortBy sortBy;
  final ProductView productView;
  final Function onFilterClicked;
  final Function(SortBy) onSortClicked;
  final Function onChangeViewClicked;

  const OpenFlutterProductFilter({Key key, this.width, this.height, this.onFilterClicked, this.onSortClicked, this.onChangeViewClicked, this.sortBy, this.productView}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ThemeData _theme = Theme.of(context);
    final double iconSize = 24;
    final double thirdWidth = (width - iconSize*3)/3;
    return Container(
      color: _theme.primaryColorLight.withAlpha(5),
      child: Row(
        children: <Widget>[
          InkWell(
            onTap: ( () => {
              this.onFilterClicked()
            }),
            child: Row(
              children: <Widget> [
                Icon(Icons.filter_list,
                  size: iconSize),
                Container(
                  padding: EdgeInsets.only(left: iconSize/3),
                  width: thirdWidth,
                  child: Text('Filters',
                    style: _theme.textTheme.display1)
                )
              ]
            )
          ),
          InkWell(
            onTap: ( () => {
              this.onSortClicked(sortBy)
            }),
            child: Row(
              children: <Widget>[
                Icon(Icons.import_export,
                  size: iconSize),
                Container(
                  padding: EdgeInsets.only(left: iconSize/3),
                  width: thirdWidth*2,
                  child: Text(getSortTitle(sortBy),
                    style: _theme.textTheme.display1)
                )
              ]
            )
          ),
          InkWell(
            onTap: ( () => {
              this.onChangeViewClicked()
            }),
            child: Icon(
              productView == ProductView.ListView?
              Icons.view_module:
              Icons.view_list,
              size: iconSize
            )
          ),
        ],
      )
    );
  }

  String getSortTitle(SortBy sortBy){
    String title = 'Popular';
    switch(sortBy){
      case SortBy.Popular:
        title = 'Popular';
        break;

      case SortBy.Newest:
        title = 'Newest';
        break;
      case SortBy.CustomerReview:
        title = 'Customer Review';
        break;

      case SortBy.PriceLowestToHigh:
        title = 'Price: lowest to high';
        break;

      case SortBy.PriceHighestToLow:
        title = 'Price: highest to low';
        break;
    } 
    return title;
  }
}