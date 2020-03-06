import 'package:flutter/material.dart';
import 'package:openflutterecommerce/config/theme.dart';

class OpenFlutterBottomPopup extends StatelessWidget {
  final Widget child;
  final String title;

  const OpenFlutterBottomPopup(
      {Key key, @required this.child, @required this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var _theme = Theme.of(context);
    var fullWidth = MediaQuery.of(context).size.width;
    return Positioned(
        bottom: 0,
        left: 0,
        child: Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(
              color: _theme.dialogBackgroundColor,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(AppSizes.widgetBorderRadius),
                topRight: Radius.circular(AppSizes.widgetBorderRadius),
              )),
          width: fullWidth,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Container(
                padding: EdgeInsets.all(AppSizes.sidePadding),
                child: Container(
                  width: 60,
                  height: 6,
                  decoration: BoxDecoration(
                    color: AppColors.darkGray,
                    borderRadius: BorderRadius.circular(AppSizes.imageRadius),
                  ),
                ),
              ),
              title != ''
                  ? Text(title, style: _theme.textTheme.headline3)
                  : Container(),
              Padding(
                padding: EdgeInsets.only(bottom: AppSizes.sidePadding),
              ),
              child
            ],
          ),
        ));
  }
}
