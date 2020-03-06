// Header of the block widget with title and description
// Author: openflutterproject@gmail.com
// Date: 2020-02-06

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

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
    var _theme = Theme.of(context);
    var rightLinkWidth = 100.0;
    return Container(
        child: InkWell(
            onTap: (() => {onTap(!checked)}),
            child: Row(
              mainAxisAlignment: mainAxisAlignment,
              children: <Widget>[
                Checkbox(
                    activeColor: _theme.primaryColor,
                    checkColor: _theme.backgroundColor,
                    value: checked,
                    onChanged: ((bool newValue) => {onTap(newValue)})),
                Container(
                  width: width - rightLinkWidth,
                  child: Text(
                    title,
                    style: _theme.textTheme.headline3.copyWith(
                        fontWeight: FontWeight.bold,
                        color: _theme.primaryColor),
                  ),
                ),
              ],
            )));
  }
}
