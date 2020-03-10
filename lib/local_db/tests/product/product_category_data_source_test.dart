import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:openflutterecommerce/local_db/features/product/data_sources/product_category_data_source.dart';
import 'package:openflutterecommerce/local_db/features/product/entities/product_category_entity.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  group('Test ProductCategory Data Source', () {
    ProductCategoryDataSource dataSource;

    setUp(() async {
      dataSource = ProductCategoryDataSource();
      await dataSource.open();
    });

    test('test: insert and get a record in ProductCategory table', () async {
      ProductCategoryEntity data = ProductCategoryEntity(
          id: 1,
          title: 'title',
          description: 'This is the description',
          image: 'https://example.com/image.png',
          thumb: 'https://example.com/thumb.png',
          parentId: 1);
      await dataSource.insert(data);

      ProductCategoryEntity insertedData = await dataSource.get(data.id);
      expect(data == insertedData, true);
    });

    test('test: update a record in ProductCategory table', () async {
      ProductCategoryEntity data = ProductCategoryEntity(
          id: 1,
          title: 'title',
          description: 'This is the description',
          image: 'https://example.com/image.png',
          thumb: 'https://example.com/thumb.png',
          parentId: 1);
      await dataSource.insert(data);

      ProductCategoryEntity insertedData = await dataSource.get(data.id);

      ProductCategoryEntity dataToUpdate = ProductCategoryEntity(
          id: insertedData.id,
          title: 'updated title',
          description: 'This is the description',
          image: 'https://example.com/image1.png',
          thumb: 'https://example.com/thumb1.png',
          parentId: 1);

      await dataSource.update(dataToUpdate);

      ProductCategoryEntity updatedData = await dataSource.get(dataToUpdate.id);
      expect(dataToUpdate == updatedData, true);
    });

    test('test: delete all records in ProductCategory table', () async {
      await dataSource.insert(ProductCategoryEntity(
          id: 1,
          title: 'title',
          description: 'This is the description',
          image: 'https://example.com/image.png',
          thumb: 'https://example.com/thumb.png',
          parentId: 1));
      await dataSource.insert(ProductCategoryEntity(
          id: 2,
          title: 'title',
          description: 'This is the description',
          image: 'https://example.com/image2.png',
          thumb: 'https://example.com/thumb2.png',
          parentId: 1));

      await dataSource.insert(ProductCategoryEntity(
          id: 3,
          title: 'title',
          description: 'This is the description',
          image: 'https://example.com/image3.png',
          thumb: 'https://example.com/thumb3.png',
          parentId: 1));
      await dataSource.deleteAll();

      List<ProductCategoryEntity> allRecords = await dataSource.all();
      expect(allRecords.length == 0, true);
    });

    test('test: delete a record in ProductCategory table', () async {
      await dataSource.deleteAll();

      await dataSource.insert(ProductCategoryEntity(
          id: 1,
          title: 'title',
          description: 'This is the description',
          image: 'https://example.com/image.png',
          thumb: 'https://example.com/thumb.png',
          parentId: 1));

      await dataSource.delete(1);

      List<ProductCategoryEntity> allRecords = await dataSource.all();
      expect(allRecords.length == 0, true);
    });

    test('test: get all records in ProductCategory table', () async {
      await dataSource.deleteAll();

      await dataSource.insert(ProductCategoryEntity(
          id: 1,
          title: 'title',
          description: 'This is the description',
          image: 'https://example.com/image.png',
          thumb: 'https://example.com/thumb.png',
          parentId: 1));
      await dataSource.insert(ProductCategoryEntity(
          id: 2,
          title: 'title',
          description: 'This is the description',
          image: 'https://example.com/image2.png',
          thumb: 'https://example.com/thumb2.png',
          parentId: 1));
      await dataSource.insert(ProductCategoryEntity(
          id: 3,
          title: 'title',
          description: 'This is the description',
          image: 'https://example.com/image3.png',
          thumb: 'https://example.com/thumb3.png',
          parentId: 1));

      List<ProductCategoryEntity> allRecords = await dataSource.all();
      expect(allRecords.length == 3, true);
    });

    tearDown(() async {
      await dataSource.close();
    });
  });
}
