// Checkout Success View Screen #2
// Author: openflutterproject@gmail.com
// Date: 2020-02-17

import 'package:flutter/material.dart';
import 'package:openflutterecommerce/config/theme.dart';
import 'package:openflutterecommerce/widgets/custom_button.dart';

import '../../wrapper.dart';

class Success2View extends StatefulWidget {

  final Function changeView;

  const Success2View({Key key, this.changeView}) : super(key: key);

  @override
  _Success2ViewState createState() => _Success2ViewState();
}

class _Success2ViewState extends State<Success2View> {
  @override
  Widget build(BuildContext context) {
    ThemeData _theme = Theme.of(context);
    double width = MediaQuery.of(context).size.width-AppSizes.sidePadding;
    return Container(
      padding: EdgeInsets.symmetric(horizontal: AppSizes.sidePadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(top: AppSizes.sidePadding *5),
            child: Image.asset("assets/images/checkout/bags.png")
          ),
          Padding(
            padding: EdgeInsets.only(top: AppSizes.sidePadding*3,
              left: AppSizes.sidePadding*2,
              right: AppSizes.sidePadding*2,),
            child: Text(
              'Success!',
              style: _theme.textTheme.caption
            ),
          ),
          Padding(padding: EdgeInsets.all(AppSizes.sidePadding*2),
            child: Text('Your order will be delivered soon. Thank you for choosing our app!',
              style: _theme.textTheme.headline3
            )
          ),
          OpenFlutterButton(
            title: 'CONTINUE SHOPPING',
            onPressed: ( () => {
              widget.changeView(changeType: ViewChangeType.Exact, index: 0)
            }),
          ),
        ],
      )
    );
  }
}