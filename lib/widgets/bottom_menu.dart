// Bottom menu widget for Open Flutter E-commerce App
// Author: openflutterproject@gmail.com
// Date: 2020-02-06

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:openflutterecommerce/config/routes.dart';

class OpenFlutterBottomMenu extends StatelessWidget {
  final int menuIndex;

  OpenFlutterBottomMenu(this.menuIndex);

  Color colorByIndex(ThemeData theme, int index) {
    return index == menuIndex ? theme.accentColor : theme.primaryColorLight;
  }

  BottomNavigationBarItem getItem(
      IconData image, String title, ThemeData theme, int index) {
    return BottomNavigationBarItem(
        icon: Icon(image, color: colorByIndex(theme, index)),
        title: Text(title,
            style: TextStyle(fontSize: 10, color: colorByIndex(theme, index))));
  }

  @override
  Widget build(BuildContext context) {
    final _theme = Theme.of(context);
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      currentIndex: menuIndex,
      onTap: (value) {
        switch (value) {
          case 0:
            Navigator.pushNamed(context, OpenFlutterEcommerceRoutes.home);
            break;
          case 1:
            Navigator.pushNamed(context, OpenFlutterEcommerceRoutes.shop);
            break;
          case 2:
            Navigator.pushNamed(context, OpenFlutterEcommerceRoutes.cart);
            break;
          case 3:
            Navigator.pushNamed(context, OpenFlutterEcommerceRoutes.favourites);
            break;
          case 4:
            Navigator.pushNamed(context, OpenFlutterEcommerceRoutes.profile);
            break;
        }
      },
      items: [
        getItem(FontAwesomeIcons.home, 'Home', _theme, 0),
        getItem(FontAwesomeIcons.shoppingCart, 'Shop', _theme, 1),
        getItem(FontAwesomeIcons.shoppingBag, 'Bag', _theme, 2),
        getItem(FontAwesomeIcons.heart, 'Favorites', _theme, 3),
        getItem(FontAwesomeIcons.user, 'Profile', _theme, 4),
      ],
    );
  }
}
