import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:openflutterecommerce/data/local/product/product_image_data_source.dart';
import 'package:openflutterecommerce/domain/entities/product/product_image_entity.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  group('Test ProductImage Data Source', () {
    ProductImageDataSource dataSource;

    setUp(() async {
      dataSource = ProductImageDataSource();
      await dataSource.open();
    });

    test('test: insert and get a record in ProductImage table', () async {
      ProductImageEntity data = ProductImageEntity(
        id: 1,
        title: 'title',
        thumb: 'https://example.com/thumb.png',
        image: 'https://example.com/image.png',
      );
      await dataSource.insert(data);

      ProductImageEntity insertedData = await dataSource.get(data.id);
      expect(data == insertedData, true);
    });

    test('test: update a record in ProductImage table', () async {
      ProductImageEntity data = ProductImageEntity(
        id: 1,
        title: 'title',
        thumb: 'https://example.com/thumb.png',
        image: 'https://example.com/image.png',
      );
      await dataSource.insert(data);

      ProductImageEntity insertedData = await dataSource.get(data.id);

      ProductImageEntity dataToUpdate = ProductImageEntity(
        id: insertedData.id,
        title: 'title',
        thumb: 'https://example.com/thumb2.png',
        image: 'https://example.com/image2.png',
      );

      await dataSource.update(dataToUpdate);

      ProductImageEntity updatedData = await dataSource.get(dataToUpdate.id);
      expect(dataToUpdate == updatedData, true);
    });

    test('test: delete all records in ProductImage table', () async {
      await dataSource.insert(ProductImageEntity(
        id: 1,
        title: 'title',
        thumb: 'https://example.com/thumb.png',
        image: 'https://example.com/image.png',
      ));
      await dataSource.insert(ProductImageEntity(
        id: 2,
        title: 'title',
        thumb: 'https://example.com/thumb2.png',
        image: 'https://example.com/image2.png',
      ));
      await dataSource.insert(ProductImageEntity(
        id: 3,
        title: 'title',
        thumb: 'https://example.com/thumb3.png',
        image: 'https://example.com/image3.png',
      ));

      await dataSource.deleteAll();

      List<ProductImageEntity> allRecords = await dataSource.all();
      expect(allRecords.isEmpty, true);
    });

    test('test: delete a record in ProductImage table', () async {
      await dataSource.deleteAll();

      await dataSource.insert(ProductImageEntity(
        id: 1,
        title: 'title',
        thumb: 'https://example.com/thumb.png',
        image: 'https://example.com/image.png',
      ));

      await dataSource.delete(1);

      List<ProductImageEntity> allRecords = await dataSource.all();
      expect(allRecords.isEmpty, true);
    });

    test('test: get all records in ProductImage table', () async {
      await dataSource.deleteAll();

      await dataSource.insert(ProductImageEntity(
        id: 1,
        title: 'title',
        thumb: 'https://example.com/thumb.png',
        image: 'https://example.com/image.png',
      ));
      await dataSource.insert(ProductImageEntity(
        id: 2,
        title: 'title',
        thumb: 'https://example.com/thumb.png',
        image: 'https://example.com/image.png',
      ));
      await dataSource.insert(ProductImageEntity(
        id: 3,
        title: 'title',
        thumb: 'https://example.com/thumb.png',
        image: 'https://example.com/image.png',
      ));

      List<ProductImageEntity> allRecords = await dataSource.all();
      expect(allRecords.length == 3, true);
    });

    tearDown(() async {
      await dataSource.close();
    });
  });
}
