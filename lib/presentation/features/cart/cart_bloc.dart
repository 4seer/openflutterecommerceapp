// Cart Screen Bloc
// Author: openflutterproject@gmail.com
// Date: 2020-02-06

import 'package:bloc/bloc.dart';
import 'package:openflutterecommerce/data/model/favorite_product.dart';
import 'package:openflutterecommerce/domain/usecases/cart/change_cart_item_quantity_use_case.dart';
import 'package:openflutterecommerce/domain/usecases/cart/get_cart_products_use_case.dart';
import 'package:openflutterecommerce/domain/usecases/cart/remove_product_from_cart_use_case.dart';
import 'package:openflutterecommerce/domain/usecases/favorites/add_to_favorites_use_case.dart';
import 'package:openflutterecommerce/domain/usecases/promos/get_promos_use_case.dart';
import 'package:openflutterecommerce/locator.dart';

import 'cart.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  final GetCartProductsUseCase getCartProductsUseCase;
  final RemoveProductFromCartUseCase removeProductFromCartUseCase;
  final AddToFavoritesUseCase addToFavoritesUseCase;
  final GetPromosUseCase getPromosUseCase;
  
  CartBloc() 
  : getCartProductsUseCase = sl(),
    removeProductFromCartUseCase = sl(),
    addToFavoritesUseCase = sl(),
    getPromosUseCase = sl();

  @override
  CartState get initialState => CartInitialState();

  @override
  Stream<CartState> mapEventToState(CartEvent event) async* {
    if (event is CartLoadedEvent) {
      if (state is CartInitialState) {
        final cartResults = await getCartProductsUseCase.execute(GetCartProductParams());
        var promos = await getPromosUseCase.execute(GetPromosParams());
        
        yield CartLoadedState(
          showPromoPopup: false, 
          totalPrice: cartResults.totalPrice,
          calculatedPrice: cartResults.calculatedPrice,
          promos: promos.promos, 
          appliedPromo: cartResults.appliedPromo,
          cartProducts: cartResults.cartItems);
      } else if (state is CartLoadedState) {
        yield state;
      }
    } else if (event is CartQuantityChangedEvent) {
      var state = this.state as CartLoadedState;
      yield CartLoadingState();
      ChangeCartItemQuantityUseCase changeCartItemQuantityUseCase = sl();
      await changeCartItemQuantityUseCase.execute(ChangeCartItemQuantityParams(
        item: event.item,
        quantity: event.newQuantity
      ));
      final cartResults = await getCartProductsUseCase.execute(GetCartProductParams());
      yield CartLoadedState(
        cartProducts: cartResults.cartItems, 
        promos: state.promos, 
        showPromoPopup: state.showPromoPopup
      );
    } else if (event is CartRemoveFromCartEvent) {
      var state = this.state as CartLoadedState;
      yield CartLoadingState();
      await removeProductFromCartUseCase.execute(event.item);
      final cartResults = await getCartProductsUseCase.execute(GetCartProductParams());
      yield CartLoadedState(
        cartProducts: cartResults.cartItems, 
        promos: state.promos, 
        showPromoPopup: state.showPromoPopup
      );
    } else if (event is CartAddToFavsEvent) {
      await addToFavoritesUseCase.execute(
        FavoriteProduct(
          event.item.product,
          event.item.selectedAttributes
        )
      );
    } else if (event is CartPromoAppliedEvent) {
      //TODO: apply promo code
      var state = this.state as CartLoadedState;
      final cartResults = await getCartProductsUseCase.execute(
        GetCartProductParams(appliedPromo: event.promo)
      );
      yield state.copyWith(
        showPromoPopup: false, 
        totalPrice: cartResults.totalPrice,
        calculatedPrice: cartResults.calculatedPrice,
        appliedPromo: event.promo);
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
