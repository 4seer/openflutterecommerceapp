// Favourites Screen
// Author: umair_adil@live.com
// Date: 2020-02-11

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:openflutterecommerce/repos/favourite_repository.dart';
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
        child: BlocProvider<FavouriteBloc>(
            create: (context) {
              return FavouriteBloc(favouriteRepository: FavouriteRepository())
                ..add(FavouriteLoadEvent());
            },
            child: FavouriteWrapper()));
  }
}

class FavouriteWrapper extends StatefulWidget {
  @override
  _FavouriteWrapperState createState() => _FavouriteWrapperState();
}

class _FavouriteWrapperState
    extends OpenFlutterWrapperState<FavouriteWrapper> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavouriteBloc, FavouriteState>(
        builder: (BuildContext context, FavouriteState state) {
          return getPageView(<Widget>[
            Container()
          ]);
        });
  }
}
