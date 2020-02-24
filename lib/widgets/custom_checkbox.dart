// Header of the block widget with title and description
// Author: openflutterproject@gmail.com
// Date: 2020-02-06

import 'package:flutter/material.dart';
import 'package:openflutterecommerce/config/theme.dart';
//TODO: change to statefull widget
class OpenFlutterCheckbox extends StatelessWidget {
  final double width;
  final String title;
  final bool checked;
  final Function(bool) onTap;

  const OpenFlutterCheckbox({Key key, 
    this.width, 
    @required this.title, 
    this.checked, 
    this.onTap,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ThemeData _theme = Theme.of(context);
    double rightLinkWidth = 100;
    return Container(
      padding: EdgeInsets.only(left: AppSizes.sidePadding),
      child: InkWell(
        onTap: (() => { this.onTap(!checked) }),
        child: Row(
          children: <Widget>[
            Checkbox(
              activeColor: _theme.primaryColor,
              checkColor: _theme.backgroundColor,
              value: checked,
              onChanged: ((bool newValue) => { this.onTap(newValue) })
            ),
            Container(
              width: this.width - rightLinkWidth,
              child: Text(this.title,
                style: _theme.textTheme.headline3.copyWith(
                  fontWeight: FontWeight.bold,
                  color: _theme.primaryColor
                )
              )
            ),
          ],
        )
      )
    );
  }
}