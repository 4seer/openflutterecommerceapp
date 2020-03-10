import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:openflutterecommerce/data/local/delivery/delivery_method_data_source.dart';
import 'package:openflutterecommerce/domain/entities/delivery/delivery_method_entity.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  group('Test DeliveryMethod Data Source', () {
    DeliveryMethodDataSource dataSource;

    setUp(() async {
      dataSource = DeliveryMethodDataSource();
      await dataSource.open();
    });

    test('test: insert and get a record in DeliveryMethod table', () async {
      DeliveryMethodEntity data =
          DeliveryMethodEntity(id: 1, title: 'Title 1', price: 999.99);
      await dataSource.insert(data);

      DeliveryMethodEntity insertedData = await dataSource.get(data.id);
      expect(data == insertedData, true);
    });

    test('test: update a record in DeliveryMethod table', () async {
      DeliveryMethodEntity data =
          DeliveryMethodEntity(id: 1, title: 'Title 1', price: 999.99);
      await dataSource.insert(data);

      DeliveryMethodEntity insertedData = await dataSource.get(data.id);

      DeliveryMethodEntity dataToUpdate = DeliveryMethodEntity(
          id: insertedData.id, title: 'Title 2', price: 1024);

      await dataSource.update(dataToUpdate);

      DeliveryMethodEntity updatedData = await dataSource.get(dataToUpdate.id);
      expect(dataToUpdate == updatedData, true);
    });

    test('test: delete all records in DeliveryMethod table', () async {
      await dataSource
          .insert(DeliveryMethodEntity(id: 1, title: 'Title 1', price: 999.99));
      await dataSource
          .insert(DeliveryMethodEntity(id: 2, title: 'Title 2', price: 1024));
      await dataSource
          .insert(DeliveryMethodEntity(id: 3, title: 'Title 3', price: 3000));

      await dataSource.deleteAll();

      List<DeliveryMethodEntity> allRecords = await dataSource.all();
      expect(allRecords.isEmpty, true);
    });

    test('test: delete a record in DeliveryMethod table', () async {
      await dataSource.deleteAll();

      await dataSource
          .insert(DeliveryMethodEntity(id: 1, title: 'Title 1', price: 999.99));

      await dataSource.delete(1);

      List<DeliveryMethodEntity> allRecords = await dataSource.all();
      expect(allRecords.isEmpty, true);
    });

    test('test: get all records in DeliveryMethod table', () async {
      await dataSource.deleteAll();

      await dataSource
          .insert(DeliveryMethodEntity(id: 1, title: 'Title 1', price: 999.99));
      await dataSource
          .insert(DeliveryMethodEntity(id: 2, title: 'Title 2', price: 599));
      await dataSource
          .insert(DeliveryMethodEntity(id: 3, title: 'Title 3', price: 977.99));
      List<DeliveryMethodEntity> allRecords = await dataSource.all();
      expect(allRecords.length == 3, true);
    });

    tearDown(() async {
      await dataSource.close();
    });
  });
}
