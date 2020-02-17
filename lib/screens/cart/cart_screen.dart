// Home Screen
// Author: openflutterproject@gmail.com
// Date: 2020-02-06

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:openflutterecommerce/repos/product_repository.dart';
import 'package:openflutterecommerce/screens/cart/views/cart_view.dart';
import 'package:openflutterecommerce/screens/wrapper.dart';
import 'package:openflutterecommerce/widgets/scaffold.dart';

import 'cart.dart';

class CartScreen extends StatefulWidget {
  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: OpenFlutterScaffold(
      background: null,
      title: null,
      body: BlocProvider<CartBloc>(
          create: (context) {
            return CartBloc(productRepository: ProductRepository())
              ..add(CartLoadedEvent());
          },
          child: CartWrapper()),
      bottomMenuIndex: 0,
    ));
  }
}

class CartWrapper extends StatefulWidget {
  @override
  _CartWrapperState createState() => _CartWrapperState();
}

class _CartWrapperState extends OpenFlutterWrapperState<CartWrapper> {
  //State createState() => OpenFlutterWrapperState();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartBloc, CartState>(
        builder: (BuildContext context, CartState state) {
      return getPageView(<Widget>[
        CartView(changeView: changePage)
      ]);
    });
  }
}
