import 'package:flutter/material.dart';
import 'package:openflutterecommerce/config/theme.dart';

class OpenFlutterTextTile extends StatelessWidget {
  final String title;
  final String subtitle;
  final Function onClick;

  const OpenFlutterTextTile({Key key, this.title, this.subtitle, this.onClick})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width - AppSizes.sidePadding * 2;
    return InkWell(
        onTap: (() => {onClick()}),
        child: Container(
            padding: EdgeInsets.all(AppSizes.sidePadding),
            alignment: Alignment.centerLeft,
            width: MediaQuery.of(context).size.width,
            child: Row(
              children: <Widget>[
                Container(
                  width: width - 16,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(title,
                          style: OpenFlutterEcommerceTheme.TEXT_HEADLINE3),
                      Text(subtitle,
                          style: OpenFlutterEcommerceTheme.TEXT_BODY1)
                    ],
                  ),
                ),
                Icon(Icons.arrow_forward_ios, size: 16)
              ],
            )));
  }
}
