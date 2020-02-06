// Open Flutter E-commerce Light Theme
// Author: openflutterproject@gmail.com
// Date: 2020-02-06

import 'package:flutter/material.dart';

class AppSizes{
  static int splashScreenTitleFontSize = 48;
  static int titleFontSize = 34;
  static double sidePadding = 15;
  static double widgetSidePadding = 20;
  static double buttonRadius = 25;
  static double imageRadius = 8;
  static double linePadding = 4;
}

class AppColors{
  static Color red = Color(0xFFDB3022);
  static Color black = Color(0xFF222222);
  static Color lightGray = Color(0xFF9B9B9B);
  static Color white = Color(0xFFFFFFFF);
  static Color orange = Color(0xFFFFBA49);
  static Color background = Color(0xFFE5E5E5);
}

class OpenFlutterEcommerceTheme{
  static ThemeData of(context){
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
          caption: TextStyle(
            color: AppColors.black,
            fontSize: 18
          )
        )
      ),
      textTheme: theme.textTheme.copyWith(
        //over image white text
        headline: theme.textTheme.headline.copyWith(
          fontSize: 48,
          color: AppColors.white
        ),
        subtitle: theme.textTheme.headline.copyWith(
          fontSize: 18,
          color: AppColors.black
        ),
        subhead: theme.textTheme.headline.copyWith(
          fontSize: 24,
          color: AppColors.white,
          fontWeight: FontWeight.bold
        ),
        //red button with white text
        button: theme.textTheme.button.copyWith(
          fontSize: 14,
          color: AppColors.white
        ),
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
        display2: theme.textTheme.display2.copyWith(
          color: AppColors.black,
          fontSize: 11
        ),
        //product title
        display3: theme.textTheme.display2.copyWith(
          color: AppColors.black,
          fontSize: 16,
          fontWeight: FontWeight.bold
        ),
        //product price
        display4: theme.textTheme.display2.copyWith(
          color: AppColors.lightGray,
          fontSize: 14
        )
      ),
      buttonTheme: theme.buttonTheme.copyWith(
        minWidth: 50,
        buttonColor: AppColors.red,
      ),
    );
  }
}