import 'package:flutter/material.dart';
import 'package:openflutterecommerce/presentation/widgets/widgets.dart';

class PaymentMethodsView extends StatefulWidget {
  final Function? changeView;

  const PaymentMethodsView({ this.changeView}) ;

  @override
  _PaymentMethodsViewState createState() => _PaymentMethodsViewState();
}

class _PaymentMethodsViewState extends State<PaymentMethodsView> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: OpenFlutterBlockHeader(
        title: 'Payment Methods', 
        width: MediaQuery.of(context).size.width,
      )
    );
  }
}