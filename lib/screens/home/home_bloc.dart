// Home Screen Bloc
// Author: openflutterproject@gmail.com
// Date: 2020-02-06

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:openflutterecommerce/repos/product_repository.dart';
import 'package:openflutterecommerce/screens/home/home_event.dart';
import 'package:openflutterecommerce/screens/home/home_state.dart';

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
      if (this.state is HomeInitialState) {
        yield new HomeLoadedState(
            salesProducts: this.productRepository.getProducts(1),
            newProducts: this.productRepository.getProducts(2));
      } else if (this.state is HomeLoadedState) {
        yield this.state;
      }
    }
  }
}
