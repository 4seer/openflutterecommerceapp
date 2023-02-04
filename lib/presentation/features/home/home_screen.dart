// Home Screen
// Author: openflutterproject@gmail.com
// Date: 2020-02-06

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:openflutterecommerce/data/model/product.dart';
import 'package:openflutterecommerce/presentation/features/wrapper.dart';
import 'package:openflutterecommerce/presentation/widgets/widgets.dart';

import 'home.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: OpenFlutterScaffold(
      background: null,
      title: '',
      body: BlocProvider<HomeBloc>(
          create: (context) {
            return HomeBloc()..add(HomeLoadEvent());
          },
          child: HomeWrapper()),
      bottomMenuIndex: 0,
    ));
  }
}

class HomeWrapper extends StatefulWidget {
  @override
  _HomeWrapperState createState() => _HomeWrapperState();
}

class _HomeWrapperState extends OpenFlutterWrapperState<HomeWrapper> {
  //State createState() => OpenFlutterWrapperState();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
        builder: (BuildContext context, HomeState state) {
      return getPageView(<Widget>[
        Main1View(
          changeView: changePage,
          products: state is HomeLoadedState ? state.newProducts : <Product>[],
        ),
        Main2View(
            changeView: changePage,
            salesProducts:
                state is HomeLoadedState ? state.salesProducts : <Product>[],
            newProducts:
                state is HomeLoadedState ? state.newProducts : <Product>[]),
        Main3View(changeView: changePage)
      ]);
    });
  }
}
