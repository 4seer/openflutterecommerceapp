import 'package:flutter/material.dart';
import 'package:openflutterecommerce/config/theme.dart';

class OpenFlutterActionCard extends StatelessWidget {
  final String title;
  final String linkText;
  final Function onLinkTap;
  final Widget child;

  const OpenFlutterActionCard({required this.title, required this.linkText, required this.child, required this.onLinkTap});

  @override
  Widget build(BuildContext context) {
    var _theme = Theme.of(context);
    var width = MediaQuery.of(context).size.width - AppSizes.sidePadding * 4;
    return Padding(
        padding: EdgeInsets.all(AppSizes.sidePadding),
        child: Container(
            padding: EdgeInsets.all(AppSizes.sidePadding),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(AppSizes.imageRadius)),
                color: AppColors.white,
                boxShadow: [
                  BoxShadow(
                      color: AppColors.lightGray.withOpacity(0.3),
                      blurRadius: AppSizes.imageRadius,
                      offset: Offset(0.0, AppSizes.imageRadius))
                ]),
            child: Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Container(
                        width: width / 3 * 2,
                        child: Text(title, style: _theme.textTheme.headline2?.copyWith(color: _theme.primaryColor))),
                    linkText != null
                        ? Container(
                            alignment: Alignment.centerRight,
                            width: width / 3,
                            child: InkWell(
                              onTap: (() => {onLinkTap()}),
                              child:
                                  Text(linkText, style: _theme.textTheme.headline2?.copyWith(color: _theme.accentColor)),
                            ))
                        : Container()
                  ],
                ),
                Container(padding: EdgeInsets.symmetric(vertical: AppSizes.linePadding * 2), child: child)
              ],
            )));
  }
}
