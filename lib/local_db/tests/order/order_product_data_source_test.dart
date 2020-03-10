import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:openflutterecommerce/local_db/features/order/data_sources/order_product_data_source.dart';
import 'package:openflutterecommerce/local_db/features/order/entities/order_product_entity.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  group('Test OrderProduct Data Source', () {
    OrderProductDataSource dataSource;

    setUp(() async {
      dataSource = OrderProductDataSource();
      await dataSource.open();
    });

    test('test: insert and get a record in OrderProduct table', () async {
      OrderProductEntity data = OrderProductEntity(
          id: 1,
          productId: 1,
          productCount: 2,
          totalPrice: 5000.00,
          title: 'Shoe',
          discountPercent: 3.33,
          thumb: 'https://example.com/thumb.png');
      await dataSource.insert(data);

      OrderProductEntity insertedData = await dataSource.get(data.id);
      expect(data == insertedData, true);
    });

    test('test: update a record in OrderProduct table', () async {
      OrderProductEntity data = OrderProductEntity(
          id: 1,
          productId: 1,
          productCount: 2,
          totalPrice: 5000.00,
          title: 'Shoe',
          discountPercent: 3.33,
          thumb: 'https://example.com/thumb.png');
      await dataSource.insert(data);

      OrderProductEntity insertedData = await dataSource.get(data.id);

      OrderProductEntity dataToUpdate = OrderProductEntity(
          id: insertedData.id,
          productId: 1,
          productCount: 3,
          totalPrice: 7250.00,
          title: 'Shoe',
          discountPercent: 3.33,
          thumb: 'https://example.com/thumb.png');

      await dataSource.update(dataToUpdate);

      OrderProductEntity updatedData = await dataSource.get(dataToUpdate.id);
      expect(dataToUpdate == updatedData, true);
    });

    test('test: delete all records in OrderProduct table', () async {
      await dataSource.insert(OrderProductEntity(
          id: 1,
          productId: 1,
          productCount: 2,
          totalPrice: 5000.00,
          title: 'Shoe',
          discountPercent: 3.33,
          thumb: 'https://example.com/thumb.png'));
      await dataSource.insert(OrderProductEntity(
          id: 2,
          productId: 1,
          productCount: 2,
          totalPrice: 100.00,
          title: 'Watch',
          discountPercent: 2.7,
          thumb: 'https://example.com/thumb2.png'));
      await dataSource.insert(OrderProductEntity(
          id: 3,
          productId: 1,
          productCount: 1,
          totalPrice: 120.00,
          title: 'Bag',
          discountPercent: 0.00,
          thumb: 'https://example.com/thumb3.png'));

      await dataSource.deleteAll();

      List<OrderProductEntity> allRecords = await dataSource.all();
      expect(allRecords.length == 0, true);
    });

    test('test: delete a record in OrderProduct table', () async {
      await dataSource.deleteAll();

      await dataSource.insert(OrderProductEntity(
          id: 1,
          productId: 1,
          productCount: 2,
          totalPrice: 5000.00,
          title: 'Shoe',
          discountPercent: 3.33,
          thumb: 'https://example.com/thumb.png'));

      await dataSource.delete(1);

      List<OrderProductEntity> allRecords = await dataSource.all();
      expect(allRecords.length == 0, true);
    });

    test('test: get all records in OrderProduct table', () async {
      await dataSource.deleteAll();

      await dataSource.insert(OrderProductEntity(
          id: 1,
          productId: 1,
          productCount: 2,
          totalPrice: 5000.00,
          title: 'Shoe',
          discountPercent: 3.33,
          thumb: 'https://example.com/thumb.png'));
      await dataSource.insert(OrderProductEntity(
          id: 2,
          productId: 1,
          productCount: 2,
          totalPrice: 100.00,
          title: 'Watch',
          discountPercent: 2.7,
          thumb: 'https://example.com/thumb2.png'));
      await dataSource.insert(OrderProductEntity(
          id: 3,
          productId: 1,
          productCount: 1,
          totalPrice: 120.00,
          title: 'Bag',
          discountPercent: 0.00,
          thumb: 'https://example.com/thumb3.png'));
      List<OrderProductEntity> allRecords = await dataSource.all();
      expect(allRecords.length == 3, true);
    });

    tearDown(() async {
      await dataSource.close();
    });
  });
}
