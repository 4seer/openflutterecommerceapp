import 'package:flutter/material.dart';
import 'package:openflutterecommerce/config/theme.dart';

class OpenFlutterSummaryLine extends StatelessWidget {
  final String title;
  final String summary;

  const OpenFlutterSummaryLine({Key key, this.title, this.summary}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width - AppSizes.sidePadding*2;
    final ThemeData _theme = Theme.of(context);
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: AppSizes.sidePadding,
        vertical: AppSizes.linePadding),
      child: Row(children: <Widget>[
        Container(
          width: width/2,
          child: Text(title,
            style: _theme.textTheme.headline5
          )
        ),
        Container(
          alignment: Alignment.centerRight,
          width: width/2,
          child: Text(summary,
            style: _theme.textTheme.headline5.copyWith(
              fontWeight: FontWeight.bold,
              color: _theme.primaryColor
            )
          )
        ),
      ],)
    );
  }
}