import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:openflutterecommerce/local_db/product/models/product2paramer_data.dart';
import 'package:openflutterecommerce/local_db/product/product2parameter_data_source.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  group('Test Product2Parameter Data Source', () {
    Product2ParameterDataSource dataSource;

    setUp(() async {
      dataSource = Product2ParameterDataSource();
    });

    test('test: insert and get a record in product2parameter table', () async {
      Product2ParameterData data = Product2ParameterData(
        id: 1,
        productParameterId: 1,
        productId: 1,
      );
      await dataSource.insert(data);

      Product2ParameterData insertedData = await dataSource.get(data.id);
      print(insertedData);
      expect(data == insertedData, true);
    });

    test('test: update a record in product2parameter table', () async {
      Product2ParameterData data = Product2ParameterData(
        id: 1,
        productParameterId: 1,
        productId: 1,
      );
      await dataSource.insert(data);

      Product2ParameterData insertedData = await dataSource.get(data.id);

      Product2ParameterData dataToUpdate = Product2ParameterData(
        id: insertedData.id,
        productParameterId: 1,
        productId: 1,
      );

      await dataSource.update(dataToUpdate);

      Product2ParameterData updatedData = await dataSource.get(dataToUpdate.id);
      expect(dataToUpdate == updatedData, true);
    });

    test('test: delete all records in product2parameter table', () async {
      await dataSource.insert(Product2ParameterData(
        id: 1,
        productParameterId: 1,
        productId: 1,
      ));
      await dataSource.insert(Product2ParameterData(
        id: 2,
        productParameterId: 2,
        productId: 2,
      ));
      await dataSource.insert(Product2ParameterData(
        id: 3,
        productParameterId: 3,
        productId: 3,
      ));

      await dataSource.deleteAll();

      List<Product2ParameterData> allData = await dataSource.all();
      expect(allData.length == 0, true);
    });

    test('test: delete a record in product2parameter table', () async {
      await dataSource.deleteAll();

      await dataSource.insert(Product2ParameterData(
        id: 1,
        productParameterId: 1,
        productId: 1,
      ));

      await dataSource.delete(1);

      List<Product2ParameterData> allData = await dataSource.all();
      expect(allData.length == 0, true);
    });

    test('test: get all records in product2parameter table', () async {
      await dataSource.deleteAll();

      await dataSource.insert(Product2ParameterData(
        id: 1,
        productParameterId: 1,
        productId: 1,
      ));
      await dataSource.insert(Product2ParameterData(
        id: 2,
        productParameterId: 2,
        productId: 2,
      ));
      await dataSource.insert(Product2ParameterData(
        id: 3,
        productParameterId: 3,
        productId: 3,
      ));

      List<Product2ParameterData> allData = await dataSource.all();
      expect(allData.length == 3, true);
    });
  });
}
