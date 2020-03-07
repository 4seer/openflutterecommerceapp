import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:openflutterecommerce/local_db/order/data_sources/orderproductparameter_data_source.dart';
import 'package:openflutterecommerce/local_db/order/entities/orderproductparameter_entity.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  group('Test OrderProductParameter Data Source', () {
    OrderProductParameterDataSource dataSource;

    setUp(() async {
      dataSource = OrderProductParameterDataSource();
    });

    test('test: insert and get a record in OrderProductParameter table',
        () async {
      OrderProductParameterEntity data = OrderProductParameterEntity(
          id: 1, productId: 1, parameterId: 1, parameterValueId: 1);
      await dataSource.insert(data);

      OrderProductParameterEntity insertedData = await dataSource.get(data.id);
      print(insertedData);
      expect(data == insertedData, true);
    });

    test('test: update a record in OrderProductParameter table', () async {
      OrderProductParameterEntity data = OrderProductParameterEntity(
          id: 1, productId: 1, parameterId: 1, parameterValueId: 1);
      await dataSource.insert(data);

      OrderProductParameterEntity insertedData = await dataSource.get(data.id);

      OrderProductParameterEntity dataToUpdate = OrderProductParameterEntity(
          id: insertedData.id,
          productId: 1,
          parameterId: 2,
          parameterValueId: 2);

      await dataSource.update(dataToUpdate);

      OrderProductParameterEntity updatedData =
          await dataSource.get(dataToUpdate.id);
      expect(dataToUpdate == updatedData, true);
    });

    test('test: delete all records in OrderProductParameter table', () async {
      await dataSource.insert(OrderProductParameterEntity(
          id: 1, productId: 1, parameterId: 1, parameterValueId: 1));
      await dataSource.insert(OrderProductParameterEntity(
          id: 2, productId: 1, parameterId: 2, parameterValueId: 2));
      await dataSource.insert(OrderProductParameterEntity(
          id: 3, productId: 1, parameterId: 3, parameterValueId: 3));

      await dataSource.deleteAll();

      List<OrderProductParameterEntity> allRecords = await dataSource.all();
      expect(allRecords.length == 0, true);
    });

    test('test: delete a record in OrderProductParameter table', () async {
      await dataSource.deleteAll();

      await dataSource.insert(OrderProductParameterEntity(
          id: 1, productId: 1, parameterId: 1, parameterValueId: 1));

      await dataSource.delete(1);

      List<OrderProductParameterEntity> allRecords = await dataSource.all();
      expect(allRecords.length == 0, true);
    });

    test('test: get all records in OrderProductParameter table', () async {
      await dataSource.deleteAll();

      await dataSource.insert(OrderProductParameterEntity(
          id: 1, productId: 1, parameterId: 1, parameterValueId: 1));
      await dataSource.insert(OrderProductParameterEntity(
          id: 2, productId: 1, parameterId: 2, parameterValueId: 2));
      await dataSource.insert(OrderProductParameterEntity(
          id: 3, productId: 1, parameterId: 3, parameterValueId: 3));
      List<OrderProductParameterEntity> allRecords = await dataSource.all();
      expect(allRecords.length == 3, true);
    });
  });
}
