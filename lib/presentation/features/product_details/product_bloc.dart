import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:openflutterecommerce/data/abstract/favorites_repository.dart';
import 'package:openflutterecommerce/data/abstract/model/cart_item.dart';
import 'package:openflutterecommerce/data/abstract/model/product_attribute.dart';
import 'package:openflutterecommerce/domain/usecases/cart/add_product_to_cart_use_case.dart';
import 'package:openflutterecommerce/domain/usecases/products/get_product_by_id_use_case.dart';
import 'package:openflutterecommerce/locator.dart';

import 'product_event.dart';
import 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final GetProductByIdUseCase getProductByIdUseCaseImpl;
  final AddProductToCartUseCase addProductToCartUseCase;
  final FavoritesRepository favoriesRepository;
  final int productId;

  ProductBloc(
    {this.favoriesRepository, this.productId}):
      getProductByIdUseCaseImpl = sl(),
      addProductToCartUseCase = sl();

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
        similarProducts: data.similarProducts,
        productAttributes: SelectedProductAttributes(
          selectedAttributes: Map<ProductAttribute, String>(),
          )
        );
    } else if (event is ProductAddToFavoritesEvent) {
      await favoriesRepository.addToFavorites(
          event.product, event.selectedAttributes);
    } else if (event is ProductAddToFavoritesEvent) {
      await favoriesRepository.removeFromFavorites(productId);
    } else if (event is ProductAddToCartEvent) {
      if ( state is ProductLoadedState) {
        ProductLoadedState currentState = state as ProductLoadedState;
        AddToCartResult addToCartResult = await addProductToCartUseCase.execute(CartItem(
          product: currentState.product,
          quantity: 1,
          selectedAttributes: currentState.productAttributes.selectedAttributes
        ));
        if ( !addToCartResult.result) {
          //TODO: show SnackBar with error
        }
      }
    } else if (event is ProductSetAttributeEvent) {
      ProductLoadedState newState = state as ProductLoadedState;
      yield ProductLoadingState();
      newState.productAttributes.selectedAttributes[event.attribute] =event.selectedValue;
      yield ProductLoadedState(product: newState.product, 
        similarProducts: newState.similarProducts,
        productAttributes: newState.productAttributes
      );
    }
  }
}
