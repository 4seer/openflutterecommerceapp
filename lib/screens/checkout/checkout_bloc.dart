// Checkout Screen Bloc
// Author: openflutterproject@gmail.com
// Date: 2020-02-17

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:openflutterecommerce/repos/product_repository.dart';
import 'package:openflutterecommerce/screens/checkout/checkout.dart';

class CheckoutBloc extends Bloc<CheckoutEvent, CheckoutState> {
  final ProductRepository productRepository;

  CheckoutBloc({
    @required this.productRepository,
  }) : assert(productRepository != null);

  @override
  CheckoutState get initialState => CheckoutInitialState();

  @override
  Stream<CheckoutState> mapEventToState(CheckoutEvent event) async* {
    if (event is CheckoutStartEvent) {
      if (this.state is CheckoutInitialState) {
        yield new CheckoutProceedState(
            cartProducts: this.productRepository.getProducts(2));
      } else if (this.state is CheckoutProceedState) {
        yield this.state;
      }
    }
  }
}
