import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:openflutterecommerce/data/abstract/model/filter_rules.dart';
import 'package:openflutterecommerce/data/abstract/model/product.dart';
import 'package:openflutterecommerce/data/woocommerce/repositories/product_remote_repository.dart';
import 'package:openflutterecommerce/data/woocommerce/repositories/woocommerce_wrapper.dart';

import '../../../fixtures/fixture_reader.dart';

class MockWoocommerceWrapper extends Mock implements WoocommercWrapperAbastract { }

void main() {
  MockWoocommerceWrapper woocommerce;
  RemoteProductRepository remoteProductRepository;

  setUp(() {
    woocommerce = MockWoocommerceWrapper();
    remoteProductRepository = RemoteProductRepository(woocommerce: woocommerce);
  });
  group('Generate selectable attributes from list of products', () {
    test(
      'should return list of categories when findProductsByFilterUseCase.execute is successful',
      () async {
        // arrange
        when(woocommerce.getProductList(any))
          .thenAnswer((_) async => json.decode(fixture('woocommerce/products.json'))
        );
        // act
        List<Product> products =
            await remoteProductRepository.getProducts(categoryId: 1);
        FilterRules filterRules = FilterRules.getSelectableAttributes(products);
        // assert
        expect(filterRules.categories.length, equals(6));
        expect(filterRules.selectedPriceRange.maxPrice, equals(35));
        expect(filterRules.selectedPriceRange.minPrice, equals(0));
        expect(filterRules.selectableAttributes.length, equals(2));
        expect(filterRules.hashTags.length, equals(4));
      },
    );
  });
}
    