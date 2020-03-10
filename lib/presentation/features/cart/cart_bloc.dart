// Home Screen Bloc
// Author: openflutterproject@gmail.com
// Date: 2020-02-06

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:openflutterecommerce/data/fake_repositories/product_repository.dart';
import 'package:openflutterecommerce/data/fake_repositories/promo_repository.dart';

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
      if (state is CartInitialState) {
        var products = ProductRepository().getCartProducts();
        var promos = PromoRepository().getPromos();
        yield CartLoadedState(
            showPromoPopup: false, promos: promos, cartProducts: products);
      } else if (state is CartLoadedState) {
        yield state;
      }
    } else if (event is CartQuantityChangedEvent) {
      //TODO: do necessary updates
    } else if (event is CartRemoveFromCartEvent) {
      //TODO: remove product from cart
    } else if (event is CartAddToFavsEvent) {
      //TODO: add to favs
    } else if (event is CartPromoAppliedEvent) {
      //TODO: apply promo code
      var state = this.state as CartLoadedState;
      yield state.copyWith(showPromoPopup: false);
    } else if (event is CartPromoCodeAppliedEvent) {
      //TODO: apply promo code
      var state = this.state as CartLoadedState;
      yield state.copyWith(showPromoPopup: false);
    } else if (event is CartShowPopupEvent) {
      var state = this.state as CartLoadedState;
      yield state.copyWith(showPromoPopup: true);
    }
  }
}
