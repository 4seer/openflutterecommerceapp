// Home Screen Bloc
// Author: openflutterproject@gmail.com
// Date: 2020-02-06

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:openflutterecommerce/repos/product_repository.dart';

import 'cart.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  final ProductRepository productRepository;

  CartBloc({
    @required this.productRepository,
  }) : assert(productRepository != null);

  @override
  CartState get initialState => CartInitialState();

  @override
  Stream<CartState> mapEventToState(CartEvent event) async* {
    if (event is CartLoadedEvent) {
      if (this.state is CartInitialState) {
        yield new CartLoadedState(
            cartProducts: this.productRepository.getProducts(1));
      } else if (this.state is CartLoadedState) {
        yield this.state;
      }
    }
  }
}
