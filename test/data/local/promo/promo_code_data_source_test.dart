import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:openflutterecommerce/data/local/promo/promo_code_data_source.dart';
import 'package:openflutterecommerce/domain/entities/promo/promo_code_entity.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  group('Test PromoCode Data Source', () {
    PromoCodeDataSource dataSource;

    setUp(() async {
      dataSource = PromoCodeDataSource();
      await dataSource.open();
    });

    test('test: insert and get a record in promocode table', () async {
      PromoCodeEntity data = PromoCodeEntity(
          id: 1,
          title: 'Promo Code',
          image: 'https://example.com/promocode.png',
          promoCode: '2344400',
          discountPercent: 39.33,
          belongsToUser: true,
          wasUsed: false);
      await dataSource.insert(data);

      PromoCodeEntity insertedData = await dataSource.get(data.id);
      expect(data == insertedData, true);
    });

    test('test: update a record in promocode table', () async {
      PromoCodeEntity data = PromoCodeEntity(
          id: 1,
          title: 'Promo Code',
          image: 'https://example.com/promocode.png',
          promoCode: '2344400',
          discountPercent: 39.33,
          belongsToUser: true,
          wasUsed: false);
      await dataSource.insert(data);

      PromoCodeEntity insertedData = await dataSource.get(data.id);

      PromoCodeEntity dataToUpdate = PromoCodeEntity(
          id: insertedData.id,
          title: 'Promo Code',
          image: 'https://example.com/promocode.png',
          promoCode: '2344400',
          discountPercent: 39.33,
          belongsToUser: true,
          wasUsed: true);

      await dataSource.update(dataToUpdate);

      PromoCodeEntity updatedData = await dataSource.get(dataToUpdate.id);
      expect(dataToUpdate == updatedData, true);
    });

    test('test: delete all records in promocode table', () async {
      await dataSource.insert(PromoCodeEntity(
          id: 1,
          title: 'Promo Code',
          image: 'https://example.com/promocode.png',
          promoCode: '2344400',
          discountPercent: 39.33,
          belongsToUser: true,
          wasUsed: false));
      await dataSource.insert(PromoCodeEntity(
          id: 2,
          title: 'Promo Code 2',
          image: 'https://example.com/promocode2.png',
          promoCode: '009343439',
          discountPercent: 39.33,
          belongsToUser: true,
          wasUsed: false));
      await dataSource.insert(PromoCodeEntity(
          id: 3,
          title: 'Promo Code 3',
          image: 'https://example.com/promocode3.png',
          promoCode: '11232233',
          discountPercent: 39.33,
          belongsToUser: true,
          wasUsed: false));

      await dataSource.deleteAll();

      List<PromoCodeEntity> allData = await dataSource.all();
      expect(allData.isEmpty, true);
    });

    test('test: delete a record in promocode table', () async {
      await dataSource.deleteAll();

      await dataSource.insert(PromoCodeEntity(
          id: 1,
          title: 'Promo Code',
          image: 'https://example.com/promocode.png',
          promoCode: '2344400',
          discountPercent: 39.33,
          belongsToUser: true,
          wasUsed: false));

      await dataSource.delete(1);

      List<PromoCodeEntity> allData = await dataSource.all();
      expect(allData.isEmpty, true);
    });

    test('test: get all records in promocode table', () async {
      await dataSource.deleteAll();

      await dataSource.insert(PromoCodeEntity(
          id: 1,
          title: 'Promo Code',
          image: 'https://example.com/promocode.png',
          promoCode: '2344400',
          discountPercent: 39.33,
          belongsToUser: true,
          wasUsed: false));
      await dataSource.insert(PromoCodeEntity(
          id: 2,
          title: 'Promo Code 2',
          image: 'https://example.com/promocode2.png',
          promoCode: '009343439',
          discountPercent: 39.33,
          belongsToUser: true,
          wasUsed: false));
      await dataSource.insert(PromoCodeEntity(
          id: 3,
          title: 'Promo Code 3',
          image: 'https://example.com/promocode3.png',
          promoCode: '11232233',
          discountPercent: 39.33,
          belongsToUser: true,
          wasUsed: false));
      List<PromoCodeEntity> allData = await dataSource.all();
      expect(allData.length == 3, true);
    });

    tearDown(() async {
      await dataSource.close();
    });
  });
}
