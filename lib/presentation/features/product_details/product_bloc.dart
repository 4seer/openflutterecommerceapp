import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:openflutterecommerce/data/abstract/favorites_repository.dart';
import 'package:openflutterecommerce/domain/usecases/products/get_product_by_id_use_case.dart';
import 'package:openflutterecommerce/locator.dart';

import 'product_event.dart';
import 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final GetProductByIdUseCase getProductByIdUseCaseImpl;
  final FavoritesRepository favoriesRepository;
  final int productId;

  ProductBloc(
    {this.favoriesRepository, this.productId}):
      getProductByIdUseCaseImpl = sl();

  @override
  ProductState get initialState => ProductInitialState();

  @override
  Stream<ProductState> mapEventToState(ProductEvent event) async* {
    if (event is ProductScreenLoadedEvent) {
      yield ProductLoadingState();
      final ProductDetailsResults data =  await getProductByIdUseCaseImpl.execute(
        ProductDetailsParams(
          categoryId: event.categoryId,
          productId: event.productId)
        );
      yield ProductLoadedState(product: data.productDetails, 
        similarProducts: data.similarProducts);
    } else if (event is ProductAddToFavoritesEvent) {
      await favoriesRepository.addToFavorites(
          productId, event.selectedAttributes);
    } else if (event is ProductAddToFavoritesEvent) {
      await favoriesRepository.removeFromFavorites(productId);
    } else if (event is ProductAddToCartEvent) {
      //TODO: add to cart
    } else if (event is ProductSetAttributeEvent) {
      //TODO: add to cart
    }
  }
}
