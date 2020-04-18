import 'dart:collection';

import 'package:openflutterecommerce/data/abstract/model/filter_rules.dart';
import 'package:openflutterecommerce/data/abstract/model/product.dart';
import 'package:openflutterecommerce/data/abstract/model/product_attribute.dart';
import 'package:openflutterecommerce/data/abstract/product_repository.dart';
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
        HashMap<ProductAttribute, List<String>> result = HashMap();
        products.forEach((product) => 
          product.selectableAttributes != null ?
            result.addAll({for (var attribute in product.selectableAttributes) attribute: []})
            : { }
          );
        return ProductsByFilterResult(  
          products,
          products.length,
          FilterRules(
            categories: HashMap(),
            selectedAttributes: result,
            selectedPriceRange: PriceRange(10, 100))
        );
      }

    } catch (e) {
      throw EmptyProductsException();
    }
    return ProductsByFilterResult([],0, FilterRules());
  }

  Future<List<Product>> _findProductsByFilter(
      ProductsByFilterParams params) async {
    List<Product> products;
    if (params.filterByCategory) {
      ProductRepository productRepository = sl();
      products =
          await productRepository.getProducts(categoryId: params.categoryId);
    }
    return products;
  }
}

class EmptyProductsException implements Exception {}