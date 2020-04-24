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
  static const app_bar_size = 56.0;
  static const app_bar_expanded_size = 200.0;
  static const tile_width = 148.0;
  static const tile_height = 276.0;
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

class AppConsts {
  static const page_size = 20;
}

// Ref: Font Weights: https://api.flutter.dev/flutter/dart-ui/FontWeight-class.html
// Ref: Font Weights for TextTheme: https://api.flutter.dev/flutter/material/TextTheme-class.html
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
              caption: TextStyle(
                  color: AppColors.black,
                  fontSize: 18,
                  fontFamily: 'Metropolis',
                  fontWeight: FontWeight.w400))),
      textTheme: theme.textTheme
          .copyWith(
            //over image white text
            headline: theme.textTheme.headline.copyWith(
                fontSize: 48,
                color: AppColors.white,
                fontFamily: 'Metropolis',
                fontWeight: FontWeight.w900),
            title: theme.textTheme.title.copyWith(
                fontSize: 24,
                color: AppColors.black,
                fontWeight: FontWeight.w900,
                fontFamily: 'Metropolis'), //

            //product title
            display1: theme.textTheme.display1.copyWith(
                color: AppColors.black,
                fontSize: 16,
                fontWeight: FontWeight.w400,
                fontFamily: 'Metropolis'),

            display2: theme.textTheme.display2.copyWith(
                fontFamily: 'Metropolis', fontWeight: FontWeight.w400),
            //product price
            display3: theme.textTheme.display3.copyWith(
                color: AppColors.lightGray,
                fontSize: 14,
                fontFamily: 'Metropolis',
                fontWeight: FontWeight.w400),
            display4: theme.textTheme.display4.copyWith(
                fontFamily: 'Metropolis', fontWeight: FontWeight.w500),

            subtitle: theme.textTheme.headline.copyWith(
                fontSize: 18,
                color: AppColors.black,
                fontFamily: 'Metropolis',
                fontWeight: FontWeight.w400),
            subhead: theme.textTheme.headline.copyWith(
                fontSize: 24,
                color: AppColors.darkGray,
                fontFamily: 'Metropolis',
                fontWeight: FontWeight.w500),
            //red button with white text
            button: theme.textTheme.button.copyWith(
                fontSize: 14,
                color: AppColors.white,
                fontFamily: 'Metropolis',
                fontWeight: FontWeight.w500),
            //black caption title
            caption: theme.textTheme.caption.copyWith(
                fontSize: 34,
                color: AppColors.black,
                fontFamily: 'Metropolis',
                fontWeight: FontWeight.w700),
            //light gray small text
            body1: theme.textTheme.body1.copyWith(
                color: AppColors.lightGray,
                fontSize: 11,
                fontFamily: 'Metropolis',
                fontWeight: FontWeight.w400),
            //view all link
            body2: theme.textTheme.body2.copyWith(
                color: AppColors.black,
                fontSize: 11,
                fontFamily: 'Metropolis',
                fontWeight: FontWeight.w400),
          )
          .apply(fontFamily: 'Metropolis'),
      buttonTheme: theme.buttonTheme.copyWith(
        minWidth: 50,
        buttonColor: AppColors.red,
      ),
    );
  }
}
