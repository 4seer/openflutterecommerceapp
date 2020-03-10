import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:openflutterecommerce/data/local/hashtag/category_hashtag_data_source.dart';
import 'package:openflutterecommerce/domain/entities/hashtag/category_hashtag_entity.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  group('Test CategoryHashTag Data Source', () {
    CategoryHashTagDataSource dataSource;

    setUp(() async {
      dataSource = CategoryHashTagDataSource();
      await dataSource.open();
    });

    test('test: insert and get a record in CategoryHashTag table', () async {
      CategoryHashTagEntity data =
          CategoryHashTagEntity(id: 1, hashTagId: 1, categoryId: 1);
      await dataSource.insert(data);

      CategoryHashTagEntity insertedData = await dataSource.get(data.id);
      expect(data == insertedData, true);
    });

    test('test: update a record in CategoryHashTag table', () async {
      CategoryHashTagEntity data =
          CategoryHashTagEntity(id: 1, hashTagId: 1, categoryId: 1);
      await dataSource.insert(data);

      CategoryHashTagEntity insertedData = await dataSource.get(data.id);

      CategoryHashTagEntity dataToUpdate = CategoryHashTagEntity(
          id: insertedData.id, hashTagId: 1, categoryId: 2);

      await dataSource.update(dataToUpdate);

      CategoryHashTagEntity updatedData = await dataSource.get(dataToUpdate.id);
      expect(dataToUpdate == updatedData, true);
    });

    test('test: delete all records in CategoryHashTag table', () async {
      await dataSource
          .insert(CategoryHashTagEntity(id: 1, hashTagId: 1, categoryId: 1));
      await dataSource
          .insert(CategoryHashTagEntity(id: 2, hashTagId: 1, categoryId: 2));
      await dataSource
          .insert(CategoryHashTagEntity(id: 3, hashTagId: 1, categoryId: 3));

      await dataSource.deleteAll();

      List<CategoryHashTagEntity> allRecords = await dataSource.all();
      expect(allRecords.length == 0, true);
    });

    test('test: delete a record in CategoryHashTag table', () async {
      await dataSource.deleteAll();

      await dataSource
          .insert(CategoryHashTagEntity(id: 1, hashTagId: 1, categoryId: 1));

      await dataSource.delete(1);

      List<CategoryHashTagEntity> allRecords = await dataSource.all();
      expect(allRecords.length == 0, true);
    });

    test('test: get all records in CategoryHashTag table', () async {
      await dataSource.deleteAll();

      await dataSource
          .insert(CategoryHashTagEntity(id: 1, hashTagId: 1, categoryId: 3));
      await dataSource
          .insert(CategoryHashTagEntity(id: 2, hashTagId: 1, categoryId: 4));
      await dataSource
          .insert(CategoryHashTagEntity(id: 3, hashTagId: 4, categoryId: 7));
      List<CategoryHashTagEntity> allRecords = await dataSource.all();
      expect(allRecords.length == 3, true);
    });

    tearDown(() async {
      await dataSource.close();
    });
  });
}
