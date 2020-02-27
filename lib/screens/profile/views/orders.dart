import 'package:flutter/material.dart';
import 'package:openflutterecommerce/widgets/block_header.dart';

class MyOrdersView extends StatefulWidget {
  final Function changeView;

  const MyOrdersView({Key key, this.changeView}) : super(key: key);

  @override
  _MyOrdersViewState createState() => _MyOrdersViewState();
}

class _MyOrdersViewState extends State<MyOrdersView> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: OpenFlutterBlockHeader(
        title: 'My Orders', 
        width: MediaQuery.of(context).size.width,
      )
    );
  }
}