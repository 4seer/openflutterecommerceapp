// Header of the block widget with title and description
// Author: openflutterproject@gmail.com
// Date: 2020-02-06

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:openflutterecommerce/config/theme.dart';

//TODO: change to statefull widget
class OpenFlutterCheckbox extends StatelessWidget {
  final double width;
  final String title;
  final bool checked;
  final Function(bool) onTap;

  final mainAxisAlignment;

  const OpenFlutterCheckbox({
    Key key,
    this.width,
    @required this.title,
    this.checked,
    this.onTap,
    this.mainAxisAlignment = MainAxisAlignment.start,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ThemeData _theme = Theme.of(context);
    double rightLinkWidth = 100;
    return Container(
        child: InkWell(
            onTap: (() => {this.onTap(!checked)}),
            child: Row(
              mainAxisAlignment: mainAxisAlignment,
              children: <Widget>[
                Checkbox(
                    activeColor: _theme.primaryColor,
                    checkColor: _theme.backgroundColor,
                    value: checked,
                    onChanged: ((bool newValue) => {this.onTap(newValue)})),
                Container(
                    width: this.width - rightLinkWidth,
                    child: Text(this.title,
                        style: _theme.textTheme.headline3.copyWith(
                            fontWeight: FontWeight.bold,
                            color: _theme.primaryColor))),
              ],
            )));
  }
}
