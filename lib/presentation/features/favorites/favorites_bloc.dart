// Favourites Screen Bloc
// Author: umair_adil@live.com
// Date: 2020-02-11

import 'package:bloc/bloc.dart';
import 'package:openflutterecommerce/data/model/cart_item.dart';
import 'package:openflutterecommerce/data/model/sort_rules.dart';
import 'package:openflutterecommerce/domain/usecases/cart/add_product_to_cart_use_case.dart';
import 'package:openflutterecommerce/domain/usecases/favorites/add_to_favorites_use_case.dart';
import 'package:openflutterecommerce/domain/usecases/favorites/get_favorite_products_use_case.dart';
import 'package:openflutterecommerce/domain/usecases/favorites/remove_from_favorites_use_case.dart';
import 'package:openflutterecommerce/locator.dart';

import 'favorites_event.dart';
import 'favorites_state.dart';

class FavouriteBloc extends Bloc<FavouriteEvent, FavouriteState> {
  AddToFavoritesUseCase addToFavoriteUseCase;
  RemoveFromFavoritesUseCase removeFromFavoriteUseCase;
  GetFavoriteProductsUseCase getFavoriteProductsUseCase;
  AddProductToCartUseCase addProductToCartUseCase;

  FavouriteBloc() 
  : addToFavoriteUseCase = sl(),
    removeFromFavoriteUseCase = sl(),
    getFavoriteProductsUseCase = sl(),
    addProductToCartUseCase = sl(),super(FavouriteState());

  @override
  Stream<FavouriteState> mapEventToState(FavouriteEvent event) async* {
    if (event is ScreenLoadedEvent) {
      GetFavoriteProductResult favoriteProducts = 
        await getFavoriteProductsUseCase.execute(
          GetFavoriteProductParams()
        );
      yield FavouriteState(
          sortBy: SortRules(),
          data: favoriteProducts.products,
          filterRules: favoriteProducts.filterRules);
    } else if (event is ProductsChangeViewEvent) {
      yield state.copyWith(isList: !state.isList);
    } else if (event is ProductChangeSortRulesEvent) {
      yield state.getLoading();
      final filteredData = await getFavoriteProductsUseCase.execute(
        GetFavoriteProductParams(
          filterRules: state.filterRules,
          sortRules: event.sortBy
        )
      );
      yield state.copyWith(
        sortBy: event.sortBy,
        data: filteredData.products,
      );
    } else if (event is ProductChangeFilterRulesEvent) {
      yield state.getLoading();
      final filteredData = await getFavoriteProductsUseCase.execute(
        GetFavoriteProductParams(
          filterRules: event.filterRules,
          sortRules: state.sortBy
        )
      );
      yield state.copyWith(
        filterRules: event.filterRules, 
        data: filteredData.products
      );
    } else if (event is AddToCartEvent) {
      await addProductToCartUseCase.execute(CartItem(
        product: event.favouriteProduct.product, 
        productQuantity: ProductQuantity(1), 
        selectedAttributes: event.favouriteProduct.favoriteForm
      ));
    } else if ( event is RemoveFromFavoriteEvent ) {
      yield state.getLoading();
      await removeFromFavoriteUseCase.execute(
        RemoveFromFavoritesParams(
          event.product
        )
      );
      final filteredData = await getFavoriteProductsUseCase.execute(
        GetFavoriteProductParams(
          filterRules: state.filterRules,
          sortRules: state.sortBy
        )
      );
      yield state.copyWith(data: filteredData.products);
    }
  }
}
