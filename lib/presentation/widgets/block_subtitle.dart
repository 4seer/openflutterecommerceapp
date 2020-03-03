// Header of the block widget with title and description
// Author: openflutterproject@gmail.com
// Date: 2020-02-06

import 'package:flutter/material.dart';
import 'package:openflutterecommerce/config/theme.dart';

class OpenFlutterBlockSubtitle extends StatelessWidget {
  final double width;
  final String title;
  final String linkText;
  final Function onLinkTap;

  const OpenFlutterBlockSubtitle({Key key, 
    this.width, 
    @required this.title, 
    this.linkText, 
    this.onLinkTap,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ThemeData _theme = Theme.of(context);
    double rightLinkWidth = 100;
    return Container(
      padding: EdgeInsets.only(top: AppSizes.sidePadding, 
        left: AppSizes.sidePadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget> [
          Row(
            children: <Widget>[
              Container(
                width: this.width - rightLinkWidth,
                child: Text(this.title,
                  style: _theme.textTheme.headline3.copyWith(
                    fontWeight: FontWeight.bold,
                    color: _theme.primaryColor
                  )
                )
              ),
              this.linkText != null ?
                InkWell(
                  onTap: (() => { this.onLinkTap() }),
                  child: Container(
                    width: rightLinkWidth,
                    child: Align(alignment: Alignment.centerRight,
                      child: Text(this.linkText,
                        style: _theme.textTheme.headline3.copyWith(
                          color: _theme.accentColor
                        )
                      )
                    )
                  )
                )
                :Container()
            ],
          )
        ]
      )
    );
  }
}