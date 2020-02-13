//Scaffold for Open Flutter E-commerce App
//Author: openflutterproject@gmail.com
//Date: 2020-02-06

import 'package:flutter/material.dart';
import 'package:openflutterecommerce/widgets/bottom_menu.dart';

class OpenFlutterCollapsingScaffold extends StatelessWidget {
  final Color background;
  final String title;
  final Widget body;
  final int bottomMenuIndex;
  final List<String> tabBarList;
  final TabController tabController;

  const OpenFlutterCollapsingScaffold(
      {Key key,
      this.background,
      this.title,
      this.body,
      this.bottomMenuIndex,
      this.tabBarList,
      this.tabController})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: title != null
            ? (BuildContext context, bool innerBoxIsScrolled) {
                return _buildSilverAppBar(context);
              }
            : null,
        body: this.body,
      ),
      backgroundColor: this.background,
      bottomNavigationBar: OpenFlutterEcommerceBottomMenu(bottomMenuIndex),
    );
  }

  List<Widget> _buildSilverAppBar(BuildContext context) {
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

    return <Widget>[
      SliverAppBar(
        expandedHeight: 200.0,
        floating: false,
        pinned: true,
        bottom: tabWidget,
        actions: <Widget>[
          Row(children: <Widget>[
            Icon(Icons.share),
          ])
        ],
        flexibleSpace: FlexibleSpaceBar(
            centerTitle: true,
            title: Text(this.title,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16.0,
                )),
            background: Container(
              color: this.background,
            )),
      ),
    ];
  }
}
