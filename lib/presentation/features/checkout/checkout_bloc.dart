// Checkout Screen Bloc
// Author: openflutterproject@gmail.com
// Date: 2020-02-17

import 'package:bloc/bloc.dart';
import 'package:openflutterecommerce/domain/usecases/checkout/checkout_start_use_case.dart';
import 'package:openflutterecommerce/locator.dart';

import 'checkout.dart';

class CheckoutBloc extends Bloc<CheckoutEvent, CheckoutState> {
  final CheckoutStartUseCase checkoutStartUseCase;
  
  CheckoutBloc() : checkoutStartUseCase = sl();

  @override
  CheckoutState get initialState => CheckoutInitialState();

  @override
  Stream<CheckoutState> mapEventToState(CheckoutEvent event) async* {
    if (event is CheckoutStartEvent) {
      if (state is CheckoutInitialState) {
        ChekcoutStartResult results = await checkoutStartUseCase.execute(ChekcoutStartParams());
        yield CheckoutProceedState(
          cardId: 1, 
          cartProducts: results.cartItems,
          shippingAddresses: results.shippingAddress,
          paymentMethods: results.paymentMethods,
          currentPaymentMethod: results.currentPaymentMethod,
          currentShippingAddress: results.currentShippingAddress,
          orderPrice: results.totalCalculatedPrice,
          deliveryPrice: results.deliveryPrice,
          summaryPrice: results.summaryPrice
        );
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
