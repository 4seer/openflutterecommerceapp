import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:openflutterecommerce/local_db/features/product/data_sources/product_parameter_variant_data_source.dart';
import 'package:openflutterecommerce/local_db/features/product/entities/product_parameter_variant_entity.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  group('Test ProductParameterVariant Data Source', () {
    ProductParameterVariantDataSource dataSource;

    setUp(() async {
      dataSource = ProductParameterVariantDataSource();
    });

    test('test: insert and get a record in ProductParameterVariant table',
        () async {
      ProductParameterVariantEntity data = ProductParameterVariantEntity(
        id: 1,
        title: 'title',
        productParameterId: 1,
        additionalPrice: 20.0,
      );
      await dataSource.insert(data);

      ProductParameterVariantEntity insertedData =
          await dataSource.get(data.id);
      expect(data == insertedData, true);
    });

    test('test: update a record in ProductParameterVariant table', () async {
      ProductParameterVariantEntity data = ProductParameterVariantEntity(
        id: 1,
        title: 'title',
        productParameterId: 1,
        additionalPrice: 20.0,
      );
      await dataSource.insert(data);

      ProductParameterVariantEntity insertedData =
          await dataSource.get(data.id);

      ProductParameterVariantEntity dataToUpdate =
          ProductParameterVariantEntity(
        id: insertedData.id,
        productParameterId: 1,
        additionalPrice: 20.0,
        title: 'title',
      );

      await dataSource.update(dataToUpdate);

      ProductParameterVariantEntity updatedData =
          await dataSource.get(dataToUpdate.id);
      expect(dataToUpdate == updatedData, true);
    });

    test('test: delete all records in ProductParameterVariant table', () async {
      await dataSource.insert(ProductParameterVariantEntity(
        id: 1,
        title: 'title',
        productParameterId: 1,
        additionalPrice: 20.0,
      ));
      await dataSource.insert(ProductParameterVariantEntity(
        id: 2,
        title: 'title',
        productParameterId: 1,
        additionalPrice: 50.0,
      ));
      await dataSource.insert(ProductParameterVariantEntity(
        id: 3,
        title: 'title',
        productParameterId: 1,
        additionalPrice: 40.0,
      ));

      await dataSource.deleteAll();

      List<ProductParameterVariantEntity> allRecords = await dataSource.all();
      expect(allRecords.length == 0, true);
    });

    test('test: delete a record in ProductParameterVariant table', () async {
      await dataSource.deleteAll();

      await dataSource.insert(ProductParameterVariantEntity(
        id: 1,
        title: 'title',
        productParameterId: 1,
        additionalPrice: 20.0,
      ));

      await dataSource.delete(1);

      List<ProductParameterVariantEntity> allRecords = await dataSource.all();
      expect(allRecords.length == 0, true);
    });

    test('test: get all records in ProductParameterVariant table', () async {
      await dataSource.deleteAll();

      await dataSource.insert(ProductParameterVariantEntity(
        id: 1,
        title: 'title',
        productParameterId: 1,
        additionalPrice: 20.0,
      ));
      await dataSource.insert(ProductParameterVariantEntity(
        id: 2,
        title: 'title',
        productParameterId: 1,
        additionalPrice: 20.0,
      ));
      await dataSource.insert(ProductParameterVariantEntity(
        id: 3,
        title: 'title',
        productParameterId: 1,
        additionalPrice: 20.0,
      ));

      List<ProductParameterVariantEntity> allRecords = await dataSource.all();
      expect(allRecords.length == 3, true);
    });
  });
}
