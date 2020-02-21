

import 'package:flutter/material.dart';
import 'package:openflutterecommerce/config/theme.dart';

class OpenFlutterFavouriteButton extends StatelessWidget {
  final bool favourite;
  final Function setFavourite;
  final double size;
  final double iconSize;

  OpenFlutterFavouriteButton({Key key,this.size,this.iconSize,@required this.favourite,@required this.setFavourite}):super(key:key);

  @override
  Widget build(BuildContext context) {
    ThemeData _theme=Theme.of(context);
    return InkWell(
        onTap: (() => setFavourite()),
        child: Container(
            decoration: BoxDecoration(
              color: AppColors.white,
              boxShadow: [
                BoxShadow(color: _theme.primaryColorLight, blurRadius: 15),
              ],
              borderRadius: BorderRadius.all(Radius.circular(25)),
            ),
            height: this.size==null?50:this.size,
            width: this.size==null?50:this.size,
            child: favourite
                ? Icon(Icons.favorite, size: iconSize==null?20:this.iconSize, color: _theme.accentColor)
                : Icon(Icons.favorite_border,
                size: iconSize==null?20:this.iconSize, color: _theme.primaryColorLight)));
  }
}
