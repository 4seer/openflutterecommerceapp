// Filter line above product list
// Author: openflutterproject@gmail.com
// Date: 2020-02-06

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:openflutterecommerce/config/routes.dart';
import 'package:openflutterecommerce/config/theme.dart';
import 'package:openflutterecommerce/data/model/filter_rules.dart';
import 'package:openflutterecommerce/data/model/sort_rules.dart';

class OpenFlutterViewOptions extends StatelessWidget {
  final SortRules sortRules;
  final FilterRules filterRules;
  final bool isListView;
  final Function(FilterRules) onFilterChanged;
  final Function(SortRules) onSortChanged;
  final Function onChangeViewClicked;

  const OpenFlutterViewOptions(
      {Key key,
      @required this.onFilterChanged,
      @required this.onSortChanged,
      @required this.onChangeViewClicked,
      @required this.sortRules,
      @required this.filterRules,
      this.isListView = true})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var _theme = Theme.of(context);
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
      child: Container(
        color: _theme.primaryColorLight.withAlpha(5),
        height: 32,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            InkWell(
                onTap: () {
                  _showFilterWindow(context);
                },
                child: Row(children: <Widget>[
                  Icon(Icons.filter_list),
                  Padding(
                    padding: EdgeInsets.only(left: 5),
                    child: Text('Filters', style: _theme.textTheme.bodyText1),
                  )
                ])),
            InkWell(
                onTap: () {
                  _showSortOptions(context);
                },
                child: Row(children: <Widget>[
                  Icon(Icons.import_export),
                  Container(
                    padding: EdgeInsets.only(left: 5),
                    child: Text(sortRules?.getSortTitle() ?? '', style: _theme.textTheme.bodyText1),
                  )
                ])),
            IconButton(
              padding: EdgeInsets.only(top: 0),
              onPressed: onChangeViewClicked,
              icon: Icon(
                isListView ? Icons.view_list : Icons.view_module,
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showFilterWindow(BuildContext context) {
    Navigator.of(context).pushNamed(OpenFlutterEcommerceRoutes.filters, arguments: filterRules);
  }

  void _showSortOptions(BuildContext context) {
    showModalBottomSheet(
        context: context,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(topLeft: Radius.circular(34.0), topRight: Radius.circular(34.0)),
        ),
        backgroundColor: Colors.white,
        builder: (context) {
          return Column(children: <Widget>[
            Container(
              padding: EdgeInsets.all(AppSizes.sidePadding),
              child: Container(
                width: 60,
                height: 6,
                decoration: BoxDecoration(
                  color: AppColors.darkGray,
                  borderRadius: BorderRadius.circular(AppSizes.imageRadius),
                ),
              ),
            ),
            Text('Sort by', style: Theme.of(context).textTheme.headline4),
            Padding(
              padding: EdgeInsets.only(top: AppSizes.sidePadding),
            ),
            ...sortRules.sortTextVariants
                .map((key, value) => MapEntry(
                      key,
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: AppSizes.sidePadding, vertical: AppSizes.linePadding),
                        alignment: Alignment.centerLeft,
                        color: sortRules.sortType == key ? AppColors.red : AppColors.white,
                        child: Row(
                          children: <Widget>[
                            Expanded(
                              child: InkWell(
                                child: Text(value,
                                    style: Theme.of(context).textTheme.headline4.copyWith(
                                        fontWeight: FontWeight.normal,
                                        color: sortRules.sortType == key ? AppColors.white : AppColors.black)),
                                onTap: () {
                                  onSortChanged(SortRules(
                                      sortOrder: sortRules.sortType == key
                                          ? (sortRules.sortOrder == SortOrder.FromLowestToHighest
                                              ? SortOrder.FromHighestToLowest
                                              : SortOrder.FromLowestToHighest)
                                          : sortRules.sortOrder,
                                      sortType: key));
                                  Navigator.pop(context);
                                },
                              ),
                            ),
                            IconButton(
                              icon: Icon(sortRules.sortOrder == SortOrder.FromHighestToLowest
                                  ? FontAwesomeIcons.sortAlphaUp
                                  : FontAwesomeIcons.sortAlphaDown),
                              color: sortRules.sortType == key
                                  ? Theme.of(context).primaryColor
                                  : Theme.of(context).backgroundColor,
                              onPressed: () {
                                onSortChanged(sortRules.copyWithChangedOrder());
                                Navigator.pop(context);
                              },
                            )
                          ],
                        ),
                      ),
                    ))
                .values
                .toList(growable: false),
          ]);
        });
  }
}
