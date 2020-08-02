import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:openflutterecommerce/data/error/exceptions.dart';
import 'package:openflutterecommerce/domain/usecases/products/find_products_by_filter_use_case.dart';
import 'package:openflutterecommerce/domain/usecases/products/products_by_filter_params.dart';

import '../../../fixtures/fixture_reader.dart';
import '../use_case_test_include.dart';

void main() {
  FindProductsByFilterUseCase findProductsByFilterUseCase;
  ProductsByFilterParams productsByFilterParams;
  
  setupLocator();
  
  MockWoocommerceWrapper woocommerce = sl();
  
  setUp(() {
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
    