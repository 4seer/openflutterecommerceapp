// Header of the block widget with title and description
// Author: openflutterproject@gmail.com
// Date: 2020-02-06

import 'package:flutter/material.dart';
import 'package:openflutterecommerce/config/theme.dart';

class OpenFlutterBlockSubtitle extends StatelessWidget {
  final double? width;
  final String title;
  final String? linkText;
  final Function? onLinkTap;

  const OpenFlutterBlockSubtitle({
    this.width,
    required this.title,
    this.linkText,
    this.onLinkTap,
  });

  @override
  Widget build(BuildContext context) {
    var _theme = Theme.of(context);
    const rightLinkWidth = 100.0;
    return Container(
      padding: EdgeInsets.only(
          top: AppSizes.sidePadding, left: AppSizes.sidePadding),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              children: <Widget>[
                Container(
                    child: Text(title,
                        style: _theme.textTheme.headline4?.copyWith(
                            fontWeight: FontWeight.bold,
                            color: _theme.primaryColor))),
                linkText != null
                    ? InkWell(
                        onTap: (() => {onLinkTap!()}),
                        child: Container(
                          width: rightLinkWidth,
                          child: Align(
                            alignment: Alignment.centerRight,
                            child: Text(
                              linkText!,
                              style: _theme.textTheme.headline4
                                  ?.copyWith(color: _theme.accentColor),
                            ),
                          ),
                        ),
                      )
                    : Container()
              ],
            ),
          ],
        ),
      ),
    );
  }
}
