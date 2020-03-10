// Home Screen Bloc
// Author: openflutterproject@gmail.com
// Date: 2020-02-06

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:openflutterecommerce/data/fake_repositories/product_repository.dart';

import 'home.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final ProductRepository productRepository;

  HomeBloc({
    @required this.productRepository,
  }) : assert(productRepository != null);

  @override
  HomeState get initialState => HomeInitialState();

  @override
  Stream<HomeState> mapEventToState(HomeEvent event) async* {
    if (event is HomeLoadEvent) {
      if (state is HomeInitialState) {
        yield HomeLoadedState(
            salesProducts: productRepository.getProducts(1),
            newProducts: productRepository.getProducts(2));
      } else if (state is HomeLoadedState) {
        yield state;
      }
    }
  }
}
