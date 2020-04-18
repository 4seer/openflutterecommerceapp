import 'package:openflutterecommerce/data/abstract/model/product.dart';
import 'package:openflutterecommerce/data/woocommerce/repositories/product_remote_repository.dart';
import 'package:openflutterecommerce/domain/usecases/base_use_case.dart';
import 'package:openflutterecommerce/domain/usecases/products/products_by_filter_params.dart';
import 'package:openflutterecommerce/domain/usecases/products/products_by_filter_result.dart';
import 'package:openflutterecommerce/locator.dart';

abstract class FindProductsByFilterUseCase
    implements BaseUseCase<ProductsByFilterResult, ProductsByFilterParams> {}

    
class FindProductsByFilterUseCaseImpl implements FindProductsByFilterUseCase {

  @override
  Future<ProductsByFilterResult> execute(
      ProductsByFilterParams params) async {
    try {
      var products = await _findProductsByFilter(params);

      if (products != null && products.isNotEmpty) {
        return ProductsByFilterResult(
          products,
          products.length,
        );
      }

    } catch (e) {
      throw EmptyProductsException();
    }
    return ProductsByFilterResult([],0);
  }

  Future<List<Product>> _findProductsByFilter(
      ProductsByFilterParams params) async {
    List<Product> products;
    if (params.filterByCategory) {
      RemoteProductRepository productRepository = sl();
      products =
          await productRepository.getProducts(categoryId: params.category.id);
    }
    return products;
  }
}

class EmptyProductsException implements Exception {}
