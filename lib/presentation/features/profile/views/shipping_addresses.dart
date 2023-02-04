import 'package:flutter/material.dart';
import 'package:openflutterecommerce/presentation/widgets/widgets.dart';

class MyShippingAddressesView extends StatefulWidget {
  final Function? changeView;

  const MyShippingAddressesView({ this.changeView}) ;

  @override
  _MyShippingAddressesViewState createState() => _MyShippingAddressesViewState();
}

class _MyShippingAddressesViewState extends State<MyShippingAddressesView> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: OpenFlutterBlockHeader(
        title: 'Shipping Addresses', 
        width: MediaQuery.of(context).size.width,
      )
    );
  }
}