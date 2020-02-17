// Home Screen View #1: Big top banner, list of products
// Author: openflutterproject@gmail.com
// Date: 2020-02-06

import 'package:flutter/material.dart';
import 'package:openflutterecommerce/config/routes.dart';
import 'package:openflutterecommerce/config/theme.dart';
import 'package:openflutterecommerce/repos/models/product.dart';
import 'package:openflutterecommerce/screens/wrapper.dart';
import 'package:openflutterecommerce/widgets/block_header.dart';
import 'package:openflutterecommerce/widgets/product_list_view.dart';
import 'package:openflutterecommerce/widgets/widgets.dart';

class CartView extends StatefulWidget {
  final List<Product> products;
  final Function changeView;

  const CartView({Key key, this.products, this.changeView}) : super(key: key);
  
  @override
  _CartViewState createState() => _CartViewState();
}

class _CartViewState extends State<CartView> {
  @override
  Widget build(BuildContext context) {
    ThemeData _theme = Theme.of(context);
    final double width = MediaQuery.of(context).size.width;
    final double widgetWidth = width - AppSizes.sidePadding*2;
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          Text('User cart'),
          OpenFlutterButton(
            height: 50,
            width: 200,
            title: "Proceed to checkout",
            onPressed: (() => {
              Navigator.pushNamed(context, OpenFlutterEcommerceRoutes.checkout)
            })
          )
        ]
      )
    );
  }
}