/// # Product details screen
/// 5.4. Remove from cart use-case: User clicks on top right 
/// icon of the product cart item and clicks “Remove from Cart”. 
/// The item is removed from cart and local database cart. 
/// Total amount is recalculated.
/// https://medium.com/@openflutterproject/open-flutter-project-e-commerce-app-use-cases-and-features-6b7414a6e708

import 'package:openflutterecommerce/data/abstract/model/cart_item.dart';
import 'package:openflutterecommerce/data/repositories/cart_repository_impl.dart';
import 'package:openflutterecommerce/domain/usecases/base_use_case.dart';

abstract class RemoveProductFromCartUseCase
  implements BaseUseCase<RemoveProductFromCartResult, CartItem> {}

    
class RemoveProductFromCartUseCaseImpl implements RemoveProductFromCartUseCase {
  @override
  Future<RemoveProductFromCartResult> execute(CartItem item) async {
    try {
      CartRepositoryImpl.cartProductDataStorage.items.remove(item);
      return RemoveProductFromCartResult(result: true);
    } catch (e) {
      return RemoveProductFromCartResult(  
        result: false,
        exception: AddProductToCartException()
      );
    }
  }
}

class AddProductToCartException implements Exception {}

class RemoveProductFromCartResult extends UseCaseResult {
  RemoveProductFromCartResult({Exception exception, bool result}) 
    : super(exception: exception, result: result);
}