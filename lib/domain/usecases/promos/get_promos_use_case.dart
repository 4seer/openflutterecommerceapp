/// # Find Product by Filter Use Case
/// 2.2. Display product list use-case: From the category list use clicks 
/// on a category and gets to the list of products in the list view. 
/// Complete list of use cases
/// https://medium.com/@openflutterproject/open-flutter-project-e-commerce-app-use-cases-and-features-6b7414a6e708

import 'package:openflutterecommerce/data/model/promo.dart';
import 'package:openflutterecommerce/data/repositories/abstract/promo_repository.dart';
import 'package:openflutterecommerce/domain/usecases/base_use_case.dart';
import 'package:openflutterecommerce/locator.dart';

abstract class GetPromosUseCase
  implements BaseUseCase<GetPromosResult, GetPromosParams> {}
    
class GetPromosUseCaseImpl implements GetPromosUseCase {

  @override
  Future<GetPromosResult> execute(
      GetPromosParams params) async {
    try {
      PromoRepository promoRepository = sl();
      var promos = await promoRepository.getPromoList();

      if (promos != null && promos.isNotEmpty) {
        return GetPromosResult(  
          promos: promos,
          result: true
        );
      }

    } catch (e) {
      return GetPromosResult( 
        promos: [],
        result: false,
        exception: EmptyProductsException()
      );
    }
    return GetPromosResult(  
      promos: [],
      result: false,
      exception: EmptyProductsException()
    );
  }

}

class GetPromosResult extends UseCaseResult {
  List<Promo> promos;
  
  GetPromosResult({this.promos, Exception exception, bool result}) 
    : super(exception: exception, result: result);
}
  
class GetPromosParams { }

class EmptyProductsException implements Exception {}