// Favourites Screen
// Author: umair_adil@live.com
// Date: 2020-02-11

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:openflutterecommerce/data/abstract/product_repository.dart';
import 'package:openflutterecommerce/data/fake_model/hashtag_repository.dart';
import 'package:openflutterecommerce/presentation/features/wrapper.dart';

import 'favorites.dart';
import 'favorites_bloc.dart';
import 'favorites_event.dart';

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
              return FavouriteBloc(
                  favouriteRepository:
                      RepositoryProvider.of<ProductRepository>(context),
                  hashtagRepository: HashtagRepository())
                ..add(FavouriteListViewEvent());
            },
            child: FavouriteWrapper()));
  }
}

class FavouriteWrapper extends StatefulWidget {
  @override
  _FavouriteWrapperState createState() => _FavouriteWrapperState();
}

class _FavouriteWrapperState extends OpenFlutterWrapperState<FavouriteWrapper> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavouriteBloc, FavouriteState>(
        bloc: BlocProvider.of<FavouriteBloc>(context),
        builder: (BuildContext context, FavouriteState state) {
          return getPageView(<Widget>[
            FavouritesListView(changeView: changePage, state: state),
            FavouritesTileView(changeView: changePage, state: state)
          ]);
        });
  }
}
