//Collapsing Scaffold for Open Flutter E-commerce App
//Author: umair_adil@live.com
//Date: 2020-02-13

import 'package:flutter/material.dart';
import 'package:openflutterecommerce/config/theme.dart';

import 'bottom_menu.dart';

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
      resizeToAvoidBottomInset: false,
      resizeToAvoidBottomPadding: false,
      body: NestedScrollView(
        physics: ScrollPhysics(parent: PageScrollPhysics()),
        headerSliverBuilder: title != null
            ? (BuildContext context, bool innerBoxIsScrolled) {
                return _buildSilverAppBar(context);
              }
            : null,
        body: body,
      ),
      backgroundColor: background,
      bottomNavigationBar: OpenFlutterBottomMenu(bottomMenuIndex),
    );
  }

  List<Widget> _buildSilverAppBar(BuildContext context) {
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

    return <Widget>[
      SliverAppBar(
          expandedHeight: AppSizes.app_bar_expanded_size,
          floating: false,
          pinned: true,
          bottom: tabWidget,
          actions: <Widget>[
            Row(children: <Widget>[
              IconButton(
                icon: Icon(Icons.search),
                color: AppColors.black,
                onPressed: () {
                  print('Search favourites.');
                },
              ),
            ])
          ],
          flexibleSpace: LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constraints) {
              var percent = ((constraints.maxHeight - kToolbarHeight) *
                  100.0 /
                  (AppSizes.app_bar_expanded_size - kToolbarHeight));
              var dx = 0.0;

              dx = 100.0 - percent;

              if (constraints.maxHeight == 100) {
                dx = 0;
              }

              return Stack(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(
                        top: kToolbarHeight / 4, left: 0.0),
                    child: Transform.translate(
                      child: Text(
                        title,
                        style: _theme.textTheme.caption,
                      ),
                      offset:
                          Offset(dx, constraints.maxHeight - kToolbarHeight),
                    ),
                  ),
                ],
              );
            },
          )),
    ];
  }
}
