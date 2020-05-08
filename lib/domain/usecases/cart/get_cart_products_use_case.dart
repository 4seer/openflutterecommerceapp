/// # 5. Product Cart screen
/// 5.1. Product cart use-case: List of products in the cart is 
/// displayed. If there is a promo code set as default and 
/// was not used yet then it is applied to current order in the cart.
/// https://medium.com/@openflutterproject/open-flutter-project-e-commerce-app-use-cases-and-features-6b7414a6e708

import 'package:flutter/material.dart';
import 'package:openflutterecommerce/data/abstract/model/cart_item.dart';
import 'package:openflutterecommerce/data/repositories/cart_repository_impl.dart';
import 'package:openflutterecommerce/domain/usecases/base_use_case.dart';

abstract class GetCartProductsUseCase
  implements BaseUseCase<GetCartProductsResult, GetCartProductParams> {}

    
class GetCartProductsUseCaseImpl implements GetCartProductsUseCase {
  @override
  Future<GetCartProductsResult> execute(GetCartProductParams params) async {
    try {
      return GetCartProductsResult(
        cartItems: CartRepositoryImpl.cartProductDataStorage.items,
        result: true);
    } catch (e) {
      return GetCartProductsResult( 
        cartItems: [], 
        result: false,
        exception: GetCartProductsException()
      );
    }
  }

}

class GetCartProductParams {}

class GetCartProductsException implements Exception {}

class GetCartProductsResult extends UseCaseResult {
  final List<CartItem> cartItems;
  GetCartProductsResult({
    @required this.cartItems, 
    Exception exception, 
    bool result
  }) 
    : super(exception: exception, result: result);
}