import 'package:flutter/material.dart';
import 'package:openflutterecommerce/config/theme.dart';
import 'package:openflutterecommerce/widgets/product_filter.dart';

class OpenFlutterClickableLine extends StatelessWidget {
  final double width;
  final double height;
  final String title;
  final SortBy sortBy;
  final Color backgroundColor;
  final Color textColor;
  final Function(SortBy) onTap;

  const OpenFlutterClickableLine({Key key, 
    @required this.width, 
    @required this.height, 
    @required this.title, 
    @required this.onTap, 
    @required this.sortBy, 
    this.backgroundColor, this.textColor}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ThemeData _theme = Theme.of(context);
    return InkWell(
      onTap: ( () => {
        this.onTap(sortBy)
      }),
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: AppSizes.sidePadding,
          vertical: AppSizes.linePadding),
        alignment: Alignment.centerLeft,
        height: height,
        width: width,
        color: this.backgroundColor,
        child: Text(title,
          style: _theme.textTheme.headline3.copyWith(
            fontWeight: FontWeight.normal,
            color: textColor
          )
        )
      )
    );
  }
}