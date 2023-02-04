import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:openflutterecommerce/data/local/product/product_parameter_data_source.dart';
import 'package:openflutterecommerce/domain/entities/product/product_parameter_entity.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  group('Test ProductParameter Data Source', () {
    late ProductParameterDataSource dataSource;

    setUp(() async {
      dataSource = ProductParameterDataSource();
      await dataSource.open();
    });

    test('test: insert and get a record in ProductParameter table', () async {
      ProductParameterEntity data = ProductParameterEntity(
        id: 1,
        title: 'title',
      );
      await dataSource.insert(data);

      ProductParameterEntity insertedData = await dataSource.get(data.id);
      expect(data == insertedData, true);
    });

    test('test: update a record in ProductParameter table', () async {
      ProductParameterEntity data = ProductParameterEntity(
        id: 1,
        title: 'title',
      );
      await dataSource.insert(data);

      ProductParameterEntity insertedData = await dataSource.get(data.id);

      ProductParameterEntity dataToUpdate = ProductParameterEntity(
        id: insertedData.id,
        title: 'title',
      );

      await dataSource.update(dataToUpdate);

      ProductParameterEntity updatedData =
          await dataSource.get(dataToUpdate.id);
      expect(dataToUpdate == updatedData, true);
    });

    test('test: delete all records in ProductParameter table', () async {
      await dataSource.insert(ProductParameterEntity(
        id: 1,
        title: 'title',
      ));
      await dataSource.insert(ProductParameterEntity(
        id: 2,
        title: 'title',
      ));
      await dataSource.insert(ProductParameterEntity(
        id: 3,
        title: 'title',
      ));

      await dataSource.deleteAll();

      List<ProductParameterEntity> allRecords = await dataSource.all();
      expect(allRecords.isEmpty, true);
    });

    test('test: delete a record in ProductParameter table', () async {
      await dataSource.deleteAll();

      await dataSource.insert(ProductParameterEntity(
        id: 1,
        title: 'title',
      ));

      await dataSource.delete(1);

      List<ProductParameterEntity> allRecords = await dataSource.all();
      expect(allRecords.isEmpty, true);
    });

    test('test: get all records in ProductParameter table', () async {
      await dataSource.deleteAll();

      await dataSource.insert(ProductParameterEntity(
        id: 1,
        title: 'title',
      ));
      await dataSource.insert(ProductParameterEntity(
        id: 2,
        title: 'title',
      ));
      await dataSource.insert(ProductParameterEntity(
        id: 3,
        title: 'title',
      ));

      List<ProductParameterEntity> allRecords = await dataSource.all();
      expect(allRecords.length == 3, true);
    });

    tearDown(() async {
      await dataSource.close();
    });
  });
}
