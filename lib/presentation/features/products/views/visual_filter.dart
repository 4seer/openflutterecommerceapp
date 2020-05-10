import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:openflutterecommerce/config/theme.dart';
import 'package:openflutterecommerce/data/model/hashtag.dart';

class VisualFilter extends StatelessWidget {
  final List<HashTag> hashTags;
  final HashMap<HashTag, bool> selecteHashTags;
  final FilterChanged onFilterChanged;

  const VisualFilter(
    this.hashTags,
    this.selecteHashTags,
    this.onFilterChanged, {
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (hashTags == null) {
      return ListView.builder(
          scrollDirection: Axis.horizontal, itemBuilder: _blankChip);
    } else {
      List<Widget> widgetList = hashTags
        ?.map((optionHashTag) => 
          Padding(
            padding: EdgeInsets.only(right: AppSizes.sidePadding / 2),
            child: ChoiceChip(
              selected: selecteHashTags!=null ? 
                selecteHashTags[optionHashTag] ?? false : false,
              padding: EdgeInsets.all(
                AppSizes.linePadding,
              ),
              backgroundColor: Theme.of(context).primaryColor,
              selectedColor: Theme.of(context).accentColor,
              label: Text(
                optionHashTag.title,
                style: Theme.of(context).textTheme.button,
              ),
              onSelected: (value) {
                onFilterChanged(optionHashTag, value);
              },
            ),
          ))
        ?.toList(growable: false) ?? [];
        
      return ListView(
        scrollDirection: Axis.horizontal,
        children: <Widget>[
              SizedBox(
                width: 16,
              )
            ] +
            widgetList
            +
            [
              SizedBox(
                width: 16,
              )
            ],
      );
    }
  }

  Widget _blankChip(BuildContext context, _) {
    return Padding(
        padding: EdgeInsets.only(right: AppSizes.sidePadding / 2),
        child: Chip(
          padding: EdgeInsets.all(
            AppSizes.linePadding,
          ),
          backgroundColor: Theme.of(context).backgroundColor,
          label: Text(
            '        ',
            style: Theme.of(context).textTheme.button,
          ),
        ));
  }
}

typedef FilterChanged = Function(HashTag attribute, bool isSelected);
