import 'package:flutter/material.dart';
import 'package:openflutterecommerce/widgets/block_header.dart';

class MyReviewsView extends StatefulWidget {
  final Function changeView;

  const MyReviewsView({Key key, this.changeView}) : super(key: key);
  
  @override
  _MyReviewsViewState createState() => _MyReviewsViewState();
}

class _MyReviewsViewState extends State<MyReviewsView> {
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