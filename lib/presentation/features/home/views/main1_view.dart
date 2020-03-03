// Home Screen View #1: Big top banner, list of products
// Author: openflutterproject@gmail.com
// Date: 2020-02-06

import 'package:flutter/material.dart';
import 'package:openflutterecommerce/config/theme.dart';
import 'package:openflutterecommerce/data/fake_repositories/models/product.dart';
import 'package:openflutterecommerce/presentation/widgets/widgets.dart';
import 'package:openflutterecommerce/presentation/features/wrapper.dart';
import 'package:flutter_translate/flutter_translate.dart';

class Main1View extends StatefulWidget {
  final List<Product> products;
  final Function changeView;

  const Main1View({Key key, this.products, this.changeView}) : super(key: key);

  @override
  _Main1ViewState createState() => _Main1ViewState();
}

class _Main1ViewState extends State<Main1View> {
  @override
  Widget build(BuildContext context) {
    ThemeData _theme = Theme.of(context);
    final double width = MediaQuery.of(context).size.width;
    final double widgetWidth = width - AppSizes.sidePadding * 2;
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          Container(
              height: width * 1.43,
              width: width,
              decoration: new BoxDecoration(
                  image: new DecorationImage(
                      fit: BoxFit.fill,
                      image: AssetImage("assets/splash/splash-home.png"))),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                      padding: EdgeInsets.only(left: AppSizes.sidePadding),
                      width: width / 2,
                      child: Text(translate('fashionSale'),
                          style: _theme.textTheme.headline1)),
                  Container(
                      padding: EdgeInsets.only(
                          left: AppSizes.sidePadding,
                          bottom: AppSizes.sidePadding,
                          top: AppSizes.sidePadding),
                      width: 160,
                      child: OpenFlutterButton(
                          title: 'Check',
                          width: 160,
                          height: 48,
                          onPressed: (() => widget.changeView(
                              changeType: ViewChangeType.Forward))))
                ],
              )),
          OpenFlutterBlockHeader(
            width: widgetWidth,
            title: 'New',
            linkText: 'View All',
            onLinkTap: (() => {}),
            description: 'You’ve never seen it before!',
          ),
          OpenFlutterProductListView(
              width: widgetWidth, products: widget.products),
          OpenFlutterButton(
              title: 'Next Home Page',
              width: 160,
              height: 48,
              onPressed: (() =>
                  widget.changeView(changeType: ViewChangeType.Forward)))
        ],
      ),
    );
  }
}
