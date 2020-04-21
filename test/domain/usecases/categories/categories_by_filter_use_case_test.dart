import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:mockito/mockito.dart';
import 'package:openflutterecommerce/data/error/exceptions.dart';
import 'package:openflutterecommerce/data/woocommerce/repositories/category_remote_repository.dart';
import 'package:openflutterecommerce/data/woocommerce/repositories/woocommerce_wrapper.dart';
import 'package:openflutterecommerce/domain/usecases/categories/categories_by_filter_params.dart';
import 'package:openflutterecommerce/domain/usecases/categories/find_categories_by_filter_use_case.dart';

import '../../../fixtures/fixture_reader.dart';

class MockWoocommerceWrapper extends Mock implements WoocommercWrapperAbastract { }

void main() {
  MockWoocommerceWrapper woocommerce;
  FindCategoriesByFilterUseCase findCategoriesByFilterUseCase;
  CategoriesByFilterParams categoriesByFilterParams;
  
  final sl = GetIt.instance;  

  sl.registerLazySingleton<WoocommercWrapperAbastract>(
    () => woocommerce,
  );
  
  sl.registerLazySingleton<CategoryRepository>(
    () => RemoteCategoryRepository(woocommerce: sl()),
  );
  
  setUp(() {
    woocommerce = MockWoocommerceWrapper();
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
        when(woocommerce.getCategoryList())
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
        when(woocommerce.getCategoryList())
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
    