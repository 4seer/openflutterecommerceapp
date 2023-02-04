import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:openflutterecommerce/data/local/hashtag/product_hashtag_data_source.dart';
import 'package:openflutterecommerce/domain/entities/hashtag/product_hashtag_entity.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  group('Test ProductHashTag Data Source', () {
    late ProductHashTagDataSource dataSource;

    setUp(() async {
      dataSource = ProductHashTagDataSource();
      await dataSource.open();
    });

    test('test: insert and get a record in ProductHashTag table', () async {
      ProductHashTagEntity data =
          ProductHashTagEntity(id: 1, hashTagId: 1, productId: 1);
      await dataSource.insert(data);

      ProductHashTagEntity insertedData = await dataSource.get(data.id);
      expect(data == insertedData, true);
    });

    test('test: update a record in ProductHashTag table', () async {
      ProductHashTagEntity data =
          ProductHashTagEntity(id: 1, hashTagId: 1, productId: 1);
      await dataSource.insert(data);

      ProductHashTagEntity insertedData = await dataSource.get(data.id);

      ProductHashTagEntity dataToUpdate =
          ProductHashTagEntity(id: insertedData.id, hashTagId: 1, productId: 2);

      await dataSource.update(dataToUpdate);

      ProductHashTagEntity updatedData = await dataSource.get(dataToUpdate.id);
      expect(dataToUpdate == updatedData, true);
    });

    test('test: delete all records in ProductHashTag table', () async {
      await dataSource
          .insert(ProductHashTagEntity(id: 1, hashTagId: 1, productId: 1));
      await dataSource
          .insert(ProductHashTagEntity(id: 2, hashTagId: 1, productId: 2));
      await dataSource
          .insert(ProductHashTagEntity(id: 3, hashTagId: 1, productId: 3));

      await dataSource.deleteAll();

      List<ProductHashTagEntity> allRecords = await dataSource.all();
      expect(allRecords.isEmpty, true);
    });

    test('test: delete a record in ProductHashTag table', () async {
      await dataSource.deleteAll();

      await dataSource
          .insert(ProductHashTagEntity(id: 1, hashTagId: 1, productId: 1));

      await dataSource.delete(1);

      List<ProductHashTagEntity> allRecords = await dataSource.all();
      expect(allRecords.isEmpty, true);
    });

    test('test: get all records in ProductHashTag table', () async {
      await dataSource.deleteAll();

      await dataSource
          .insert(ProductHashTagEntity(id: 1, hashTagId: 1, productId: 3));
      await dataSource
          .insert(ProductHashTagEntity(id: 2, hashTagId: 1, productId: 4));
      await dataSource
          .insert(ProductHashTagEntity(id: 3, hashTagId: 4, productId: 7));
      List<ProductHashTagEntity> allRecords = await dataSource.all();
      expect(allRecords.length == 3, true);
    });

    tearDown(() async {
      await dataSource.close();
    });
  });
}
