import 'package:flutter/material.dart';
import 'package:openflutterecommerce/config/theme.dart';

class OpenFlutterDeliveryMethod extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var _theme = Theme.of(context);
    var width = MediaQuery.of(context).size.width;
    var widgetWidth = (width) / 3;
    var height = 90.0;
    return Container(
      width: width,
      height: height,
      padding: EdgeInsets.only(
          left: AppSizes.sidePadding, top: AppSizes.sidePadding),
      child: Row(
        children: <Widget>[
          buildElement('assets/images/checkout/fedex.png', '2-3 days', _theme,
              widgetWidth, height),
          buildElement('assets/images/checkout/usps.png', '2-3 days', _theme,
              widgetWidth, height),
          buildElement('assets/images/checkout/dhl.png', '2-3 days', _theme,
              widgetWidth, height),
        ],
      ),
    );
  }

  Widget buildElement(String assetImage, String title, ThemeData _theme,
      double width, double height) {
    return Padding(
        padding: EdgeInsets.only(right: AppSizes.sidePadding),
        child: Container(
          width: width - AppSizes.linePadding * 2 - AppSizes.sidePadding,
          height: height,
          padding: EdgeInsets.all(AppSizes.linePadding),
          decoration: BoxDecoration(
              borderRadius:
                  BorderRadius.all(Radius.circular(AppSizes.imageRadius)),
              color: AppColors.white,
              boxShadow: [
                BoxShadow(
                    color: AppColors.lightGray.withOpacity(0.3),
                    blurRadius: AppSizes.imageRadius,
                    offset: Offset(0.0, AppSizes.imageRadius))
              ]),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                padding: EdgeInsets.all(AppSizes.sidePadding),
                child: Image.asset(
                  assetImage,
                  width: 61,
                ),
              ),
              Text(title,
                  style: _theme.textTheme.bodyText2
                      .copyWith(color: _theme.primaryColorLight))
            ],
          ),
        ));
  }
}
