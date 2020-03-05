import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:openflutterecommerce/local_db/product/data_sources/productreviewphoto_data_source.dart';
import 'package:openflutterecommerce/local_db/product/entities/productreviewphoto_entity.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  group('Test ProductReviewPhoto Data Source', () {
    ProductReviewPhotoDataSource dataSource;

    setUp(() async {
      dataSource = ProductReviewPhotoDataSource();
    });

    test('test: insert and get a record in ProductReviewPhoto table', () async {
      ProductReviewPhotoEntity data = ProductReviewPhotoEntity(
        id: 1,
        reviewId: 1,
        image: 'https://example.com/image.png',
      );
      await dataSource.insert(data);

      ProductReviewPhotoEntity insertedData = await dataSource.get(data.id);
      print(insertedData);
      expect(data == insertedData, true);
    });

    test('test: update a record in ProductReviewPhoto table', () async {
      ProductReviewPhotoEntity data = ProductReviewPhotoEntity(
        id: 1,
        reviewId: 1,
        image: 'https://example.com/image.png',
      );
      await dataSource.insert(data);

      ProductReviewPhotoEntity insertedData = await dataSource.get(data.id);

      ProductReviewPhotoEntity dataToUpdate = ProductReviewPhotoEntity(
        id: insertedData.id,
        reviewId: 1,
        image: 'https://example.com/image2.png',
      );

      await dataSource.update(dataToUpdate);

      ProductReviewPhotoEntity updatedData =
          await dataSource.get(dataToUpdate.id);
      expect(dataToUpdate == updatedData, true);
    });

    test('test: delete all records in ProductReviewPhoto table', () async {
      await dataSource.insert(ProductReviewPhotoEntity(
        id: 1,
        reviewId: 1,
        image: 'https://example.com/image.png',
      ));
      await dataSource.insert(ProductReviewPhotoEntity(
        id: 2,
        reviewId: 1,
        image: 'https://example.com/image2.png',
      ));
      await dataSource.insert(ProductReviewPhotoEntity(
        id: 3,
        reviewId: 1,
        image: 'https://example.com/image3.png',
      ));

      await dataSource.deleteAll();

      List<ProductReviewPhotoEntity> allRecords = await dataSource.all();
      expect(allRecords.length == 0, true);
    });

    test('test: delete a record in ProductReviewPhoto table', () async {
      await dataSource.deleteAll();

      await dataSource.insert(ProductReviewPhotoEntity(
        id: 1,
        reviewId: 1,
        image: 'https://example.com/image.png',
      ));

      await dataSource.delete(1);

      List<ProductReviewPhotoEntity> allRecords = await dataSource.all();
      expect(allRecords.length == 0, true);
    });

    test('test: get all records in ProductReviewPhoto table', () async {
      await dataSource.deleteAll();

      await dataSource.insert(ProductReviewPhotoEntity(
        id: 1,
        reviewId: 1,
        image: 'https://example.com/image.png',
      ));
      await dataSource.insert(ProductReviewPhotoEntity(
        id: 2,
        reviewId: 1,
        image: 'https://example.com/image2.png',
      ));
      await dataSource.insert(ProductReviewPhotoEntity(
        id: 3,
        reviewId: 1,
        image: 'https://example.com/image3.png',
      ));
      List<ProductReviewPhotoEntity> allRecords = await dataSource.all();
      expect(allRecords.length == 3, true);
    });
  });
}
