import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:openflutterecommerce/data/local/cart/product_cart_data_source.dart';
import 'package:openflutterecommerce/domain/entities/cart/product_cart_entity.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  group('Test ProductCart Data Source', () {
    late ProductCartDataSource dataSource;

    setUp(() async {
      dataSource = ProductCartDataSource();
      await dataSource.open();
    });

    test('test: insert and get a record in productcart table', () async {
      ProductCartEntity data = ProductCartEntity(
          id: 1, productId: 1, productCount: 5, totalPrice: 999.99);
      await dataSource.insert(data);

      ProductCartEntity insertedData = await dataSource.get(data.id);
      expect(data == insertedData, true);
    });

    test('test: update a record in productcart table', () async {
      ProductCartEntity data = ProductCartEntity(
          id: 1, productId: 1, productCount: 5, totalPrice: 999.99);
      await dataSource.insert(data);

      ProductCartEntity insertedData = await dataSource.get(data.id);

      ProductCartEntity dataToUpdate = ProductCartEntity(
          id: insertedData.id,
          productId: 1,
          productCount: 5,
          totalPrice: 899.99);

      await dataSource.update(dataToUpdate);

      ProductCartEntity updatedData = await dataSource.get(dataToUpdate.id);
      expect(dataToUpdate == updatedData, true);
    });

    test('test: delete all records in productcart table', () async {
      await dataSource.insert(ProductCartEntity(
          id: 1, productId: 1, productCount: 5, totalPrice: 999.99));
      await dataSource.insert(ProductCartEntity(
          id: 2, productId: 1, productCount: 3, totalPrice: 899.99));
      await dataSource.insert(ProductCartEntity(
          id: 3, productId: 1, productCount: 1, totalPrice: 235.00));

      await dataSource.deleteAll();

      List<ProductCartEntity> allData = await dataSource.all();
      expect(allData.isEmpty, true);
    });

    test('test: delete a record in productcart table', () async {
      await dataSource.deleteAll();

      await dataSource.insert(ProductCartEntity(
          id: 1, productId: 1, productCount: 5, totalPrice: 999.99));

      await dataSource.delete(1);

      List<ProductCartEntity> allData = await dataSource.all();
      expect(allData.isEmpty, true);
    });

    test('test: get all records in productcart table', () async {
      await dataSource.deleteAll();

      await dataSource.insert(ProductCartEntity(
          id: 1, productId: 1, productCount: 5, totalPrice: 999.99));
      await dataSource.insert(ProductCartEntity(
          id: 2, productId: 1, productCount: 3, totalPrice: 899.99));
      await dataSource.insert(ProductCartEntity(
          id: 3, productId: 1, productCount: 1, totalPrice: 235.00));
      List<ProductCartEntity> allData = await dataSource.all();
      expect(allData.length == 3, true);
    });

    tearDown(() async {
      await dataSource.close();
    });
  });
}
