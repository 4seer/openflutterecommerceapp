/// # 5. Product Cart screen
/// 5.1. Product cart use-case: List of products in the cart is 
/// displayed. If there is a promo code set as default and 
/// was not used yet then it is applied to current order in the cart.
/// https://medium.com/@openflutterproject/open-flutter-project-e-commerce-app-use-cases-and-features-6b7414a6e708

import 'package:flutter/material.dart';
import 'package:openflutterecommerce/data/model/cart_item.dart';
import 'package:openflutterecommerce/data/model/promo.dart';
import 'package:openflutterecommerce/data/repositories/cart_repository_impl.dart';
import 'package:openflutterecommerce/domain/usecases/base_use_case.dart';

abstract class GetCartProductsUseCase
  implements BaseUseCase<GetCartProductsResult, GetCartProductParams> {}

    
class GetCartProductsUseCaseImpl implements GetCartProductsUseCase {
  @override
  Future<GetCartProductsResult> execute(GetCartProductParams params) async {
    try {
      List<CartItem> cartProducts = CartRepositoryImpl.cartProductDataStorage.items;
      double totalPrice = 0;
        for (var i = 0; i < cartProducts.length; i++) {
          totalPrice += cartProducts[i].price;
        }
      final calculatedTotalPrice = 
        params.appliedPromo != null ?
          totalPrice * (1 - params.appliedPromo.discount/100)
          : totalPrice;
      return GetCartProductsResult(
        cartItems: cartProducts,
        totalPrice: totalPrice,
        calculatedPrice: calculatedTotalPrice,
        result: true);
    } catch (e) {
      return GetCartProductsResult( 
        cartItems: [], 
        totalPrice: 0,
        calculatedPrice: 0,
        result: false,
        exception: GetCartProductsException()
      );
    }
  }

}

class GetCartProductParams {
  final Promo appliedPromo;

  GetCartProductParams({this.appliedPromo});
}

class GetCartProductsException implements Exception {}

class GetCartProductsResult extends UseCaseResult {
  final List<CartItem> cartItems;
  final double totalPrice;
  final double calculatedPrice;

  GetCartProductsResult({
    @required this.cartItems, 
    @required this.totalPrice,
    @required this.calculatedPrice,
    Exception exception, 
    bool result
  }) 
    : super(exception: exception, result: result);
}