// Checkout Success View Screen #1
// Author: openflutterproject@gmail.com
// Date: 2020-02-17

import 'package:flutter/material.dart';
import 'package:openflutterecommerce/config/theme.dart';
import 'package:openflutterecommerce/presentation/widgets/widgets.dart';

import '../../wrapper.dart';

class Success1View extends StatefulWidget {
  final Function changeView;

  const Success1View({Key key, this.changeView}) : super(key: key);

  @override
  _Success1ViewState createState() => _Success1ViewState();
}

class _Success1ViewState extends State<Success1View> {
  @override
  Widget build(BuildContext context) {
    var _theme = Theme.of(context);

    return Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(AppSizes.imageRadius),
            image: DecorationImage(
                fit: BoxFit.fitHeight,
                image: AssetImage('assets/images/checkout/success.png'))),
        child: Padding(
            padding: EdgeInsets.symmetric(horizontal: AppSizes.sidePadding * 3),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(top: AppSizes.sidePadding * 3),
                  child: Text('Success!', style: _theme.textTheme.caption),
                ),
                Padding(
                    padding: EdgeInsets.all(AppSizes.sidePadding),
                    child: Text(
                        'Your order will be delivered soon. Thank you for choosing our app!',
                        style: _theme.textTheme.headline3)),
                OpenFlutterButton(
                  title: 'Continue shopping',
                  onPressed: (() =>
                      {widget.changeView(changeType: ViewChangeType.Forward)}),
                ),
              ],
            )));
  }
}
