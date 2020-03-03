// Checkout Screen
// Author: openflutterproject@gmail.com
// Date: 2020-02-17

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:openflutterecommerce/data/fake_repositories/product_repository.dart';
import 'package:openflutterecommerce/presentation/widgets/widgets.dart';
import 'package:openflutterecommerce/presentation/features/wrapper.dart';

import 'checkout.dart';
import 'views/add_shipping_address_view.dart';

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
      title: "Checkout",
      body: BlocProvider<CheckoutBloc>(
          create: (context) {
            return CheckoutBloc(productRepository: ProductRepository())
              ..add(CheckoutStartEvent());
          },
          child: CheckoutWrapper()),
      bottomMenuIndex: 2,
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
        CartView(changeView: changePage),
        PaymentMethodView(changeView: changePage),
        ShippingAddressView(changeView: changePage),
        AddShippingAddressView(changeView: changePage),
        Success1View(changeView: changePage),
        Success2View(changeView: changePage),
      ]);
    });
  }
}
