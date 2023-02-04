// List of hastags at the top of product list
// Author: openflutterproject@gmail.com
// Date: 2020-02-06

import 'package:flutter/material.dart';
import 'package:openflutterecommerce/config/theme.dart';
import 'package:openflutterecommerce/data/model/hashtag.dart';

class OpenFlutterHashTagList extends StatelessWidget {
  final List<HashTag> tags;
  final double height;
  final Function onTap;

  const OpenFlutterHashTagList({required this.tags, required this.onTap, required this.height});

  @override
  Widget build(BuildContext context) {
    var hashtagButtons = <Widget>[];
    var _theme = Theme.of(context);
    if (tags != null) {
      for (var i = 0; i < tags.length; i++) {
        hashtagButtons.add(buildButton(tags[i], _theme));
      }
    }
    return Container(
      height: height,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: hashtagButtons,
      ),
    );
  }

  Padding buildButton(HashTag tag, ThemeData _theme) {
    return Padding(
        padding: EdgeInsets.only(right: AppSizes.sidePadding / 2),
        child: Container(
          padding: EdgeInsets.all(
            AppSizes.linePadding,
          ),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: _theme.primaryColor,
            borderRadius: BorderRadius.circular(
              AppSizes.buttonRadius,
            ),
          ),
          child: Text(
            tag.title,
            style: _theme.textTheme.button,
          ),
          width: 100,
          height: 20,
        ));
  }
}
