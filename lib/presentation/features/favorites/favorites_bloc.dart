// Favourites Screen Bloc
// Author: umair_adil@live.com
// Date: 2020-02-11

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:openflutterecommerce/data/abstract/product_repository.dart';
import 'package:openflutterecommerce/data/fake_model/hashtag_repository.dart';

import 'favorites_event.dart';
import 'favorites_state.dart';

class FavouriteBloc extends Bloc<FavouriteEvent, FavouriteState> {
  final ProductRepository favouriteRepository;
  final HashtagRepository hashtagRepository;

  FavouriteBloc({
    @required this.favouriteRepository,
    @required this.hashtagRepository,
  }) : assert(favouriteRepository != null);

  @override
  Stream<FavouriteState> mapEventToState(FavouriteEvent event) async* {
    print('mapEventToState: $event');
    if (event is FavouriteListViewEvent) {
      yield FavouriteListViewState(await favouriteRepository.getFavorites(),
          hashtagRepository.getHashtags());
    } else if (event is FavouriteTileViewEvent) {
      yield FavouriteTileViewState(await favouriteRepository.getFavorites(),
          hashtagRepository.getHashtags());
    }
  }

  @override
  FavouriteState get initialState => InitialViewState();
}
