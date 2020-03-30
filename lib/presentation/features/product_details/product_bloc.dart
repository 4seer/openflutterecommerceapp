import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:openflutterecommerce/data/abstract/favorites_repository.dart';
import 'package:openflutterecommerce/data/abstract/product_repository.dart';

import 'product_event.dart';
import 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final ProductRepository productRepository;
  final FavoritesRepository favoriesRepository;
  final int productId;

  ProductBloc(
      {this.favoriesRepository, this.productId, this.productRepository});

  @override
  ProductState get initialState => ProductInitialState();

  @override
  Stream<ProductState> mapEventToState(ProductEvent event) async* {
    if (event is ScreenLoadedEvent) {
      yield ProductLoadingState();
      final data = await productRepository.getProduct(productId);
      final similarProducts =
          await productRepository.getSimilarProducts(productId);
      yield ProductLoadedState(product: data, similarProducts: similarProducts);
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
