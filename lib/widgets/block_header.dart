// Header of the block widget with title and description
// Author: openflutterproject@gmail.com
// Date: 2020-02-06

import 'package:flutter/material.dart';
import 'package:openflutterecommerce/config/theme.dart';

class OpenFlutterBlockHeader extends StatelessWidget {
  final double width;
  final String title;
  final String linkText;
  final Function onLinkTap;
  final String description;

  const OpenFlutterBlockHeader({Key key, this.width, 
    this.title, this.linkText, this.onLinkTap, 
    this.description}) : super(key: key);

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
                  style: _theme.textTheme.caption
                )
              ),
              this.linkText != null ?
                InkWell(
                  onTap: (() => { this.onLinkTap() }),
                  child: Container(
                    width: rightLinkWidth,
                    child: Align(alignment: Alignment.centerRight,
                      child: Text(this.linkText,
                        style: _theme.textTheme.bodyText2
                      )
                    )
                  )
                )
                :Container()
            ],
          ),
          this.description != null?
            Text(this.description,
              style: _theme.textTheme.bodyText2)
            :Container()
        ]
      )
    );
  }
}