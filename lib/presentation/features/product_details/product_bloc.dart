import 'dart:collection';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:openflutterecommerce/data/model/cart_item.dart';
import 'package:openflutterecommerce/data/model/favorite_product.dart';
import 'package:openflutterecommerce/data/model/product_attribute.dart';
import 'package:openflutterecommerce/domain/usecases/cart/add_product_to_cart_use_case.dart';
import 'package:openflutterecommerce/domain/usecases/favorites/add_to_favorites_use_case.dart';
import 'package:openflutterecommerce/domain/usecases/favorites/remove_from_favorites_use_case.dart';
import 'package:openflutterecommerce/domain/usecases/products/get_product_by_id_use_case.dart';
import 'package:openflutterecommerce/locator.dart';

import 'product_event.dart';
import 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final AddToFavoritesUseCase addToFavoriteUseCase;
  final RemoveFromFavoritesUseCase removeFromFavoritesUseCase;
  final GetProductByIdUseCase getProductByIdUseCaseImpl;
  final AddProductToCartUseCase addProductToCartUseCase;
  final int productId;

  ProductBloc(
    {this.productId}):
      getProductByIdUseCaseImpl = sl(),
      addProductToCartUseCase = sl(),
      addToFavoriteUseCase = sl(),
      removeFromFavoritesUseCase = sl(),super(ProductInitialState());

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
          selectedAttributes: HashMap<ProductAttribute, String>(),
          )
        );
    } else if (event is ProductAddToFavoritesEvent) {
      ProductLoadedState currentState = state as ProductLoadedState;
      await addToFavoriteUseCase.execute(
        FavoriteProduct(
          currentState.product,
          currentState.productAttributes.selectedAttributes
        )
      );
    } else if (event is ProductRemoveFromFavoritesEvent) {
      if ( state is ProductLoadedState) {
        ProductLoadedState currentState = state as ProductLoadedState;
        await removeFromFavoritesUseCase.execute(
          RemoveFromFavoritesParams(
            FavoriteProduct(
              currentState.product,
              currentState.productAttributes.selectedAttributes
            )
          )
        );
      }
    } else if (event is ProductAddToCartEvent) {
      if ( state is ProductLoadedState) {
        ProductLoadedState currentState = state as ProductLoadedState;
        AddToCartResult addToCartResult = await addProductToCartUseCase.execute(CartItem(
          product: currentState.product,
          productQuantity: ProductQuantity(1),
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
