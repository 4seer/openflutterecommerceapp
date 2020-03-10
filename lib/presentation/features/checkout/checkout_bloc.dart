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
      if (state is CheckoutInitialState) {
        yield CheckoutProceedState(
            cardId: 1, cartProducts: productRepository.getProducts(2));
      } else if (state is CheckoutProceedState) {
        yield state;
      }
    } else if (event is CheckoutSetDefaultCardEvent) {
      if (state is CheckoutProceedState) {
        yield (state as CheckoutProceedState).copyWith(cardId: event.cardId);
      }
    } else if (event is CheckoutShowAddNewCardEvent) {
      if (state is CheckoutProceedState) {
        yield (state as CheckoutProceedState)
            .copyWith(showAddNewCardForm: true);
      }
    } else if (event is CheckoutAddNewCardEvent) {
      if (state is CheckoutProceedState) {
        //TODO: add new card
        yield (state as CheckoutProceedState)
            .copyWith(showAddNewCardForm: false);
      }
    }
  }
}
