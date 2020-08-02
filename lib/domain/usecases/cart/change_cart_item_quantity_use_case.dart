/// # 5. Product Cart screen
/// 5.2. Change product quantity use-case: 
/// User clicks on “+” or “-” buttons and changes quantity. 
/// The cart item price changes and total amount changes.
/// https://medium.com/@openflutterproject/open-flutter-project-e-commerce-app-use-cases-and-features-6b7414a6e708

import 'package:openflutterecommerce/data/repositories/abstract/cart_repository.dart';
import 'package:openflutterecommerce/data/model/cart_item.dart';
import 'package:openflutterecommerce/domain/usecases/base_use_case.dart';
import 'package:openflutterecommerce/locator.dart';

abstract class ChangeCartItemQuantityUseCase
  implements BaseUseCase<ChangeCartItemQuantityResult, ChangeCartItemQuantityParams> {}

    
class ChangeCartItemQuantityUseCaseImpl implements ChangeCartItemQuantityUseCase {
  @override
  Future<ChangeCartItemQuantityResult> execute(ChangeCartItemQuantityParams params) async {
    try {
      CartRepository cartReposiory = sl();
      await cartReposiory.changeQuantity(params.item, params.quantity);
      return ChangeCartItemQuantityResult(result: true);
    } catch (e) {
      return ChangeCartItemQuantityResult( 
        result: false,
        exception: ChangeCartItemQuantityException()
      );
    }
  }

}

class ChangeCartItemQuantityParams {
  final CartItem item;
  final int quantity;

  ChangeCartItemQuantityParams({this.item, this.quantity});
}

class ChangeCartItemQuantityResult extends UseCaseResult {
  ChangeCartItemQuantityResult({
    Exception exception, 
    bool result
  }) 
    : super(exception: exception, result: result);
}

class ChangeCartItemQuantityException implements Exception {}