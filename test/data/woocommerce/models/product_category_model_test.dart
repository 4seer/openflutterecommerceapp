import 'dart:convert';


import 'package:flutter_test/flutter_test.dart';
import 'package:openflutterecommerce/data/woocommerce/models/product_category_model.dart';
import 'package:openflutterecommerce/domain/entities/product/product_category_entity.dart';

import '../../../fixtures/fixture_reader.dart';


void main() {
  final productCategoryModel = ProductCategoryModel(
      id: 18, 
      title: 'Albums',
      description: 'The best music albums available online.',
      image: 'https://woocommerce.openflutterproject.com/wp-content/uploads/2020/03/cd_4_angle.jpg',
      thumb: 'https://woocommerce.openflutterproject.com/wp-content/uploads/2020/03/cd_4_angle.jpg',
      parentId: 16,
      orderNumber: 0,
      count: 4
  );

  group('extend Entity', () {
    test(
      'should be a subclass of ProductCategoryEntity entity',
      () async {
        // assert
        expect(productCategoryModel, isA<ProductCategoryEntity>());
      },
    );
  });

  group('fromJson', () {
    test(
      'should return a valid model',
      () async {
        // arrange
        final Map<String, dynamic> jsonMap =
            json.decode(fixture('woocommerce/category.json'));
        // act
        final result = ProductCategoryModel.fromJson(jsonMap);
        // assert
        expect(result, productCategoryModel);
      },
    );
  });

  group('toJson', () {
    test(
      'should return a JSON map with proper data',
      () async {
        // act
        final result = productCategoryModel.toJson();
        // assert
        final expectedMap = {
            "id":18,
            "name":"Albums",
            "parent":16,
            "description":"The best music albums available online.",
            "image":
            {
                "src":"https://woocommerce.openflutterproject.com/wp-content/uploads/2020/03/cd_4_angle.jpg",
            },
            "menu_order":0,
            "count":4
        };
        expect(result, expectedMap);
      },
    );
  });
}
