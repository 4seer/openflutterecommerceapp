import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:openflutterecommerce/local_db/features/product/data_sources/product_data_source.dart';
import 'package:openflutterecommerce/local_db/features/product/entities/product_entity.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  group('Test Product Data Source', () {
    ProductDataSource productDataSource;

    setUp(() async {
      productDataSource = ProductDataSource();
      await productDataSource.open();
    });

    test('test: insert and get product', () async {
      ProductEntity product = ProductEntity(
        id: 1,
        title: 'Product 1',
        image: 'https:example.com/image.png',
        thumb: 'https://example.com/thumbnail.png',
        price: 289.5,
        discountPercent: 5.0,
        isFavourite: true,
        categoryId: 1,
        amount: 255,
        description: 'Best product in the market',
        rating: 4.2,
        rating1Count: 5,
        rating2Count: 4,
        rating3Count: 5,
        rating4Count: 4,
        rating5Count: 4,
      );
      await productDataSource.insert(product);

      ProductEntity insertedProduct = await productDataSource.get(product.id);
      expect(product == insertedProduct, true);
    });

    test('test: update product', () async {
      ProductEntity product = ProductEntity(
        id: 1,
        title: 'Product 1',
        image: 'https:example.com/image.png',
        thumb: 'https://example.com/thumbnail.png',
        price: 289.5,
        discountPercent: 5.0,
        isFavourite: true,
        categoryId: 1,
        amount: 255,
        description: 'Best product in the market',
        rating: 4.2,
        rating1Count: 5,
        rating2Count: 4,
        rating3Count: 5,
        rating4Count: 4,
        rating5Count: 4,
      );
      await productDataSource.insert(product);

      ProductEntity insertedProduct = await productDataSource.get(product.id);

      ProductEntity productToUpdate = ProductEntity(
        id: insertedProduct.id,
        title: 'Product 2',
        image: 'https:example.com/image.png',
        thumb: 'https://example.com/thumbnail.png',
        price: 500,
        discountPercent: 5.0,
        isFavourite: true,
        categoryId: 1,
        amount: 255,
        description: 'Best product in the market',
        rating: 4.2,
        rating1Count: 5,
        rating2Count: 4,
        rating3Count: 5,
        rating4Count: 4,
        rating5Count: 4,
      );

      await productDataSource.update(productToUpdate);

      ProductEntity updatedProduct =
          await productDataSource.get(productToUpdate.id);
      expect(productToUpdate == updatedProduct, true);
    });

    test('test: delete all products', () async {
      await productDataSource.insert(ProductEntity(
        id: 1,
        title: 'Product 1',
        image: 'https:example.com/image.png',
        thumb: 'https://example.com/thumbnail.png',
        price: 289.5,
        discountPercent: 5.0,
        isFavourite: true,
        categoryId: 1,
        amount: 255,
        description: 'Best product in the market',
        rating: 4.2,
        rating1Count: 5,
        rating2Count: 4,
        rating3Count: 5,
        rating4Count: 4,
        rating5Count: 4,
      ));
      await productDataSource.insert(ProductEntity(
        id: 2,
        title: 'Product 2',
        image: 'https:example.com/image2.png',
        thumb: 'https://example.com/thumbnail2.png',
        price: 289.5,
        discountPercent: 5.0,
        isFavourite: true,
        categoryId: 1,
        amount: 255,
        description: 'Best product in the market',
        rating: 4.2,
        rating1Count: 5,
        rating2Count: 4,
        rating3Count: 5,
        rating4Count: 4,
        rating5Count: 4,
      ));
      await productDataSource.insert(ProductEntity(
        id: 3,
        title: 'Product 3',
        image: 'https:example.com/image3.png',
        thumb: 'https://example.com/thumbnail3.png',
        price: 700,
        discountPercent: 5.0,
        isFavourite: true,
        categoryId: 1,
        amount: 255,
        description: 'Best product in the market',
        rating: 4.2,
        rating1Count: 5,
        rating2Count: 4,
        rating3Count: 5,
        rating4Count: 4,
        rating5Count: 4,
      ));

      await productDataSource.deleteAll();

      List<ProductEntity> allProducts = await productDataSource.all();
      expect(allProducts.length == 0, true);
    });

    test('test: delete a product', () async {
      await productDataSource.deleteAll();

      await productDataSource.insert(ProductEntity(
        id: 1,
        title: 'Product 1',
        image: 'https:example.com/image.png',
        thumb: 'https://example.com/thumbnail.png',
        price: 289.5,
        discountPercent: 5.0,
        isFavourite: true,
        categoryId: 1,
        amount: 255,
        description: 'Best product in the market',
        rating: 4.2,
        rating1Count: 5,
        rating2Count: 4,
        rating3Count: 5,
        rating4Count: 4,
        rating5Count: 4,
      ));

      await productDataSource.delete(1);

      List<ProductEntity> allProducts = await productDataSource.all();
      expect(allProducts.length == 0, true);
    });

    test('test: get all products', () async {
      await productDataSource.deleteAll();

      await productDataSource.insert(ProductEntity(
        id: 1,
        title: 'Product 1',
        image: 'https:example.com/image.png',
        thumb: 'https://example.com/thumbnail.png',
        price: 289.5,
        discountPercent: 5.0,
        isFavourite: true,
        categoryId: 1,
        amount: 255,
        description: 'Best product in the market',
        rating: 4.2,
        rating1Count: 5,
        rating2Count: 4,
        rating3Count: 5,
        rating4Count: 4,
        rating5Count: 4,
      ));
      await productDataSource.insert(ProductEntity(
        id: 2,
        title: 'Product 2',
        image: 'https:example.com/image2.png',
        thumb: 'https://example.com/thumbnail2.png',
        price: 289.5,
        discountPercent: 5.0,
        isFavourite: true,
        categoryId: 1,
        amount: 255,
        description: 'Best product in the market',
        rating: 4.2,
        rating1Count: 5,
        rating2Count: 4,
        rating3Count: 5,
        rating4Count: 4,
        rating5Count: 4,
      ));
      await productDataSource.insert(ProductEntity(
        id: 3,
        title: 'Product 3',
        image: 'https:example.com/image3.png',
        thumb: 'https://example.com/thumbnail3.png',
        price: 700,
        discountPercent: 5.0,
        isFavourite: true,
        categoryId: 1,
        amount: 255,
        description: 'Best product in the market',
        rating: 4.2,
        rating1Count: 5,
        rating2Count: 4,
        rating3Count: 5,
        rating4Count: 4,
        rating5Count: 4,
      ));

      List<ProductEntity> allProducts = await productDataSource.all();
      expect(allProducts.length == 3, true);
    });

    tearDown(() async {
      await productDataSource.close();
    });
  });
}
