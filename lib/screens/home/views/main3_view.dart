// Home Screen View #3: Banners
// Author: openflutterproject@gmail.com
// Date: 2020-02-06

import 'package:flutter/material.dart';
import 'package:openflutterecommerce/config/theme.dart';
import 'package:openflutterecommerce/screens/wrapper.dart';
import 'package:openflutterecommerce/widgets/custom_button.dart';

class Main3View extends StatefulWidget {
  final Function changeView;

  const Main3View({Key key, this.changeView}) : super(key: key);

  @override
  _Main3ViewState createState() => _Main3ViewState();
}

class _Main3ViewState extends State<Main3View> {
  @override
  Widget build(BuildContext context) {
    ThemeData _theme = Theme.of(context);
    final double width = MediaQuery.of(context).size.width;
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          Container(
            height: width*0.96,
            width:  width,
            decoration: new BoxDecoration(
              image: new DecorationImage(
                fit: BoxFit.fill,
                image: AssetImage("assets/splash/main3.png")
              )
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  alignment: Alignment.centerRight,
                  padding: EdgeInsets.only(
                    left: AppSizes.sidePadding, 
                    bottom: AppSizes.sidePadding),
                  width: width,
                  child: Text('New collection',
                    style: _theme.textTheme.headline1.copyWith(
                      fontSize: 34
                    ))
                )
              ],
            )
          ), 
          Row(children: <Widget>[
            Column(children: <Widget>[
              Container(alignment: Alignment.centerLeft,
                width: width/2,
                height: width/2-2,
                padding: EdgeInsets.all(AppSizes.sidePadding),
                child: Text('Summer sale',
                  style: _theme.textTheme.headline1.copyWith(
                    fontSize: 34,
                    color: _theme.accentColor
                  ))),
              Container(
                height: width/2,
                width:  width/2,
                alignment: Alignment.bottomLeft,
                padding: EdgeInsets.only(bottom: AppSizes.sidePadding, 
                  left: AppSizes.sidePadding),
                decoration: new BoxDecoration(
                  image: new DecorationImage(
                    fit: BoxFit.fill,
                    image: AssetImage("assets/splash/bottombanner.png")
                  )
                ),
                child: Text('Black',
                  style: _theme.textTheme.headline1.copyWith(
                    fontSize: 34
                  ))),
            ],),
            Container(
              height: width/2*1.99,
              width:  width/2,
              alignment: Alignment.center,
              padding: EdgeInsets.only(left: AppSizes.sidePadding),
              decoration: new BoxDecoration(
                image: new DecorationImage(
                  fit: BoxFit.fill,
                  image: AssetImage("assets/splash/sidebanner.png")
                )
              ),
              child: Text('Men’s hoodies',
                style: _theme.textTheme.headline1.copyWith(
                  fontSize: 34
                ))),
          ],),
          Padding(padding:EdgeInsets.only(top: AppSizes.sidePadding)),
          OpenFlutterButton(
            title: 'Next Home Page',
            width: 160,
            height: 48,
            onPressed: ( () => widget.changeView(changeType: ViewChangeType.Start) )
          )     
        ]
      )
    );
  }
}