import 'package:flutter/material.dart';
import 'package:openflutterecommerce/config/theme.dart';

import '../widgets.dart';

class OpenFlutterPriceRangeSlider extends StatelessWidget {
  final double max;
  final double min;
  final double start;
  final double end;
  final String label;
  final Function(RangeValues value) onChanged;

  const OpenFlutterPriceRangeSlider(
      {Key key,
      @required this.max,
      @required this.min,
      @required this.label,
      @required this.onChanged,
      @required this.start,
      @required this.end})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width - AppSizes.sidePadding * 2;
    var _theme = Theme.of(context);
    return Column(children: <Widget>[
      OpenFlutterBlockSubtitle(title: label, width: width),
      Padding(
        padding: EdgeInsets.only(bottom: AppSizes.sidePadding),
      ),
      Container(
          padding: EdgeInsets.symmetric(vertical: AppSizes.sidePadding),
          color: AppColors.white,
          child: Column(children: <Widget>[
            Container(
              padding: EdgeInsets.symmetric(horizontal: AppSizes.sidePadding),
              child: Row(
                children: <Widget>[
                  Container(
                      width: width / 2,
                      alignment: Alignment.centerLeft,
                      child: Text('\$' + start.toStringAsFixed(0),
                          style: _theme.textTheme.headline5
                              .copyWith(color: _theme.primaryColor))),
                  Container(
                      width: width / 2,
                      alignment: Alignment.centerRight,
                      child: Text('\$' + end.toStringAsFixed(0),
                          style: _theme.textTheme.headline5
                              .copyWith(color: _theme.primaryColor)))
                ],
              ),
            ),
            RangeSlider(
              divisions: max.toInt() - min.toInt(),
              activeColor: _theme.accentColor,
              inactiveColor: _theme.primaryColorLight,
              max: max,
              min: min,
              onChangeStart: onChanged,
              onChangeEnd: onChanged,
              values: RangeValues(start, end),
              onChanged: onChanged,
            )
          ]))
    ]);
  }
}
