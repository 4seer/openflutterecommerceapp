/// # 1. Home Screen
/// 1.1. Home Screen 1 use-case: Use loads the app, list of new products 
/// for home page are loaded and displayed in the app.
/// https://medium.com/@openflutterproject/open-flutter-project-e-commerce-app-use-cases-and-features-6b7414a6e708

import 'package:openflutterecommerce/data/model/product.dart';
import 'package:openflutterecommerce/data/repositories/abstract/product_repository.dart';
import 'package:openflutterecommerce/domain/usecases/base_use_case.dart';
import 'package:openflutterecommerce/locator.dart';

abstract class GetHomePageProductsUseCase
    implements BaseUseCase<HomeProductsResult, HomeProductParams> {}

    
class GetHomePageProductsUseCaseImpl implements GetHomePageProductsUseCase {

  @override
  Future<HomeProductsResult> execute(
      HomeProductParams params) async {
    try {
      ProductRepository productRepository = sl();
      return HomeProductsResult(  
        salesProducts: await productRepository.getProducts(categoryId: 1),
        newProducts: await productRepository.getProducts(categoryId: 2),
        result: false,
      );
    } catch (e) {
      return HomeProductsResult(  
        salesProducts: [],
        newProducts: [],
        result: false,
        exception: HomeProductsException()
      );
    }
  }
}
class HomeProductParams {}

class HomeProductsResult extends UseCaseResult {
  final List<Product> salesProducts;
  final List<Product> newProducts;

  HomeProductsResult({this.salesProducts, this.newProducts, Exception exception, bool result})
    : super(exception: exception, result: result);
}

class HomeProductsException implements Exception {}