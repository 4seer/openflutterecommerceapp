// Favourites Screen Bloc
// Author: umair_adil@live.com
// Date: 2020-02-11

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:openflutterecommerce/data/abstract/favorites_repository.dart';
import 'package:openflutterecommerce/data/abstract/model/sort_rules.dart';

import 'favorites_event.dart';
import 'favorites_state.dart';

class FavouriteBloc extends Bloc<FavouriteEvent, FavouriteState> {
  final FavoritesRepository favoritesRepository;

  FavouriteBloc({
    @required this.favoritesRepository
  });

  @override
  FavouriteState get initialState => FavouriteState();

  @override
  Stream<FavouriteState> mapEventToState(FavouriteEvent event) async* {
    if (event is ScreenLoadedEvent) {
      yield FavouriteState(
          sortBy: SortRules(),
          data: await favoritesRepository.getFavoriteProducts(),
          filterRules: await favoritesRepository.getFavoritesFilterOptions());
    } else if (event is ProductsChangeViewEvent) {
      yield state.copyWith(isList: !state.isList);
    } else if (event is ProductChangeSortRulesEvent) {
      yield state.getLoading();
      final filteredData = await favoritesRepository.getFavoriteProducts(
          filterRules: state.filterRules, sortRules: event.sortBy);
      yield state.copyWith(
        sortBy: event.sortBy,
        data: filteredData,
      );
    } else if (event is ProductChangeFilterRulesEvent) {
      yield state.getLoading();
      final filteredData = await favoritesRepository.getFavoriteProducts(
          filterRules: event.filterRules, sortRules: state.sortBy);
      yield state.copyWith(filterRules: event.filterRules, data: filteredData);
    } else if (event is AddToCartEvent) {
      //TODO add to cart
    } else if ( event is RemoveFromFavoriteEvent ) {
      yield state.getLoading();
      final filteredData = await favoritesRepository.removeFromFavorites(event.productId);
      yield state.copyWith(data: filteredData);
    }
  }
}
