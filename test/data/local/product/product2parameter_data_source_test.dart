import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:openflutterecommerce/data/local/product/product2parameter_data_source.dart';
import 'package:openflutterecommerce/domain/entities/product/product2parameter_entity.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  group('Test Product2Parameter Data Source', () {
    Product2ParameterDataSource dataSource;

    setUp(() async {
      dataSource = Product2ParameterDataSource();
      await dataSource.open();
    });

    test('test: insert and get a record in product2parameter table', () async {
      Product2ParameterEntity data = Product2ParameterEntity(
        id: 1,
        productParameterId: 1,
        productId: 1,
      );
      await dataSource.insert(data);

      Product2ParameterEntity insertedData = await dataSource.get(data.id);
      expect(data == insertedData, true);
    });

    test('test: update a record in product2parameter table', () async {
      Product2ParameterEntity data = Product2ParameterEntity(
        id: 1,
        productParameterId: 1,
        productId: 1,
      );
      await dataSource.insert(data);

      Product2ParameterEntity insertedData = await dataSource.get(data.id);

      Product2ParameterEntity dataToUpdate = Product2ParameterEntity(
        id: insertedData.id,
        productParameterId: 1,
        productId: 1,
      );

      await dataSource.update(dataToUpdate);

      Product2ParameterEntity updatedData =
          await dataSource.get(dataToUpdate.id);
      expect(dataToUpdate == updatedData, true);
    });

    test('test: delete all records in product2parameter table', () async {
      await dataSource.insert(Product2ParameterEntity(
        id: 1,
        productParameterId: 1,
        productId: 1,
      ));
      await dataSource.insert(Product2ParameterEntity(
        id: 2,
        productParameterId: 2,
        productId: 2,
      ));
      await dataSource.insert(Product2ParameterEntity(
        id: 3,
        productParameterId: 3,
        productId: 3,
      ));

      await dataSource.deleteAll();

      List<Product2ParameterEntity> allData = await dataSource.all();
      expect(allData.isEmpty, true);
    });

    test('test: delete a record in product2parameter table', () async {
      await dataSource.deleteAll();

      await dataSource.insert(Product2ParameterEntity(
        id: 1,
        productParameterId: 1,
        productId: 1,
      ));

      await dataSource.delete(1);

      List<Product2ParameterEntity> allData = await dataSource.all();
      expect(allData.isEmpty, true);
    });

    test('test: get all records in product2parameter table', () async {
      await dataSource.deleteAll();

      await dataSource.insert(Product2ParameterEntity(
        id: 1,
        productParameterId: 1,
        productId: 1,
      ));
      await dataSource.insert(Product2ParameterEntity(
        id: 2,
        productParameterId: 2,
        productId: 2,
      ));
      await dataSource.insert(Product2ParameterEntity(
        id: 3,
        productParameterId: 3,
        productId: 3,
      ));

      List<Product2ParameterEntity> allData = await dataSource.all();
      expect(allData.length == 3, true);
    });

    tearDown(() async {
      await dataSource.close();
    });
  });
}
