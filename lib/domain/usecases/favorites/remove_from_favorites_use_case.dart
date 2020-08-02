import 'package:openflutterecommerce/data/repositories/abstract/favorites_repository.dart';
/// # 7. Product Favorites Screen
/// 7.4. Remove product from favorites use-case: 
/// User clicks delete icon in the top right corner of the favorite 
/// product tile. The product is removed from local database 
/// and the list.
/// https://medium.com/@openflutterproject/open-flutter-project-e-commerce-app-use-cases-and-features-6b7414a6e708

import 'package:openflutterecommerce/data/model/favorite_product.dart';
import 'package:openflutterecommerce/domain/usecases/base_use_case.dart';
import 'package:openflutterecommerce/locator.dart';

abstract class RemoveFromFavoritesUseCase
  implements BaseUseCase<RemoveFromFavoritesResult, RemoveFromFavoritesParams> {}

class RemoveFromFavoritesUseCaseImpl implements RemoveFromFavoritesUseCase {
  @override
  Future<RemoveFromFavoritesResult> execute(RemoveFromFavoritesParams params) async {
    try {
      FavoritesRepository favoritesRepository = sl();
      await favoritesRepository.removeFromFavorites(
        params.product.product.id, 
        params.product.favoriteForm);
      return RemoveFromFavoritesResult(result: true);
    } catch (e) {
      return RemoveFromFavoritesResult(  
        result: false,
        exception: RemoveFromFavoritesException()
      );
    }
  }

}

class RemoveFromFavoritesParams {
  final FavoriteProduct product;

  RemoveFromFavoritesParams(this.product);
}

class RemoveFromFavoritesResult extends UseCaseResult {
  RemoveFromFavoritesResult({Exception exception, bool result}) 
    : super(exception: exception, result: result);
}

class RemoveFromFavoritesException implements Exception {}
