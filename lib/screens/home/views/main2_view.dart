// Home Screen View #2: small top banner, list of products sale and new
// Author: openflutterproject@gmail.com
// Date: 2020-02-06

import 'package:flutter/material.dart';
import 'package:openflutterecommerce/config/theme.dart';
import 'package:openflutterecommerce/repos/models/product.dart';
import 'package:openflutterecommerce/screens/wrapper.dart';
import 'package:openflutterecommerce/widgets/block_header.dart';
import 'package:openflutterecommerce/widgets/custom_button.dart';
import 'package:openflutterecommerce/widgets/product_list_view.dart';

class Main2View extends StatefulWidget {
  final Function changeView;
  final List<Product> salesProducts;
  final List<Product> newProducts;

  const Main2View({Key key, this.changeView, this.salesProducts, 
    this.newProducts}) : super(key: key);

  @override
  _Main2ViewState createState() => _Main2ViewState();
}

class _Main2ViewState extends State<Main2View> {
  @override
  Widget build(BuildContext context) {
    ThemeData _theme = Theme.of(context);
    final double width = MediaQuery.of(context).size.width;
    final double widgetWidth = width - AppSizes.sidePadding*2;
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          Container(
            height: width*0.52,
            width:  width,
            decoration: new BoxDecoration(
              image: new DecorationImage(
                fit: BoxFit.fill,
                image: AssetImage("assets/splash/topbanner.png")
              )
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  padding: EdgeInsets.only(left: AppSizes.sidePadding),
                  width: width,
                  child: Text('Street clothes',
                    style: _theme.textTheme.headline1.copyWith(
                      fontSize: 34
                    ))
                )
              ],
            )
          ),
          OpenFlutterBlockHeader(
            width: widgetWidth,
            title: 'Sale',
            linkText: 'View All',
            onLinkTap: ( () => {} ),
            description: 'Super summer sale',
          ),
          OpenFlutterProductListView(
            width: widgetWidth,
            products: widget.salesProducts
          ),
          Padding(padding: EdgeInsets.only(top: AppSizes.sidePadding)),
          OpenFlutterBlockHeader(
            width: widgetWidth,
            title: 'New',
            linkText: 'View All',
            onLinkTap: ( () => {} ),
            description: 'You’ve never seen it before!',
          ),
          OpenFlutterProductListView(
            width: widgetWidth,
            products: widget.newProducts
          ),
          OpenFlutterButton(
            title: 'Next Home Page',
            width: 160,
            height: 48,
            onPressed: ( () => widget.changeView(changeType: ViewChangeType.Forward) )
          )      
        ]
      )
    );
  }
}