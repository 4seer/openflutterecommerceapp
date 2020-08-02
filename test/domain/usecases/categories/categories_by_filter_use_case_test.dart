import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:openflutterecommerce/data/error/exceptions.dart';
import 'package:openflutterecommerce/domain/usecases/categories/categories_by_filter_params.dart';
import 'package:openflutterecommerce/domain/usecases/categories/find_categories_by_filter_use_case.dart';

import '../../../fixtures/fixture_reader.dart';
import '../use_case_test_include.dart';

void main() {

  setupLocator();
  MockWoocommerceWrapper woocommerce;
  FindCategoriesByFilterUseCase findCategoriesByFilterUseCase;
  CategoriesByFilterParams categoriesByFilterParams;
  
  setUp(() {
    woocommerce = sl();
    findCategoriesByFilterUseCase = FindCategoriesByFilterUseCaseImpl();
    categoriesByFilterParams = CategoriesByFilterParams(
      categoryId: 1
    );
  });
  group('Get list of categories ', () {
    test(
      'should return list of categories when findCategoriesByFilterUseCase.execute is successful',
      () async {
        // arrange
        when(woocommerce.getCategoryList(parentId: 1))
          .thenAnswer((_) async => json.decode(fixture('woocommerce/categories.json'))
        );
        // act
        final categoriesData = await findCategoriesByFilterUseCase.execute(categoriesByFilterParams);
        // assert
        expect(categoriesData.categories.length, equals(2));
      },
    );

    test(
      'should return server failure when findProductsByFilterUseCase.execute is unsuccessful',
      () async {
        // arrange
        when(woocommerce.getCategoryList(parentId: 1))
            .thenThrow(HttpRequestException());
        // act
        final categoriesData = await findCategoriesByFilterUseCase.execute(categoriesByFilterParams);
        // assert
        expect(categoriesData.validResults, equals(false));
        expect(categoriesData.exception, isInstanceOf<EmptyCategoriesException>());
      },
    );

  });
  
}
    