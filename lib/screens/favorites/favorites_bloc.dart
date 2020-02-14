// Favourites Screen Bloc
// Author: umair_adil@live.com
// Date: 2020-02-11

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:openflutterecommerce/repos/favourite_repository.dart';
import 'package:openflutterecommerce/repos/hashtag_repository.dart';

import 'favorites_event.dart';
import 'favorites_state.dart';

class FavouriteBloc extends Bloc<FavouriteEvent, FavouriteState> {
  final FavouriteRepository favouriteRepository;
  final HashtagRepository hashtagRepository;

  FavouriteBloc({
    @required this.favouriteRepository,
    @required this.hashtagRepository,
  }) : assert(favouriteRepository != null);

  @override
  FavouriteState get initialState => FavouriteInitialState();

  @override
  Stream<FavouriteState> mapEventToState(FavouriteEvent event) async* {
    print("mapEventToState: $event");
    if (event is FavouriteLoadEvent) {
      print("event: FavouriteLoadEvent");
      if (state is FavouriteListViewState) {
        print("event: FavouriteListViewState");
        yield _setListViewState();
      } else if (state is FavouriteGridViewState) {
        print("event: FavouriteGridViewEvent");
        yield _setGridViewState();
      } else {
        print("event: FavouriteListViewState");
        yield _setListViewState();
      }
    } else if (event is FavouriteListViewEvent) {
      print("event: FavouriteListViewState");
      yield _setListViewState();
    } else if (event is FavouriteGridViewEvent) {
      print("event: FavouriteGridViewEvent");
      yield _setGridViewState();
    }
  }

  FavouriteState _setListViewState() {
    print("_setListViewState");
    return new FavouriteListViewState(
        favouriteProducts: this.favouriteRepository.getFavourites(),
        hashtags: hashtagRepository.getHashtags());
  }

  FavouriteState _setGridViewState() {
    print("_setGridViewState");
    return new FavouriteGridViewState(
        favouriteProducts: this.favouriteRepository.getFavourites(),
        hashtags: hashtagRepository.getHashtags());
  }
}
