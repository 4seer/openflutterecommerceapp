import 'package:flutter/material.dart';
import 'package:openflutterecommerce/config/theme.dart';
import 'package:openflutterecommerce/data/abstract/model/product_attribute.dart';

class VisualFilter extends StatelessWidget {
  final MapEntry<ProductAttribute, List<String>> attribute;
  final FilterChanged onFilterChanged;

  const VisualFilter(
    this.attribute,
    this.onFilterChanged, {
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (attribute == null) {
      return ListView.builder(
          scrollDirection: Axis.horizontal, itemBuilder: _blankChip);
    } else {
      List<Widget> widgetList = attribute?.key?.options
        ?.map((optionText) => Padding(
              padding: EdgeInsets.only(right: AppSizes.sidePadding / 2),
              child: ChoiceChip(
                selected: attribute.value.contains(optionText),
                padding: EdgeInsets.all(
                  AppSizes.linePadding,
                ),
                backgroundColor: Theme.of(context).primaryColor,
                label: Text(
                  optionText,
                  style: Theme.of(context).textTheme.button,
                ),
                onSelected: (value) {
                  onFilterChanged(optionText, value);
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

typedef FilterChanged = Function(String attribute, bool isSelected);
