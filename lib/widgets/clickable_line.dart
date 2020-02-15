import 'package:flutter/material.dart';
import 'package:openflutterecommerce/config/theme.dart';

class OpenFlutterClickableLine extends StatelessWidget {
  final double width;
  final double height;
  final String title;
  final Function onTap;

  const OpenFlutterClickableLine({Key key, this.width, this.height, this.title, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ThemeData _theme = Theme.of(context);
    return Container(
      height: height,
      width: width,
      padding: EdgeInsets.all(AppSizes.linePadding),
      child: Text(title,
        style: _theme.textTheme.display3.copyWith(
          fontWeight: FontWeight.normal
        )
      )
    );
  }
}