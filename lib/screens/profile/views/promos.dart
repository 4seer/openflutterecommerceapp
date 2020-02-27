import 'package:flutter/material.dart';
import 'package:openflutterecommerce/widgets/block_header.dart';

class PromosView extends StatefulWidget {
  final Function changeView;

  const PromosView({Key key, this.changeView}) : super(key: key);

  @override
  _PromosViewState createState() => _PromosViewState();
}

class _PromosViewState extends State<PromosView> {
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