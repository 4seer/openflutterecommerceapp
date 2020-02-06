// Extended Raised button for Open Flutter E-commerce App
// Author: openflutterproject@gmail.com
// Date: 2020-02-06

import 'package:flutter/material.dart';
import 'package:openflutterecommerce/config/theme.dart';

class OpenFlutterButton extends StatelessWidget{
  final double width;
  final double height;
  final Function onPressed;
  final String title;

  OpenFlutterButton({Key key, 
    @required this.width, 
    @required this.height, 
    @required this.title, 
    @required this.onPressed}) : 
      super(key: key) ;

  @override
  Widget build(BuildContext context) {
    ThemeData _theme = Theme.of(context);
    return RaisedButton(
      onPressed: onPressed,
      shape: new RoundedRectangleBorder(
        borderRadius: new BorderRadius.circular(
          AppSizes.buttonRadius
        )
      ),
      child: Container(
        alignment: Alignment.center,
        width: width,
        height: height,
        child: Text(title,
          style: _theme.textTheme.button.copyWith(
            backgroundColor: _theme.textTheme.button.backgroundColor,
            color: _theme.textTheme.button.color
          )
        )
      )
    );
  }
}