// Checkout Screen
// Author: openflutterproject@gmail.com
// Date: 2020-02-17

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:openflutterecommerce/repos/product_repository.dart';
import 'package:openflutterecommerce/screens/checkout/checkout.dart';
import 'package:openflutterecommerce/screens/wrapper.dart';
import 'package:openflutterecommerce/widgets/scaffold.dart';

import 'checkout.dart';

class CheckoutScreen extends StatefulWidget {
  @override
  _CheckoutScreenState createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: OpenFlutterScaffold(
      background: null,
      title: null,
      body: BlocProvider<CheckoutBloc>(
          create: (context) {
            return CheckoutBloc(productRepository: ProductRepository())
              ..add(CheckoutStartEvent());
          },
          child: CheckoutWrapper()),
      bottomMenuIndex: 0,
    ));
  }
}

class CheckoutWrapper extends StatefulWidget {
  @override
  _CheckoutWrapperState createState() => _CheckoutWrapperState();
}

class _CheckoutWrapperState extends OpenFlutterWrapperState<CheckoutWrapper> {
  //State createState() => OpenFlutterWrapperState();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CheckoutBloc, CheckoutState>(
        builder: (BuildContext context, CheckoutState state) {
      return getPageView(<Widget>[
        CartView(changeView: changePage)
      ]);
    });
  }
}
