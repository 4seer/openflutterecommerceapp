// Product Repositry
// Author: openflutterproject@gmail.com
// Date: 2020-02-06

import 'dart:math';

import 'package:openflutterecommerce/config/theme.dart';
import 'package:openflutterecommerce/data/abstract/model/product.dart';
import 'package:openflutterecommerce/data/abstract/product_repository.dart';
import 'package:openflutterecommerce/data/fake_model/models/product.dart';

class FakeProductRepository extends ProductRepository {
  @override
  Future<FakeProduct> getProduct(int id) async {
    return _productsInside[id];
  }

  @override
  Future<List<FakeProduct>> getFavorites() async {
    return _productsInside.values.where((e) => e.isFavorite).toList();
  }

  @override
  Future addToFavorites(int productId) async {
    _productsInside[productId] =
        _productsInside[productId].changeIsFavorite(true);
  }

  @override
  Future removeFromFavorites(int productId) async {
    _productsInside[productId] =
        _productsInside[productId].changeIsFavorite(false);
  }

  @override
  Future<List<Product>> getProductsInCategory(int categoryId,
      {int pageIndex = 0, int pageSize = AppConsts.PAGE_SIZE}) async {
    if (!productsInCategories.containsKey(categoryId)) {
      productsInCategories[categoryId] = _generateRandomProductList();
    }
    return productsInCategories[categoryId].map((e) => _productsInside[e]).toList();
  }

  @override
  Future<List<Product>> getSimilarProducts(int productId,
      {int pageIndex = 0, int pageSize = AppConsts.PAGE_SIZE}) async {
    final List<int> generatedContent = _generateRandomProductList();
    return generatedContent.map((e) => _productsInside[e]).toList();
  }

  final Map<int, List<int>> productsInCategories = {};

  final Map<int, FakeProduct> _productsInside = {
    1: FakeProduct(
      id: 1,
      localImages: ['assets/thumbs/dress/dress2.png'],
      discountPercent: 20,
      isFavorite: true,
      rating: 5,
      ratingCount: 10,
      price: 15,
      title: 'Evening Dress',
    ),
    2: FakeProduct(
      id: 2,
      localImages: ['assets/thumbs/dress/dress1.png'],
      discountPercent: 15,
      isFavorite: true,
      rating: 5,
      ratingCount: 10,
      price: 22,
      title: 'Short Dress',
    ),
    3: FakeProduct(
      id: 3,
      localImages: ['assets/images/checkout/cart/product1.png'],
      discountPercent: 20,
      isFavorite: false,
      rating: 5,
      ratingCount: 10,
      price: 15,
      title: 'Pullover',
    ),
    4: FakeProduct(
      id: 4,
      localImages: ['assets/images/checkout/cart/product2.png'],
      discountPercent: 20,
      isFavorite: false,
      rating: 5,
      ratingCount: 10,
      price: 15,
      title: 'T-shirt',
    ),
    5: FakeProduct(
      id: 5,
      localImages: ['assets/images/checkout/cart/product2.png'],
      discountPercent: 20,
      isFavorite: false,
      rating: 5,
      ratingCount: 10,
      price: 15,
      title: 'Sport Dress',
    ),
    6: FakeProduct(
      id: 6,
      title: 'Pullover',
      description:
          'Lorem ipsum dolor amet ennui chia synth mixtape wolf forage brooklyn '
          "pug you probably haven't heard of them lumbersexual, iceland tilde. "
          'Poke tumeric readymade brunch, mustache banh mi man bun bushwick '
          'celiac hoodie mumblecore',
      price: 15,
      localImages: ['assets/images/checkout/cart/product1.png'],
      discountPercent: 20,
      isFavorite: false,
      rating: 5,
      ratingCount: 10,
      sizes: ['XS', 'S', 'M', 'L', 'XL'],
      colors: ['Red', 'Black', 'White', 'Yellow'],
    )
  };

  List<int> _generateRandomProductList() {
    final rnd = Random();
    int productCount = rnd.nextInt(6);
    final List<int> result = List(productCount);
    for (int i = 0; i < productCount; i++) {
      result[i] = rnd.nextInt(5) + 1;
    }
    return result;
  }



  FakeProductRepository();
}
