import 'package:flutter/material.dart';
import 'package:openflutterecommerce/config/theme.dart';

enum CardType { MasterCard, Visa }

class OpenFlutterPaymentCardPreview extends StatelessWidget {
  final double width;
  final String cardNumber;
  final String cardHolderName;
  final int expirationMonth;
  final int expirationYear;
  final CardType cardType;

  const OpenFlutterPaymentCardPreview(
      {Key key,
      @required this.width,
      @required this.cardNumber,
      @required this.cardHolderName,
      @required this.expirationMonth,
      @required this.expirationYear,
      this.cardType = CardType.MasterCard})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var _theme = Theme.of(context);
    var asset = 'assets/images/checkout/dark_card.png';
    if (cardType == CardType.Visa) {
      asset = 'assets/images/checkout/light_card.png';
    }
    return Container(
        padding: EdgeInsets.all(AppSizes.sidePadding),
        child: Container(
            width: width,
            height: width * 0.63,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(AppSizes.imageRadius),
              image: DecorationImage(
                fit: BoxFit.fill,
                image: AssetImage(asset),
              ),
            ),
            child: Stack(
              children: <Widget>[
                Positioned(
                  top: 100,
                  left: 24,
                  width: width - AppSizes.sidePadding,
                  height: 38,
                  child: Text(cardNumber,
                      style:
                          _theme.textTheme.headline6.copyWith(fontSize: 24, color: AppColors.white, letterSpacing: 6)),
                ),
                Positioned(
                  top: 210,
                  left: 24,
                  width: width - AppSizes.sidePadding,
                  height: 38,
                  child: Text(cardHolderName,
                      style: _theme.textTheme.headline2.copyWith(
                          //fontSize: 34,
                          color: AppColors.white)),
                ),
                Positioned(
                  top: 210,
                  left: 185,
                  width: width - AppSizes.sidePadding,
                  height: 38,
                  child:
                      Text(expirationMonth.toString().padLeft(2, '0') + '/' + expirationYear.toString().padLeft(2, '0'),
                          style: _theme.textTheme.headline2.copyWith(
                              //fontSize: 34,
                              color: AppColors.white)),
                ),
              ],
            )));
  }
}
