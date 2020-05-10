import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:openflutterecommerce/data/woocommerce/models/promo_code_model.dart';
import 'package:openflutterecommerce/domain/entities/promo/promo_code_entity.dart';

import '../../../fixtures/fixture_reader.dart';


void main() {
  final promoCodeModel = PromoCodeModel(
    id:101,
    title: 'Ten Percent Discount',
    discountPercent: 10.0,
    promoCode: 'ten_percent',
    dateExpires: DateTime.parse('2022-05-24T00:00:00')
  );

  group('extend Entity', () {
    test(
      'should be a subclass of PromoCodeEntity entity',
      () async {
        // assert
        expect(promoCodeModel, isA<PromoCodeEntity>());
      },
    );
  });

  group('fromJson', () {
    test(
      'should return a valid model',
      () async {
        // arrange
        final jsonMap =
            json.decode(fixture('woocommerce/promo.json'));
        // act
        final result = PromoCodeModel.fromJson(jsonMap[0]);
        // assert
        expect(result, promoCodeModel);
      },
    );
  });

  group('toJson', () {
    test(
      'should return a JSON map with proper data',
      () async {
        // act
        final result = promoCodeModel.toJson();
        // assert
        final expectedMap = {
          'id':101,
          'code':'ten_percent',
          'amount':10.0,
          'discount_type':'percent',
          'description':'Ten Percent Discount',
          'date_expires':'2022-05-24T00:00:00'
        };
        expect(result, expectedMap);
      },
    );
  });
}
