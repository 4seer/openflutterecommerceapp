// Bottom menu widget for Open Flutter E-commerce App
// Author: openflutterproject@gmail.com
// Date: 2020-02-06

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:openflutterecommerce/config/routes.dart';

class OpenFlutterEcommerceBottomMenu extends StatelessWidget {
  final int menuIndex;

  OpenFlutterEcommerceBottomMenu(this.menuIndex);

  Color colorByIndex(ThemeData theme, int index){
    return index == menuIndex ? theme.accentColor: theme.primaryColorLight;
  }

  BottomNavigationBarItem getItem(String image, String title, ThemeData theme, int index){
    return BottomNavigationBarItem(
        icon: SvgPicture.asset(image, 
          height: 24,
          width: 24,
          color: colorByIndex(theme, index)
        ), 
        title: Text(title, 
          style: TextStyle(
            fontSize: 10,
            color: colorByIndex(theme, index)
          )
        )
    );
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
        getItem('assets/icons/bottom_menu/home.svg', 'Home', _theme, 0),
        getItem('assets/icons/bottom_menu/cart.svg', 'Shop', _theme, 1),
        getItem('assets/icons/bottom_menu/bag.svg', 'Bag', _theme, 2),
        getItem('assets/icons/bottom_menu/favorites.svg', 'Favorites', _theme, 3),
        getItem('assets/icons/bottom_menu/profile.svg', 'Profile', _theme, 4),
      ],
    );
  }
}