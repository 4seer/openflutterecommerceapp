//Scaffold for Open Flutter E-commerce App
//Author: openflutterproject@gmail.com
//Date: 2020-02-06

import 'package:flutter/material.dart';

import 'widgets.dart';

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
    List<Tab> tabBars = List<Tab>();
    ThemeData _theme = Theme.of(context);
    if (tabBarList != null) {
      for (int i = 0; i < tabBarList.length; i++) {
        tabBars.add(Tab(key: UniqueKey(), text: tabBarList[i]));
      }
    }
    Widget tabWidget = tabBars.length > 0
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
      backgroundColor: this.background,
      appBar: title != null
          ? AppBar(
              title: Text(this.title),
              bottom: tabWidget,
              actions: <Widget>[
                  Row(children: <Widget>[
                    Icon(Icons.share),
                  ])
                ])
          : null,
      body: this.body,
      bottomNavigationBar: OpenFlutterBottomMenu(bottomMenuIndex),
    );
  }
}
