import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:mockito/mockito.dart';
import 'package:openflutterecommerce/data/abstract/product_repository.dart';
import 'package:openflutterecommerce/data/error/exceptions.dart';
import 'package:openflutterecommerce/data/woocommerce/repositories/product_remote_repository.dart';
import 'package:openflutterecommerce/data/woocommerce/repositories/woocommerce_wrapper.dart';
import 'package:openflutterecommerce/domain/usecases/products/find_products_by_filter_use_case.dart';
import 'package:openflutterecommerce/domain/usecases/products/products_by_filter_params.dart';

import '../../../fixtures/fixture_reader.dart';

class MockWoocommerceWrapper extends Mock implements WoocommercWrapperAbastract { }

void main() {
  MockWoocommerceWrapper woocommerce;
  FindProductsByFilterUseCase findProductsByFilterUseCase;
  ProductsByFilterParams productsByFilterParams;
  
  final sl = GetIt.instance;  

  sl.registerLazySingleton<WoocommercWrapperAbastract>(
    () => woocommerce,
  );
  
  sl.registerLazySingleton<ProductRepository>(
    () => RemoteProductRepository(woocommerce: sl()),
  );
  
  setUp(() {
    woocommerce = MockWoocommerceWrapper();
    findProductsByFilterUseCase = FindProductsByFilterUseCaseImpl();
    
    productsByFilterParams = ProductsByFilterParams(
      categoryId: 1
    );
  });
  group('Get list of products ', () {
    test(
      'should return list of categories when findProductsByFilterUseCase.execute is successful',
      () async {
        // arrange
        when(woocommerce.getProductList(any))
          .thenAnswer((_) async => json.decode(fixture('woocommerce/products.json'))
        );
        // act
        final productsData = await findProductsByFilterUseCase.execute(productsByFilterParams);
        // assert
        expect(productsData.products.length, equals(10));
      },
    );
    
    test(
      'should return server failure when findProductsByFilterUseCase.execute is unsuccessful',
      () async {
        // arrange
        when(woocommerce.getProductList(any))
            .thenThrow(HttpRequestException());
        // act
        final productsData = await findProductsByFilterUseCase.execute(productsByFilterParams);
        // assert
        expect(productsData.validResults, equals(false));
        expect(productsData.exception, isInstanceOf<EmptyProductsException>());
      },
    );

  });
  
}
    