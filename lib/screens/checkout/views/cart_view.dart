// Checkout Cart View Screen
// Author: openflutterproject@gmail.com
// Date: 2020-02-17

import 'package:flutter/material.dart';

class CartView extends StatefulWidget {

  final Function changeView;

  const CartView({Key key, this.changeView}) : super(key: key);

  @override
  _CartViewState createState() => _CartViewState();
}

class _CartViewState extends State<CartView> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          
        ],
      )
    );
  }
}