// Checkout Screen Bloc
// Author: openflutterproject@gmail.com
// Date: 2020-02-17

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:openflutterecommerce/data/fake_repositories/product_repository.dart';

import 'checkout.dart';

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
            cardId: 1, cartProducts: this.productRepository.getProducts(2));
      } else if (this.state is CheckoutProceedState) {
        yield this.state;
      }
    } else if (event is CheckoutSetDefaultCardEvent) {
      if (this.state is CheckoutProceedState) {
        yield (this.state as CheckoutProceedState)
            .copyWith(cardId: event.cardId);
      }
    } else if (event is CheckoutShowAddNewCardEvent) {
      if (this.state is CheckoutProceedState) {
        yield (this.state as CheckoutProceedState)
            .copyWith(showAddNewCardForm: true);
      }
    } else if (event is CheckoutAddNewCardEvent) {
      if (this.state is CheckoutProceedState) {
        //TODO: add new card
        yield (this.state as CheckoutProceedState)
            .copyWith(showAddNewCardForm: false);
      }
    }
  }
}
