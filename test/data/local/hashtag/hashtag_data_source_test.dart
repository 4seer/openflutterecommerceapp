import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:openflutterecommerce/data/local/hashtag/hashtag_data_source.dart';
import 'package:openflutterecommerce/domain/entities/hashtag/hashtag_entity.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  group('Test HashTag Data Source', () {
    late HashTagDataSource dataSource;

    setUp(() async {
      dataSource = HashTagDataSource();
      await dataSource.open();
    });

    test('test: insert and get a record in HashTag table', () async {
      HashTagEntity data = HashTagEntity(
        id: 1,
        title: 'Title 1',
      );
      await dataSource.insert(data);

      HashTagEntity insertedData = await dataSource.get(data.id);
      expect(data == insertedData, true);
    });

    test('test: update a record in HashTag table', () async {
      HashTagEntity data = HashTagEntity(
        id: 1,
        title: 'Title 1',
      );
      await dataSource.insert(data);

      HashTagEntity insertedData = await dataSource.get(data.id);

      HashTagEntity dataToUpdate = HashTagEntity(
        id: insertedData.id,
        title: 'Title 2',
      );

      await dataSource.update(dataToUpdate);

      HashTagEntity updatedData = await dataSource.get(dataToUpdate.id);
      expect(dataToUpdate == updatedData, true);
    });

    test('test: delete all records in HashTag table', () async {
      await dataSource.insert(HashTagEntity(
        id: 1,
        title: 'Title 1',
      ));
      await dataSource.insert(HashTagEntity(
        id: 2,
        title: 'Title 2',
      ));
      await dataSource.insert(HashTagEntity(
        id: 3,
        title: 'Title 3',
      ));

      await dataSource.deleteAll();

      List<HashTagEntity> allRecords = await dataSource.all();
      expect(allRecords.isEmpty, true);
    });

    test('test: delete a record in HashTag table', () async {
      await dataSource.deleteAll();

      await dataSource.insert(HashTagEntity(
        id: 1,
        title: 'Title 1',
      ));

      await dataSource.delete(1);

      List<HashTagEntity> allRecords = await dataSource.all();
      expect(allRecords.isEmpty, true);
    });

    test('test: get all records in HashTag table', () async {
      await dataSource.deleteAll();

      await dataSource.insert(HashTagEntity(
        id: 1,
        title: 'Title 1',
      ));
      await dataSource.insert(HashTagEntity(
        id: 2,
        title: 'Title 2',
      ));
      await dataSource.insert(HashTagEntity(
        id: 3,
        title: 'Title 3',
      ));
      List<HashTagEntity> allRecords = await dataSource.all();
      expect(allRecords.length == 3, true);
    });

    tearDown(() async {
      await dataSource.close();
    });
  });
}
