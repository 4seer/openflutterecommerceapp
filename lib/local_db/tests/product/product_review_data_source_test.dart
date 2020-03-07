import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:openflutterecommerce/local_db/features/product/data_sources/product_review_data_source.dart';
import 'package:openflutterecommerce/local_db/features/product/entities/product_review_entity.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  group('Test ProductReview Data Source', () {
    ProductReviewDataSource dataSource;

    setUp(() async {
      dataSource = ProductReviewDataSource();
      await dataSource.open();
    });

    test('test: insert and get a record in ProductReview table', () async {
      ProductReviewEntity data = ProductReviewEntity(
        id: 1,
        description: 'description',
        productId: 1,
        rating: 4.5,
        hasPhoto: true,
        date: '03-04-2020',
        author: 'Author 1',
        thumb: 'https://example.com/thumb.png',
      );
      await dataSource.insert(data);

      ProductReviewEntity insertedData = await dataSource.get(data.id);
      expect(data == insertedData, true);
    });

    test('test: update a record in ProductReview table', () async {
      ProductReviewEntity data = ProductReviewEntity(
        id: 1,
        description: 'description',
        productId: 1,
        rating: 4.5,
        hasPhoto: true,
        date: '03-04-2020',
        author: 'Author 1',
        thumb: 'https://example.com/thumb.png',
      );
      await dataSource.insert(data);

      ProductReviewEntity insertedData = await dataSource.get(data.id);

      ProductReviewEntity dataToUpdate = ProductReviewEntity(
        id: insertedData.id,
        description: 'description',
        productId: 1,
        rating: 4.9,
        hasPhoto: true,
        date: '06-04-2020',
        author: 'Author 2',
        thumb: 'https://example.com/thumb2.png',
      );

      await dataSource.update(dataToUpdate);

      ProductReviewEntity updatedData = await dataSource.get(dataToUpdate.id);
      expect(dataToUpdate == updatedData, true);
    });

    test('test: delete all records in ProductReview table', () async {
      await dataSource.insert(ProductReviewEntity(
        id: 1,
        description: 'description',
        productId: 1,
        rating: 4.5,
        hasPhoto: true,
        date: '03-04-2020',
        author: 'Author 1',
        thumb: 'https://example.com/thumb.png',
      ));
      await dataSource.insert(ProductReviewEntity(
        id: 2,
        description: 'description',
        productId: 1,
        rating: 4.5,
        hasPhoto: true,
        date: '03-04-2020',
        author: 'Author 1',
        thumb: 'https://example.com/thumb2.png',
      ));
      await dataSource.insert(ProductReviewEntity(
        id: 3,
        description: 'description',
        productId: 1,
        rating: 4.5,
        hasPhoto: true,
        date: '03-04-2020',
        author: 'Author 1',
        thumb: 'https://example.com/thumb3.png',
      ));

      await dataSource.deleteAll();

      List<ProductReviewEntity> allRecords = await dataSource.all();
      expect(allRecords.length == 0, true);
    });

    test('test: delete a record in ProductReview table', () async {
      await dataSource.deleteAll();

      await dataSource.insert(ProductReviewEntity(
        id: 1,
        description: 'description',
        productId: 1,
        rating: 4.5,
        hasPhoto: true,
        date: '03-04-2020',
        author: 'Author 1',
        thumb: 'https://example.com/thumb.png',
      ));

      await dataSource.delete(1);

      List<ProductReviewEntity> allRecords = await dataSource.all();
      expect(allRecords.length == 0, true);
    });

    test('test: get all records in ProductReview table', () async {
      await dataSource.deleteAll();

      await dataSource.insert(ProductReviewEntity(
        id: 1,
        description: 'description',
        productId: 1,
        rating: 4.5,
        hasPhoto: true,
        date: '03-04-2020',
        author: 'Author 1',
        thumb: 'https://example.com/thumb.png',
      ));
      await dataSource.insert(ProductReviewEntity(
        id: 2,
        description: 'description',
        productId: 1,
        rating: 4.5,
        hasPhoto: true,
        date: '03-04-2020',
        author: 'Author 1',
        thumb: 'https://example.com/thumb2.png',
      ));
      await dataSource.insert(ProductReviewEntity(
        id: 3,
        description: 'description',
        productId: 1,
        rating: 4.5,
        hasPhoto: true,
        date: '03-04-2020',
        author: 'Author 1',
        thumb: 'https://example.com/thumb3.png',
      ));
      List<ProductReviewEntity> allRecords = await dataSource.all();
      expect(allRecords.length == 3, true);
    });

    tearDown(() async {
      await dataSource.close();
    });
  });
}
