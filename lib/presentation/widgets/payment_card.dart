import 'package:flutter/material.dart';
import 'package:openflutterecommerce/config/theme.dart';

class OpenFlutterPaymentCard extends StatelessWidget {
  final String cardNumber;

  const OpenFlutterPaymentCard({Key key, @required this.cardNumber})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var _theme = Theme.of(context);
    return Container(
        padding: EdgeInsets.all(AppSizes.sidePadding),
        child: Row(
          children: <Widget>[
            Container(
              width: 64,
              height: 38,
              color: AppColors.white,
              child: Image.asset('assets/images/checkout/mastercard.png',
                  height: 38),
            ),
            Container(
              padding: EdgeInsets.only(left: AppSizes.sidePadding),
              child: Text(cardNumber,
                  style: _theme.textTheme.headline5
                      .copyWith(color: _theme.primaryColor)),
            )
          ],
        ));
  }
}
