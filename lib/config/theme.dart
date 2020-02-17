// Open Flutter E-commerce Light Theme
// Author: openflutterproject@gmail.com
// Date: 2020-02-06

import 'package:flutter/material.dart';

class AppSizes {
  static const int splashScreenTitleFontSize = 48;
  static const int titleFontSize = 34;
  static const double sidePadding = 15;
  static const double widgetSidePadding = 20;
  static const double buttonRadius = 25;
  static const double imageRadius = 8;
  static const double linePadding = 4;
  static const double widgetBorderRadius = 34;
  static const TEXT_FIELD_RADIUS = 4.0;
}

class AppColors {
  static const red = Color(0xFFDB3022);
  static const black = Color(0xFF222222);
  static const lightGray = Color(0xFF9B9B9B);
  static const darkGray = Color(0xFF979797);
  static const white = Color(0xFFFFFFFF);
  static const orange = Color(0xFFFFBA49);
  static const background = Color(0xFFE5E5E5);
  static const transparent = Color(0x00000000);
}

class OpenFlutterEcommerceTheme {
  static ThemeData of(context) {
    ThemeData theme = Theme.of(context);
    return theme.copyWith(
      primaryColor: AppColors.black,
      primaryColorLight: AppColors.lightGray,
      accentColor: AppColors.red,
      bottomAppBarColor: AppColors.lightGray,
      backgroundColor: AppColors.background,
      errorColor: AppColors.red,
      appBarTheme: theme.appBarTheme.copyWith(
          color: AppColors.white,
          iconTheme: IconThemeData(color: AppColors.black),
          textTheme: theme.textTheme.copyWith(
              caption: TextStyle(color: AppColors.black, fontSize: 18))),
      textTheme: theme.textTheme.copyWith(
          //over image white text
          headline: theme.textTheme.headline
              .copyWith(fontSize: 48, color: AppColors.white),
          subtitle: theme.textTheme.headline
              .copyWith(fontSize: 18, color: AppColors.black),
          subhead: theme.textTheme.headline.copyWith(
              fontSize: 24,
              color: AppColors.white,
              fontWeight: FontWeight.bold),
          //red button with white text
          button: theme.textTheme.button
              .copyWith(fontSize: 14, color: AppColors.white),
          //black caption title
          caption: theme.textTheme.caption.copyWith(
            fontSize: 34,
            color: AppColors.black,
          ),
          //light gray small text
          display1: theme.textTheme.display1.copyWith(
            color: AppColors.lightGray,
            fontSize: 11,
          ),
          //view all link
          display2: theme.textTheme.display2
              .copyWith(color: AppColors.black, fontSize: 11),
          //product title
          display3: theme.textTheme.display2.copyWith(
              color: AppColors.black,
              fontSize: 16,
              fontWeight: FontWeight.bold),
          //product price
          display4: theme.textTheme.display2
              .copyWith(color: AppColors.lightGray, fontSize: 14)),
      buttonTheme: theme.buttonTheme.copyWith(
        minWidth: 50,
        buttonColor: AppColors.red,
      ),
    );
  }
}
