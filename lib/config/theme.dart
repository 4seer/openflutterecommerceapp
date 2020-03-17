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
  static const double textFieldRadius = 4.0;
  static const EdgeInsets bottomSheetPadding =
      EdgeInsets.symmetric(horizontal: 16, vertical: 10);
  static const APP_BAR_SIZE = 56.0;
  static const APP_BAR_EXPANDED_SIZE = 200.0;
}

class AppColors {
  static const red = Color(0xFFDB3022);
  static const black = Color(0xFF222222);
  static const lightGray = Color(0xFF9B9B9B);
  static const darkGray = Color(0xFF979797);
  static const white = Color(0xFFFFFFFF);
  static const orange = Color(0xFFFFBA49);
  static const background = Color(0xFFE5E5E5);
  static const backgroundLight = Color(0xFFF9F9F9);
  static const transparent = Color(0x00000000);
  static const success = Color(0xFF2AA952);
  static const green = Color(0xFF2AA952);
}

class OpenFlutterEcommerceTheme {
  static ThemeData of(context) {
    var theme = Theme.of(context);
    return theme.copyWith(
      primaryColor: AppColors.black,
      primaryColorLight: AppColors.lightGray,
      accentColor: AppColors.red,
      bottomAppBarColor: AppColors.lightGray,
      backgroundColor: AppColors.background,
      dialogBackgroundColor: AppColors.backgroundLight,
      errorColor: AppColors.red,
      dividerColor: Colors.transparent,
      appBarTheme: theme.appBarTheme.copyWith(
          color: AppColors.white,
          iconTheme: IconThemeData(color: AppColors.black),
          textTheme: theme.textTheme.copyWith(
              caption: TextStyle(color: AppColors.black, fontSize: 18, fontFamily: 'Metropolis'))),
      textTheme: theme.textTheme.copyWith(
        //over image white text
        headline1: theme.textTheme.headline1
            .copyWith(fontSize: 48, color: AppColors.white, fontFamily: 'Metropolis'),
        headline2: theme.textTheme.headline2.copyWith(
            fontSize: 24, color: AppColors.black, fontWeight: FontWeight.w700, fontFamily: 'Metropolis'),

        //product title
        headline3: theme.textTheme.headline3.copyWith(
            color: AppColors.black, fontSize: 16, fontWeight: FontWeight.bold, fontFamily: 'Metropolis'),

        headline4: theme.textTheme.headline4.copyWith(fontFamily: 'Metropolis'),
        //product price
        headline5: theme.textTheme.headline5
            .copyWith(color: AppColors.lightGray, fontSize: 14, fontFamily: 'Metropolis'),
        headline6: theme.textTheme.headline6.copyWith(fontFamily: 'Metropolis'),

        subtitle1: theme.textTheme.headline1
            .copyWith(fontSize: 18, color: AppColors.black, fontFamily: 'Metropolis'),
        subtitle2: theme.textTheme.headline1.copyWith(
            fontSize: 24, color: AppColors.white, fontWeight: FontWeight.bold, fontFamily: 'Metropolis'),
        //red button with white text
        button: theme.textTheme.button
            .copyWith(fontSize: 14, color: AppColors.white, fontFamily: 'Metropolis'),
        //black caption title
        caption: theme.textTheme.caption.copyWith(
          fontSize: 34,
          color: AppColors.black, fontFamily: 'Metropolis'
        ),
        //light gray small text
        bodyText1: theme.textTheme.bodyText1.copyWith(
          color: AppColors.lightGray,
          fontSize: 11, fontFamily: 'Metropolis'
        ),
        //view all link
        bodyText2: theme.textTheme.bodyText2
            .copyWith(color: AppColors.black, fontSize: 11, fontFamily: 'Metropolis'),
      ).apply(
        fontFamily: 'Metropolis'
      ),
      buttonTheme: theme.buttonTheme.copyWith(
        minWidth: 50,
        buttonColor: AppColors.red,
      ),
    );
  }
}
