// Home Screen View #1: Big top banner, list of products
// Author: openflutterproject@gmail.com
// Date: 2020-02-06

import 'package:flutter/material.dart';
import 'package:openflutterecommerce/config/theme.dart';
import 'package:openflutterecommerce/repos/models/product.dart';
import 'package:openflutterecommerce/repos/models/product_cart.dart';
import 'package:openflutterecommerce/screens/wrapper.dart';
import 'package:openflutterecommerce/widgets/block_header.dart';
import 'package:openflutterecommerce/widgets/product_cart.dart';
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
  ThemeData _theme;
  @override
  Widget build(BuildContext context) {
    _theme= Theme.of(context);
    final double width = MediaQuery.of(context).size.width;
    return SafeArea(
        child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  Text(
                    'My Bag',
                    style: TextStyle(fontSize: 27, fontWeight: FontWeight.bold),
                  ),
                  _cartListView,
                  _totalAmountView

                ])));
  }
  Widget get _totalAmountView =>Container(
    margin: EdgeInsets.all(10),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Text(
          "Total Amount",
          style: _theme.textTheme.subtitle2,
        ),
        Text(
          "\$52.0",
          style: _theme.textTheme.subtitle2,
        ),
      ],
    ),
  );
  Widget get _cartListView =>
      ListView.builder(
        itemBuilder: (BuildContext context, int index) {
          return OpenFlutterProductCartCard(
            productCart: ProductCart(
                id: 1,
                image: "assets/thumbs/dress/dress2.png",
                color: "black",
                size: "L",
                price: 43.0,
                currency: "\$",
                title: "Pullover"),
          );
        },
        itemCount: 3,
        shrinkWrap: true,
      );
}
