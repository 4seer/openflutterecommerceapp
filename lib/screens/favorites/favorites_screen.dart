// Favourites Screen
// Author: umair_adil@live.com
// Date: 2020-02-11

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:openflutterecommerce/repos/favourite_repository.dart';
import 'package:openflutterecommerce/repos/hashtag_repository.dart';
import 'package:openflutterecommerce/screens/favorites/views/listView/favourites_list_view.dart';
import 'package:openflutterecommerce/screens/favorites/views/tileView/favourites_tile_view.dart';
import 'package:openflutterecommerce/screens/wrapper.dart';

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
                  favouriteRepository: FavouriteRepository(),
                  hashtagRepository: HashtagRepository())
                ..add(FavouriteLoadEvent());
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
    return getPageView(<Widget>[
      FavouritesListView(changeView: changePage, width: MediaQuery.of(context).size.width,),
      FavouritesTileView(changeView: changePage, width: MediaQuery.of(context).size.width,)
    ]);
  }
}
