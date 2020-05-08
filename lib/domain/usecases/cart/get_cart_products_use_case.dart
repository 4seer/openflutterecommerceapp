import 'package:flutter/material.dart';
import 'package:openflutterecommerce/data/abstract/model/cart_item.dart';
/// # Product details screen
/// 3.3. Add product to cart use-case: Use clicks on product details 
/// screen, a popup with color and size selection appears, 
/// user selects size and color and clicks “Add to cart”. 
/// Product is added to cart table (local database) 
/// with selected size and color and user being redirected 
/// to Product Cart Screen with list of added products 
/// with according selection.
/// https://medium.com/@openflutterproject/open-flutter-project-e-commerce-app-use-cases-and-features-6b7414a6e708

import 'package:openflutterecommerce/data/repositories/product_repository_impl.dart';
import 'package:openflutterecommerce/domain/usecases/base_use_case.dart';
/// FindProductsByFilterUseCase returns ProductsByFilterResult
/// To check if the results are valid use ProductsByFilterResult.validResults
/// ProductsByFilterResult.exception contains internal exception
abstract class GetCartProductsUseCase
  implements BaseUseCase<GetCartProductsResult, GetCartProductParams> {}

    
class GetCartProductsUseCaseImpl implements GetCartProductsUseCase {
  @override
  Future<GetCartProductsResult> execute(GetCartProductParams params) async {
    try {
      return GetCartProductsResult(
        cartItems: ProductRepositoryImpl.dataStorage.cart,
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