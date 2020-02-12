// Favourites Screen
// Author: umair_adil@live.com
// Date: 2020-02-11

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:openflutterecommerce/repos/models/product.dart';
import 'package:openflutterecommerce/repos/product_repository.dart';
import 'package:openflutterecommerce/screens/home/home.dart';
import 'package:openflutterecommerce/screens/wrapper.dart';
import 'package:openflutterecommerce/widgets/scaffold.dart';

import 'favorites_bloc.dart';
import 'favorites_event.dart';
import 'favorites_state.dart';

class FavouriteScreen extends StatefulWidget {
  @override
  _FavouriteScreenState createState() => _FavouriteScreenState();
}

class _FavouriteScreenState extends State<FavouriteScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: OpenFlutterScaffold(
          background: null,
          title: null,
          body: BlocProvider<FavouriteBloc>(
              builder: (context) {
                return FavouriteBloc(
                    productRepository: ProductRepository()
                )..dispatch(FavouriteLoadEvent());
              },
              child: FavouriteWrapper()
          ),
          bottomMenuIndex: 0,
        )
    );
  }
}

class FavouriteWrapper extends StatefulWidget {
  @override
  _FavouriteWrapperState createState() => _FavouriteWrapperState();
}

class _FavouriteWrapperState extends OpenFlutterWrapperState<FavouriteWrapper> {

  //State createState() => OpenFlutterWrapperState();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavouriteEvent, FavouriteState>(
        bloc: BlocProvider.of<FavouriteBloc>(context),
        builder: (BuildContext context, FavouriteState state) {
          return getPageView(<Widget>[
            Main1View(changeView: changePage,
                products: state is FavouriteLoadedState?
                state.newProducts : List<Product>()),
            Main2View(changeView: changePage,
                salesProducts: state is FavouriteLoadedState?
                state.salesProducts : List<Product>(),
                newProducts: state is FavouriteLoadedState?
                state.newProducts : List<Product>()),
            Main3View(changeView: changePage)
          ]
          );
        }
    );
  }
}