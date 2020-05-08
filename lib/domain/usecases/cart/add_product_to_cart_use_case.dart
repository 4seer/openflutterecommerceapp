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
abstract class AddProductToCartUseCase
  implements BaseUseCase<AddToCartResult, CartItem> {}

    
class AddProductToCartUseCaseImpl implements AddProductToCartUseCase {
  @override
  Future<AddToCartResult> execute(CartItem item) async {
    try {
      ProductRepositoryImpl.dataStorage.cart.add(item);
      return AddToCartResult(result: true);
    } catch (e) {
      return AddToCartResult(  
        result: false,
        exception: AddProductToCartException()
      );
    }
  }

}

class AddProductToCartException implements Exception {}

class AddToCartResult extends UseCaseResult {
  AddToCartResult({Exception exception, bool result}) 
    : super(exception: exception, result: result);
}