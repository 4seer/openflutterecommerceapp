// Favourites Screen Bloc
// Author: umair_adil@live.com
// Date: 2020-02-11

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:openflutterecommerce/repos/product_repository.dart';
import 'package:openflutterecommerce/screens/home/home_event.dart';
import 'package:openflutterecommerce/screens/home/home_state.dart';

import 'favorites_event.dart';
import 'favorites_state.dart';

class FavouriteBloc extends Bloc<FavouriteEvent, FavouriteState> {
  final ProductRepository productRepository;

  FavouriteBloc({
    @required this.productRepository,
  })  : assert(productRepository != null);

  @override
  FavouriteState get initialState => FavouriteInitialState();

  @override
  Stream<FavouriteState> mapEventToState(FavouriteEvent event) async* {
    if(event is FavouriteLoadEvent){
      if (this.currentState is FavouriteInitialState) {
        yield new FavouriteLoadedState(salesProducts: this.productRepository.getProducts(1),
            newProducts: this.productRepository.getProducts(2));
      } else if (this.currentState is FavouriteLoadedState) {
        yield this.currentState;
      }
    }
  }
}