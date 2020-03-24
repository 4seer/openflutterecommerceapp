//Scaffold for Open Flutter E-commerce App
//Author: openflutterproject@gmail.com
//Date: 2020-02-06

import 'package:flutter/material.dart';

import '../widgets.dart';

class OpenFlutterScaffold extends StatelessWidget {
  final Color background;
  final String title;
  final Widget body;
  final int bottomMenuIndex;
  final List<String> tabBarList;
  final TabController tabController;

  const OpenFlutterScaffold(
      {Key key,
      this.background,
      @required this.title,
      @required this.body,
      @required this.bottomMenuIndex,
      this.tabBarList,
      this.tabController})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var tabBars = <Tab>[];
    var _theme = Theme.of(context);
    if (tabBarList != null) {
      for (var i = 0; i < tabBarList.length; i++) {
        tabBars.add(Tab(key: UniqueKey(), text: tabBarList[i]));
      }
    }
    Widget tabWidget = tabBars.isNotEmpty
        ? TabBar(
            unselectedLabelColor: _theme.primaryColor,
            unselectedLabelStyle: TextStyle(fontWeight: FontWeight.normal),
            labelColor: _theme.primaryColor,
            labelStyle: TextStyle(fontWeight: FontWeight.bold),
            tabs: tabBars,
            controller: tabController,
            indicatorColor: _theme.accentColor,
            indicatorSize: TabBarIndicatorSize.tab)
        : null;
    return Scaffold(
      backgroundColor: background,
      appBar: title != null
          ? AppBar(title: Text(title), bottom: tabWidget, actions: <Widget>[
              Row(children: <Widget>[
                Icon(Icons.share),
              ])
            ])
          : null,
      body: body,
      bottomNavigationBar: OpenFlutterBottomMenu(bottomMenuIndex),
    );
  }
}
