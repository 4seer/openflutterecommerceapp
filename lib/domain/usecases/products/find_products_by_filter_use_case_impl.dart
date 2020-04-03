import 'package:dartz/dartz.dart';
import 'package:openflutterecommerce/data/abstract/model/product.dart';
import 'package:openflutterecommerce/data/abstract/product_repository.dart';
import 'package:openflutterecommerce/domain/usecases/base_use_case.dart';
import 'package:openflutterecommerce/domain/usecases/products/find_products_by_filter_use_case.dart';
import 'package:openflutterecommerce/domain/usecases/products/products_by_filter_params.dart';
import 'package:openflutterecommerce/domain/usecases/products/products_by_filter_result.dart';

class FindProductsByFilterUseCaseImpl implements FindProductsByFilterUseCase {
  final ProductRepository productRepository;

  FindProductsByFilterUseCaseImpl(
    this.productRepository,
  );

  @override
  Future<Either<Failure, ProductsByFilterResult>> execute(
      ProductsByFilterParams params) async {
    try {
      var products = await _findProductsByFilter(params);

      if (products != null && products.isNotEmpty) {
        return Right(ProductsByFilterResult(
          products,
          products.length,
        ));
      }

      return Left(Failure(EmptyProductsException()));
    } catch (e) {
      return Left(Failure(e));
    }
  }

  Future<List<Product>> _findProductsByFilter(
      ProductsByFilterParams params) async {
    List<Product> products;
    if (params.filterByCategory) {
      products =
          await productRepository.getProducts(categoryId: params.category.id);
    }
    return products;
  }
}

class EmptyProductsException implements Exception {}
