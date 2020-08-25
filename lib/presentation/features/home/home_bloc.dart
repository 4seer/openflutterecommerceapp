// Home Screen Bloc
// Author: openflutterproject@gmail.com
// Date: 2020-02-06

import 'package:bloc/bloc.dart';
import 'package:openflutterecommerce/data/model/favorite_product.dart';
import 'package:openflutterecommerce/domain/usecases/favorites/add_to_favorites_use_case.dart';
import 'package:openflutterecommerce/domain/usecases/favorites/remove_from_favorites_use_case.dart';
import 'package:openflutterecommerce/domain/usecases/products/get_home_products_use_case.dart';
import 'package:openflutterecommerce/locator.dart';

import 'home.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final AddToFavoritesUseCase addToFavoritesUseCase;
  final RemoveFromFavoritesUseCase removeFromFavoritesUseCase;
  final GetHomePageProductsUseCase getHomePageProductsUseCase;
  
  HomeBloc() : 
    addToFavoritesUseCase = sl(), 
    removeFromFavoritesUseCase = sl(),
    getHomePageProductsUseCase = sl(),super(HomeInitialState());

  @override
  Stream<HomeState> mapEventToState(HomeEvent event) async* {
    if (event is HomeLoadEvent) {
      if (state is HomeInitialState) {
        HomeProductsResult results = await getHomePageProductsUseCase.execute(HomeProductParams());
        yield HomeLoadedState(
          salesProducts: results.salesProducts,
          newProducts: results.newProducts);
      } else if (state is HomeLoadedState) {
        yield state;
      }
    } else if (event is HomeAddToFavoriteEvent) {
      if (event.isFavorite) {
        await addToFavoritesUseCase.execute(
          FavoriteProduct(event.product, null)
        );
      } else {
        await removeFromFavoritesUseCase.execute(
          RemoveFromFavoritesParams(
            FavoriteProduct(event.product, null)
          )
        );
      }
      HomeProductsResult results = await getHomePageProductsUseCase.execute(HomeProductParams());
      yield HomeLoadedState(
        salesProducts: results.salesProducts,
        newProducts: results.newProducts);
    }
  }
}
