import 'package:flutter/material.dart';
import 'package:openflutterecommerce/config/theme.dart';
import 'package:openflutterecommerce/data/abstract/model/sort_rules.dart';

class OpenFlutterClickableLine extends StatelessWidget {
  final double width;
  final double height;
  final String title;
  final SortRules sortRules;
  final Color backgroundColor;
  final Color textColor;
  final Function(SortRules) onTap;

  const OpenFlutterClickableLine(
      {Key key,
      @required this.width,
      @required this.height,
      @required this.title,
      @required this.onTap,
      @required this.sortRules,
      this.backgroundColor,
      this.textColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var _theme = Theme.of(context);
    return InkWell(
        onTap: (() => {onTap(sortRules)}),
        child: Container(
            padding: EdgeInsets.symmetric(
                horizontal: AppSizes.sidePadding,
                vertical: AppSizes.linePadding),
            alignment: Alignment.centerLeft,
            height: height,
            width: width,
            color: backgroundColor,
            child: Text(title,
                style: _theme.textTheme.display1.copyWith(
                    fontWeight: FontWeight.normal, color: textColor))));
  }
}
