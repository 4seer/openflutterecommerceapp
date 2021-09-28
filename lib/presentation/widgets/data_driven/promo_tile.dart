import 'package:flutter/material.dart';
import 'package:openflutterecommerce/config/theme.dart';
import 'package:openflutterecommerce/data/model/promo.dart';

import '../widgets.dart';

class OpenFlutterPromoTile extends StatelessWidget {
  final Promo item;
  final Function onClickApply;
  final Color textColor;

  const OpenFlutterPromoTile({Key key, @required this.item, @required this.onClickApply, @required this.textColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var _theme = Theme.of(context);
    var width = MediaQuery.of(context).size.width;
    return Container(
      height: 80,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(AppSizes.imageRadius),
          boxShadow: [
            BoxShadow(
                color: AppColors.lightGray.withOpacity(0.3),
                blurRadius: AppSizes.imageRadius,
                offset: Offset(0.0, AppSizes.imageRadius))
          ],
          color: AppColors.white),
      child: Row(
        children: <Widget>[
          Container(
              width: 85,
              decoration: item.image != null
                  ? BoxDecoration(image: DecorationImage(fit: BoxFit.fill, image: AssetImage(item.image)))
                  : BoxDecoration(
                      color: AppColors.red,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(AppSizes.textFieldRadius),
                          bottomLeft: Radius.circular(AppSizes.textFieldRadius)),
                    ),
              padding: EdgeInsets.all(AppSizes.linePadding * 2),
              child: Row(children: <Widget>[
                Text(item.discount.toStringAsFixed(0),
                    style: _theme.textTheme.caption.copyWith(color: textColor, fontSize: 32)),
                Padding(
                    padding: EdgeInsets.only(top: 16, left: 5),
                    child: Column(
                      children: <Widget>[
                        Text('%', style: _theme.textTheme.headline2.copyWith(color: textColor)),
                        Text('off', style: _theme.textTheme.headline2.copyWith(color: textColor))
                      ],
                    ))
              ])),
          Container(
              padding: EdgeInsets.only(left: AppSizes.sidePadding),
              alignment: Alignment.centerLeft,
              width: width - 270,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(item.title,
                        style: _theme.textTheme.headline4
                            .copyWith(fontWeight: FontWeight.bold, color: _theme.primaryColor)),
                    Text(item.promoCode, style: _theme.textTheme.bodyText1.copyWith(color: _theme.primaryColor))
                  ])),
          Container(
              padding: EdgeInsets.only(left: AppSizes.sidePadding, top: AppSizes.linePadding * 2),
              width: 155,
              child: Column(children: <Widget>[
                Text(item.daysLeft.toString() + ' days remaining',
                    style:
                        _theme.textTheme.headline2.copyWith(fontWeight: FontWeight.bold, color: _theme.primaryColor)),
                Padding(padding: EdgeInsets.only(bottom: AppSizes.linePadding)),
                OpenFlutterButton(
                  width: 120,
                  height: 35,
                  title: 'Apply',
                  onPressed: (() => {onClickApply()}),
                )
              ]))
        ],
      ),
    );
  }
}
