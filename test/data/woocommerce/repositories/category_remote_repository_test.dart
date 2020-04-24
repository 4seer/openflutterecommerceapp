import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:openflutterecommerce/data/error/exceptions.dart';
import 'package:openflutterecommerce/data/network/network_status.dart';
import 'package:openflutterecommerce/data/woocommerce/repositories/category_remote_repository.dart';
import 'package:openflutterecommerce/data/woocommerce/repositories/woocommerce_wrapper.dart';

import '../../../fixtures/fixture_reader.dart';

class MockWoocommerceWrapper extends Mock
    implements WoocommercWrapperAbastract {}

class MockNetworkStatus extends Mock implements NetworkStatus {}

void main() {
  MockWoocommerceWrapper woocommerce;
  MockNetworkStatus mockNetworkStatus;
  RemoteCategoryRepository remoteCategoryRepository;

  setUp(() {
    woocommerce = MockWoocommerceWrapper();
    mockNetworkStatus = MockNetworkStatus();
    remoteCategoryRepository =
        RemoteCategoryRepository(woocommerce: woocommerce);
  });

  void runTestsOnline(Function body) {
    group('device is online', () {
      setUp(() {
        when(mockNetworkStatus.isConnected).thenAnswer((_) async => true);
      });

      body();
    });
  }

  group('Get list of categories ', () {
    runTestsOnline(() async {
      test(
        'should return list of categories when getCategories is successful',
        () async {
          // arrange
          when(woocommerce.getCategoryList()).thenAnswer(
              (_) async => json.decode(fixture('woocommerce/categories.json')));
          // act
          final categories = await remoteCategoryRepository.getCategories();
          // assert
          expect(categories.length, equals(2));
        },
      );

      test(
        'should return server failure when getCategories is unsuccessful',
        () async {
          // arrange
          when(woocommerce.getCategoryList()).thenThrow(HttpRequestException());
          // act
          // assert
          //verify(woocommerce.getCategoryList());
          expect(() => remoteCategoryRepository.getCategories(),
              throwsA(isInstanceOf<RemoteServerException>()));
        },
      );
    });
  });
}
