import 'package:flutter/material.dart';
import 'package:openflutterecommerce/config/theme.dart';

class OpenFlutterFavouriteButton extends StatelessWidget {
  final bool? favourite;
  final VoidCallback? setFavourite;
  final double? size;
  final double? iconSize;

  OpenFlutterFavouriteButton(
      {this.size, this.iconSize, this.favourite, this.setFavourite});

  @override
  Widget build(BuildContext context) {
    var _theme = Theme.of(context);
    return InkWell(
      onTap: setFavourite,
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.white,
          boxShadow: [
            BoxShadow(color: _theme.primaryColorLight, blurRadius: 15),
          ],
          borderRadius: BorderRadius.all(Radius.circular(25)),
        ),
        height: size ?? 50,
        width: size ?? 50,
        child: favourite!
            ? Icon(Icons.favorite,
                size: iconSize ?? 20, color: _theme.accentColor)
            : Icon(Icons.favorite_border,
                size: iconSize ?? 20, color: _theme.primaryColorLight),
      ),
    );
  }
}
