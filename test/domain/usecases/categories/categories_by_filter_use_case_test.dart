import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:mockito/mockito.dart';
import 'package:openflutterecommerce/data/woocommerce/repositories/category_remote_repository.dart';
import 'package:openflutterecommerce/data/woocommerce/repositories/woocommerce_wrapper.dart';
import 'package:openflutterecommerce/domain/usecases/categories/categories_by_filter_params.dart';
import 'package:openflutterecommerce/domain/usecases/categories/categories_by_filter_result.dart';
import 'package:openflutterecommerce/domain/usecases/categories/find_categories_by_filter_use_case.dart';

import '../../../fixtures/fixture_reader.dart';

class MockWoocommerceWrapper extends Mock implements WoocommercWrapperAbastract { }

void main() {
  MockWoocommerceWrapper woocommerce;
  FindCategoriesByFilterUseCase findCategoriesByFilterUseCase;
  setUp(() {
    woocommerce = MockWoocommerceWrapper();
    
    final sl = GetIt.instance;  

    sl.registerLazySingleton<WoocommercWrapperAbastract>(
      () => woocommerce,
    );
    
    sl.registerLazySingleton<CategoryRepository>(
      () => RemoteCategoryRepository(woocommerce: sl()),
    );
    findCategoriesByFilterUseCase = FindCategoriesByFilterUseCaseImpl();
    
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
        final categoriesData = await findCategoriesByFilterUseCase.execute(
          CategoriesByFilterParams(
            categoryId: 1
          )
        );
        // assert
        expect(categoriesData.categories.length, equals(2));
      },
    );

  });
  
}
    